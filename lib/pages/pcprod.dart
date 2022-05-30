import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/pcnavpages/cartpc.dart';
import 'package:wnndderpc/widgets/AppLargeText.dart';
import '../ContentPages/pc.dart';
import '../pcnavpages/comparepc.dart';

class PCProductPage extends StatefulWidget {
  String image, grcard, mem, memtype, proccesor, ram, name, stars, price;

  PCProductPage(
      {Key? key,
        required this.name,
        required this.stars,
        required this.image,
        required this.grcard,
        required this.mem,
        required this.memtype,
        required this.proccesor,
        required this.ram,
        required this.price})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

const Color transparent = Color(0x00000000);

class _ProductPageState extends State<PCProductPage> {
  Future addCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("pc-users-cart-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget.name,
      "price": widget.price,
      "images": widget.image,
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                top: -20,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width * 0.5,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        scale: 2.0,
                        image: NetworkImage(widget.image),
                        fit: BoxFit.scaleDown),
                  ),
                )),
            Positioned(
                left: 10,
                top: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPC()));
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: size.width * 0.73,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPC()));
                      },
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.black,
                    ),
                  ],
                )),
            Positioned(
                top: size.height * 0.35,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  decoration: const BoxDecoration(
                      color: AppColours.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name.substring(0, 19) +
                                " \n" +
                                widget.name.substring(19),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: "Astro",
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      app_large_text(
                        text: widget.price.toString().length > 5? '\u{20B9}' + widget.price.toString()[0] + "," + widget.price.toString().substring(1,3) + "," + widget.price.toString().substring(3)
                            : '\u{20B9}' + widget.price.toString().substring(0,2) + "," + widget.price.toString().substring(2,),
                        color: Colors.white70,
                        size: 22,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star,
                              color: index < int.parse(widget.stars)
                                  ? Colors.yellow
                                  : Colors.grey);
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: app_large_text(
                            text: "Specifications",
                            color: Colors.grey,
                            size: 20,
                          )),
                      const Divider(
                        color: Colors.white70,
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Graphics Card: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                  Text(
                                    widget.grcard,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Memory: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                  Text(
                                    widget.mem,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Memory Type: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                  Text(
                                    widget.memtype,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Processor: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                  Text(
                                    widget.proccesor,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "RAM: ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                  Text(
                                    widget.ram,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "LatoBold"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              addCart();
                              final snackbar = SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.only(bottom: 10),
                                backgroundColor: Colors.white,
                                content: const Text(
                                  "Added To Cart!",
                                  style: TextStyle(color: AppColours.blue),
                                ),
                                action: SnackBarAction(
                                  label: "View Cart",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const CartPC()));
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            },
                            child: Container(
                              margin: EdgeInsets.zero,
                              height: size.height * 0.07,
                              width: size.width * 0.4,
                              decoration: const BoxDecoration(
                                color: AppColours.green,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                        fontFamily: "Astro", fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.shopping_cart,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ComparePC(
                                image: widget.image,
                                grcard: widget.grcard,
                                mem: widget.mem,
                                memtype: widget.memtype,
                                proccesor: widget.proccesor,
                                ram: widget.ram,
                                stars:widget.stars,
                                name: widget.name,
                                price: widget.price.toString().length > 5? '\u{20B9}' + widget.price.toString()[0] + "," + widget.price.toString().substring(1,3) + "," + widget.price.toString().substring(3)
                                    : '\u{20B9}' + widget.price.toString().substring(0,2) + "," + widget.price.toString().substring(2,),
                              )));
                            },
                            child: Container(
                              margin: EdgeInsets.zero,
                              height: size.height * 0.07,
                              width: size.width * 0.4,
                              decoration: const BoxDecoration(
                                color: AppColours.green,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Compare",
                                    style: TextStyle(
                                        fontFamily: "Astro", fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.compare_arrows,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
