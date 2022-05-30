import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wnndderpc/pages/homepage.dart';
import 'package:wnndderpc/pages/product_page.dart';
import 'package:wnndderpc/pages/profile_page.dart';
import 'package:wnndderpc/widgets/app_medtext.dart';


class Laptops extends StatefulWidget {
  const Laptops({Key? key}) : super(key: key);

  @override
  _LaptopsState createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops> {
  int compare = 0;
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("laptops");

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                }, icon: const Icon(Icons.arrow_back_ios),color: Colors.white,),
                const Text(
                  "WNDDERPC",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: "Astro",
                    color: AppColours.green,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,

                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                ),
              ],
            ),//AppBar
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              alignment: Alignment.topCenter,
              width: size.width,
              height: closeTopContainer ? 0 : size.height * 0.33,
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: app_med_text(
                        text:
                            "Buy exclusive laptops\nwith wide variety of options",
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColours.green,
                      ),
                      height: size.height * 0.25,
                      width: size.width * 0.9,
                    )
                  ],
                ),
              ),
            ),
          ),//Image Container
          StreamBuilder(
            stream: _firebaseFirestore.snapshots().asBroadcastStream(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(!snapshot.hasData)
                {
                    return const Center(child: CircularProgressIndicator(
                      color: Colors.orangeAccent,
                    ),);

                }
              else {
                return Expanded(

                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.size,
                      physics: const BouncingScrollPhysics(),
                      cacheExtent: 200.0,
                      itemExtent: 180,
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        DocumentSnapshot lap = snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductPage(
                                image: lap['image'],
                                grcard: lap['graphic'],
                                mem: lap['mem'],
                                memtype: lap['memtype'],
                                proccesor: lap['proccesor'],
                                ram: lap['ram'],
                                rrate: lap['refresh'], stars:
                                lap['ratings'], name: lap['name'], price: lap['price'],)));
                          },
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.black,
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: AppColours.black,
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
                        );
                      }),
                );
              }
            },
          ),//Cards
        ],
      ),
    );
  }
}
