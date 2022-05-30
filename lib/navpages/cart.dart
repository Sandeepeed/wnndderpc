import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/pages/mainLaptop.dart';
import 'package:wnndderpc/pages/placeorder.dart';

import 'package:wnndderpc/widgets/app_medtext.dart';

import '../widgets/AppLargeText.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var total;
  late int length;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 125),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.orangeAccent,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainLaptop()));
                  },
                ),
                Center(
                    child: app_large_text(
                  text: "Your Cart",
                  size: 22,
                  color: Colors.orangeAccent,
                  FontFamily: "Astro",
                )),
              ],
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users-cart-items")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("items")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  length = snapshot.data!.docs.length;
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        physics: const BouncingScrollPhysics(),
                        cacheExtent: 200.0,
                        itemExtent: 180,
                        itemBuilder: (context, index) {
                          DocumentSnapshot _documentSnapshot =
                              snapshot.data!.docs[index];
                          return Card(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            color: Colors.grey[900],
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    width: size.width * 0.3,
                                    height: size.height * 0.1,
                                    decoration: const BoxDecoration(),
                                    child: Image(
                                      fit: BoxFit.scaleDown,
                                      image: NetworkImage(
                                          _documentSnapshot['images']),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          _documentSnapshot['name']
                                                  .toString()
                                                  .substring(0, 25) +
                                              "\n" +
                                              _documentSnapshot['name']
                                                  .toString()
                                                  .substring(23),
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontFamily: "Astro",
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "  \u{20B9}" +
                                            _documentSnapshot['price'],
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 180.0,
                                          top: 20,
                                        ),
                                        child: IconButton(
                                          iconSize: 20,
                                          icon: const Icon(Icons.delete),
                                          color: Colors.orangeAccent,
                                          onPressed: () {
                                            final snackbar = SnackBar(
                                              duration:
                                                  const Duration(seconds: 2),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              backgroundColor: Colors.white,
                                              content: const Text(
                                                "Removed From Cart!",
                                                style: TextStyle(
                                                    color: AppColours.blue),
                                              ),
                                              action: SnackBarAction(
                                                label: "Dismiss",
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                },
                                              ),
                                            );
                                            FirebaseFirestore.instance
                                                .collection("users-cart-items")
                                                .doc(FirebaseAuth.instance
                                                    .currentUser!.email)
                                                .collection("items")
                                                .doc(_documentSnapshot.id)
                                                .delete();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
          SizedBox(
            height: size.height * 0.16,
            width: size.width,
            child: Card(
              color: Colors.black12,
              margin: EdgeInsets.zero,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                     left: 10, right: 10, top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        app_large_text(
                          text: "Total Price:",
                          color: Colors.orangeAccent,
                          FontFamily: "Astro",
                          size: 14,
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users-cart-items")
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection("items")
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else {
                              total = 0;
                              snapshot.data?.docs.forEach((element) {
                                total += int.parse(element['price']);
                              });
                              return app_med_text(
                                text: '\u{20B9}' + total.toString(),
                                color: Colors.orangeAccent,
                                size: 14,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceOrders()));
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.05,
                        color: Colors.orangeAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.black87,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            app_med_text(
                              text: "Place Order",
                              color: Colors.black87,
                              FontFamily: "Astro",
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
