import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/pages/profile_page.dart';
import 'package:wnndderpc/widgets/AppLargeText.dart';
import 'package:wnndderpc/widgets/app_medtext.dart';

class PlaceOrders extends StatefulWidget {
  const PlaceOrders({Key? key}) : super(key: key);

  @override
  State<PlaceOrders> createState() => _PlaceOrdersState();
}

class _PlaceOrdersState extends State<PlaceOrders> {
  final Completer<GoogleMapController> _controller = Completer();
  LocationData? currentPos;
  LatLng? _latLng;
  bool locating = false;
  geocoding.Placemark? place;
  int currentStep = 0;
  bool isCompleted = false;
  bool textFlag = false;
  TextEditingController myController = TextEditingController();
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController myController3 = TextEditingController();
  TextEditingController myController4 = TextEditingController();
  TextEditingController myController5 = TextEditingController();


  @override
  void dispose() {
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    super.dispose();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.644800, 77.216721),
    zoom: 14.476,
  );
  @override
  void initState() {
    _getUserLocation();
    super.initState();
  }

  Future<LocationData> _getLocationPermission() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error("Service Not Enabled");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error("Permission Denied");
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  _getUserLocation() async {
    currentPos = await _getLocationPermission();

    _goToCurrentPos(LatLng(currentPos!.latitude!, currentPos!.longitude!));
  }//address Location convert
  getUserAddress()
  async {
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(_latLng!.latitude, _latLng!.longitude);

    setState(() {
      place = placemarks.first;
    });
    

  }//latitude,longitude
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            )),
        elevation: 0,
        backgroundColor: AppColours.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: app_large_text(
              text: "Enter Details",
              size: 18,
              color: AppColours.green,
              FontFamily: "Astro",
            )),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
          ],
        ),
      ),
      body: Theme(
        data: ThemeData(
          canvasColor: AppColours.black,
      accentColor: AppColours.green,
    backgroundColor: AppColours.green,
    colorScheme: const ColorScheme.light(
    primary: AppColours.green,
      secondary: AppColours.black

    ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            steps: getSteps(),
            controlsBuilder:(BuildContext context, ControlsDetails controls) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250,),
                  if(currentStep!= 0)
                  Container(
                    color: AppColours.green,
                    width: size.width*0.42,
                    child: TextButton(
                      onPressed: controls.onStepCancel,
                      child: const Text('Cancel',style: TextStyle(fontSize: 20,color: AppColours.blue)),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    color: AppColours.green,
                    width: currentStep==0? size.width * 0.8 : size.width*0.42,
                    child: TextButton(
                      onPressed:controls.onStepContinue,
                      child: const Text('Next',style: TextStyle(fontSize: 20,color: AppColours.blue),),
                    ),
                  ),
                ],
              );
            },
            currentStep: currentStep,
            onStepContinue: (){
              final isLastStep = currentStep ==getSteps().length - 1;
              if(isLastStep)
                {
                  setState(() => isCompleted = true);
                }
              else {
                setState(() {
                  myController1.text.isNotEmpty || myController.text.isNotEmpty || myController3.text.isNotEmpty||
                      myController4.text.isNotEmpty|| myController5.text.isNotEmpty? currentStep += 1:
                  Fluttertoast.showToast(
                      msg: "Enter Address To Proceed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.white,
                      textColor: AppColours.black,
                      fontSize: 16.0
                  );
              });
              }
            },
            onStepCancel: (){
              setState(() {
                currentStep == 0? null: currentStep -= 1;
              });
            },
          ),
        ),
      )
    );
  }
  List<Step> getSteps() =>[
    Step(
      state: currentStep == 1? StepState.complete:StepState.indexed,
      isActive: currentStep >= 0,
      content: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Stack(
            children: [
              GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.terrain,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onCameraIdle: (){
                    locating = false;
                  },
                  onCameraMove: (CameraPosition position) {
                    setState(() {
                      locating = true;
                      _latLng = position.target;
                    });
                    getUserAddress();
                  }),

              const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.my_location,
                    size: 20,
                    color: Colors.orangeAccent,
                  )),
            ],
          ),
        ),
        app_large_text(text: _latLng == null? "Locating...." : place == null? " " :  place!.country! , color: AppColours.green,size: 12,),
        //Text(locating ?'locating....': place!.locality!),
        // Text(place?.name == null ? "" : place!.name!),
        // Text(place?.thoroughfare == null? "" : place!.thoroughfare!),
        // Text(_latLng?.latitude == null?"" : _latLng!.latitude.toString()),
        // Text(_latLng?.longitude == null?"" : _latLng!.longitude.toString())
         TextFormField(
          controller: myController,
          maxLength: 20,
          decoration:  const InputDecoration(
            icon: Icon(Icons.location_history_rounded,color: AppColours.green,),
            hintText: "Address Line 1",
            fillColor: AppColours.green,
            filled: true,
            hintStyle: TextStyle(color: AppColours.blue),
            border: OutlineInputBorder(
              borderSide:  BorderSide(width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )
            )
          ),
        ),
        const SizedBox(height: 20,),
          TextFormField(
           controller: myController1,
          maxLength: 20,
          decoration: const InputDecoration(
              icon:  Icon(Icons.location_history_rounded,color: AppColours.green,),
              hintText: "Address Line 2",
              fillColor: AppColours.green,
              filled: true,
              hintStyle: TextStyle(color: AppColours.blue),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              )
          ),
        ),
        const SizedBox(height: 10,),
          TextFormField(
            controller: myController2,
          keyboardType: const TextInputType.numberWithOptions(),
          maxLength: 20,
          decoration: const InputDecoration(
              icon: Icon(Icons.local_post_office,color: AppColours.green,),
              hintText: "Postal Code",
              fillColor: AppColours.green,
              filled: true,
              hintStyle: TextStyle(color: AppColours.blue),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )
              )
          ),
        ),
      ],
    ), title: const Text("Address",style: TextStyle(color: AppColours.green),),),//gmaps
    Step(
        state: currentStep == 2? StepState.complete:StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Details",style: TextStyle(color: AppColours.green)), content: Column(
        children: [
          TextFormField(
            controller: myController3,
            keyboardType: TextInputType.name,
            maxLength: 20,
            decoration: const InputDecoration(
                icon: Icon(Icons.account_circle_rounded,color: AppColours.green,),
                hintText: "Name Of Receiver",
                fillColor: AppColours.green,
                filled: true,
                hintStyle: TextStyle(color: AppColours.blue),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )
                )
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: myController4,
            keyboardType: const TextInputType.numberWithOptions(),
            maxLength: 20,
            decoration: const InputDecoration(
                icon: Icon(Icons.phone,color: AppColours.green,),
                hintText: "Phone Number",
                fillColor: AppColours.green,
                filled: true,
                hintStyle: TextStyle(color: AppColours.blue),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )
                )
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: myController5,
            keyboardType: const TextInputType.numberWithOptions(),
            maxLength: 20,
            decoration: const InputDecoration(
                icon: Icon(Icons.timer,color: AppColours.green,),
                hintText: "Schedule Delivery Time",
                fillColor: AppColours.green,
                filled: true,
                hintStyle: TextStyle(color: AppColours.blue),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )
                )
            ),
          ),
          SizedBox(height: 100,)
        ],
    )),
    Step(
        state: currentStep == 3? StepState.complete:StepState.indexed,
      isActive: currentStep >= 2,
        title: const Text("Complete Order",style: TextStyle(color: AppColours.green)), content: Column(
      children: [
        app_large_text(text: "Confirm Order Details", color: AppColours.green, FontFamily: "Astro",size: 20,),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          app_med_text(text: "Name: ", color: AppColours.green,size: 15,),
            app_med_text(text: myController3.text, color: AppColours.green,size: 15,),
        ],),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            app_med_text(text: "Phone Number: ", color: AppColours.green,size: 15,),
            app_med_text(text: myController4.text, color: AppColours.green,size: 15,),
          ],),
        const SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            app_med_text(text: "Address:  ", color: AppColours.green,size: 15,),
            app_med_text(text: myController.text+"\n"+myController1.text+"\n"+myController2.text, color: AppColours.green,size: 15,),
          ],),
        const SizedBox(height: 80,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            app_med_text(text: "Exact Location: ", color: AppColours.green,size: 15,),
            app_med_text(text:  _latLng == null? "0":_latLng!.longitude.toString()+"\n"+_latLng!.latitude.toString(), color: AppColours.green,size: 15,),
          ],),
        const SizedBox(height: 30,),

      ],
    ))
  ];


  Future<void> _goToCurrentPos(LatLng latLng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(latLng.latitude, latLng.longitude),
        //tilt: 59.440717697143555,
        zoom: 18)));
  }
}

