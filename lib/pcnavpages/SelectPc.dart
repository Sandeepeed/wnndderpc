import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/pcnavpages/comparepc.dart';
import '../colors.dart';

class SelectPC extends StatefulWidget {
  const SelectPC({Key? key}) : super(key: key);

  @override
  State<SelectPC> createState() => _SelectPCState();
}
final CollectionReference _firebaseFirestore =
FirebaseFirestore.instance.collection("pcs");
class _SelectPCState extends State<SelectPC> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: StreamBuilder(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.size,
                  physics: const BouncingScrollPhysics(),
                  cacheExtent: 200.0,
                  itemExtent: 180,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot lap = snapshot.data?.docs[index]
                    as DocumentSnapshot<Object?>;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComparePC(name: lap['name'], stars: lap['ratings'], image: lap['image'], grcard: lap['graphic'], mem: lap['mem'], memtype: lap['memtype'], proccesor: lap['proccesor'], ram: lap['ram'], price: lap['price'])));
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
                                      image: NetworkImage(lap['image'])),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lap['name'].toString().length < 24?lap['name']:
                                      lap['name']
                                          .toString()
                                          .substring(0, 24) +
                                          "\n" +
                                          lap['name']
                                              .toString()
                                              .substring(24)
                                      ,
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
                                    Text(
                                      lap['price'].toString().length > 5
                                          ? '\u{20B9}' +
                                          lap['price'].toString()[0] +
                                          "," +
                                          lap['price']
                                              .toString()
                                              .substring(1, 3) +
                                          "," +
                                          lap['price']
                                              .toString()
                                              .substring(3)
                                          : '\u{20B9}' +
                                          lap['price']
                                              .toString()
                                              .substring(0, 2) +
                                          "," +
                                          lap['price']
                                              .toString()
                                              .substring(
                                            2,
                                          ),
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
      ),
    );
  }
}
