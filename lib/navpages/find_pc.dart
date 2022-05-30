import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';


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
