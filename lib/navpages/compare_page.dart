import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/navpages/find_pc.dart';
import 'package:wnndderpc/pages/mainLaptop.dart';
import 'package:wnndderpc/widgets/AppLargeText.dart';
import 'package:wnndderpc/widgets/app_medtext.dart';
import '../pages/profile_page.dart';

class Compare extends StatefulWidget {
  final String image, grcard, mem, memtype, proccesor, ram, rrate, name, stars, price;

    const Compare({Key? key,
    required this.name,
    required this.stars,
    required this.image,
    required this.grcard,
    required this.mem,
    required this.memtype,
    required this.proccesor,
    required this.ram,
    required this.rrate,
    required this.price,

  }) : super(key: key);
  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  final user = FirebaseAuth.instance.currentUser!;
  String image1 = '', grcard1 = '', mem1 = '', memtype1 = '', proccesor1 = '', ram1 = '', rrate1= '',
      name1 = '', stars1 = '', price1 = '';
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery
        .of(context)
        .size;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MainLaptop()));
            },
            ),
            backgroundColor: AppColours.black,
            title: Padding(
              padding: const EdgeInsets.only(top: 6.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  app_large_text(text: "Compare", color: AppColours.green,FontFamily: "Astro",),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user.photoURL!)
                      ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        backgroundColor: AppColours.black,
        body: SizedBox(
          width: size.width,
        height: size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0,left: 7),
              child: SizedBox(
                width: size.width/4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    app_med_text(text: "Name:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 28,),
                    app_med_text(text: "Ratings:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "Graphics\nCard:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "Memory:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "Memory\ntype:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "Price:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "Processor:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "Refresh Rate:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                    app_med_text(text: "RAM:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: AppColours.blue,
                  boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 1.0,
                    spreadRadius: 0.0,
                    offset: Offset(3.0, 2.0),
                  )
                ]
                ),
              margin: EdgeInsets.zero,
              width: size.width/3,
              height: size.height / 1.1,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: size.width/3,
                    height: size.height / 9,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(widget.image),
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: app_med_text(text: widget.name.isEmpty? "None" : widget.name, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 10,),
                  Wrap(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star,
                          color: index < int.parse(widget.stars)
                              ? Colors.yellow
                              : Colors.grey);
                    }),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.grcard, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.mem, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 55,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.memtype, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.price, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.proccesor, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.rrate, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.ram, color: AppColours.green,size: 15,),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              decoration: const BoxDecoration(
                  color: AppColours.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset: Offset(3.0, 2.0),
                    )
                  ]
              ),
              margin: EdgeInsets.zero,
              width: size.width/3,
              height: size.height / 1.1,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: ()  {
                      _awaitReturnValueFromSecondScreen(context);
                      setState(() {
                        name1 = map['name1'];
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: size.width/3,
                      height: size.height / 9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(widget.image),
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: app_med_text(text: name1, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 10,),
                  Wrap(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star,
                          color: index < int.parse(widget.stars)
                              ? Colors.yellow
                              : Colors.grey);
                    }),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: grcard1, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.mem, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 55,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.memtype, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.price, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.proccesor, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.rrate, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.ram, color: AppColours.blue,size: 15,),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
        );
  }
}
void _awaitReturnValueFromSecondScreen(BuildContext context) async {
  // start the SecondScreen and wait for it to finish with a result
  final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectLaptop(),));


}
class SelectLaptop extends StatefulWidget {

  const SelectLaptop({Key? key}) : super(key: key);

  @override
  State<SelectLaptop> createState() => _SelectLaptopState();
}
Map map = {};
final CollectionReference _firebaseFirestore =
FirebaseFirestore.instance.collection("laptops");
class _SelectLaptopState extends State<SelectLaptop> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), onPressed: () {
          Navigator.of(context).pop();
        },
        ),
      ),
      backgroundColor: AppColours.black,
      body: StreamBuilder(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData)
          {
            return const Center(child: CircularProgressIndicator(
              color: Colors.orangeAccent,
            ),);
          }
          else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.size,
                      physics: const BouncingScrollPhysics(),
                      cacheExtent: 200.0,
                      itemExtent: 180,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        DocumentSnapshot lap = snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                        return GestureDetector(
                          onTap: (){
                            Map map = {
                              'image' : lap['image'],
                              'grcard' : lap['grcard'],
                              'mem' : lap['mem'],
                              'proccesor' : lap['proccesor'],
                              'ram' : lap['ram'],
                              'rrate' : lap['rrate'],
                              'name' : lap['name'],
                              'stars' : lap['stars'],
                              'price' : lap['price'],
                            };
                            Navigator.pop(context,map);
                          },
                          child: GestureDetector(
                            onTap: ()=> Navigator.of(context).pop(map),
                            child: Card(
                              elevation: 20,
                              shadowColor: Colors.black,
                              margin: const EdgeInsets.only(top: 9,left: 10,right: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.black87,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 30),
                                      height: size.height * 0.12,
                                      width: size.width * 0.25,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                lap['image']
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            lap['name'].toString().substring(0,25) + "\n" + lap['name'].toString().substring(26),
                                            textAlign: TextAlign.start,

                                            style: const TextStyle(
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),

                                          //'\u{20B9}'
                                          Text(lap['price'].toString().length > 5? '\u{20B9}' + lap['price'].toString()[0] + "," + lap['price'].toString().substring(1,3) + "," + lap['price'].toString().substring(3)
                                              : '\u{20B9}' + lap['price'].toString().substring(0,2) + "," + lap['price'].toString().substring(2,),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}





