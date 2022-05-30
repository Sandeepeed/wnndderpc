import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/ContentPages/pc.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/widgets/AppLargeText.dart';
import 'package:wnndderpc/widgets/app_medtext.dart';
import '../pages/profile_page.dart';
import 'SelectPc.dart';
class ComparePC extends StatefulWidget {
  final String image, grcard, mem, memtype, proccesor, ram, name, stars, price;

  const ComparePC({Key? key,
    required this.name,
    required this.stars,
    required this.image,
    required this.grcard,
    required this.mem,
    required this.memtype,
    required this.proccesor,
    required this.ram,
    required this.price, image1, grcard1, mem1, memtype1, proccesor1, ram1, stars1, price1, name1
  }) : super(key: key);
  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<ComparePC> {
  final user = FirebaseAuth.instance.currentUser!;


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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPC()));
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
              padding: const EdgeInsets.only(top: 130.0,left: 7),
              child: SizedBox(
                width: size.width/4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    app_med_text(text: "Name:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "Ratings:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "Graphics\nCard:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "Memory:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "Memory\ntype:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "Price:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "Processor:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
                    app_med_text(text: "RAM:", color: AppColours.green,size: 18,FontFamily: "LatoBold",),
                    const SizedBox(height: 30,),
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
                    child: app_med_text(text: widget.name == null? "None" : widget.name, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 40,),
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
                    child: app_med_text(text: widget.grcard == null? "None":widget.grcard , color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 55,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.mem== null? "None":widget.mem, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.memtype== null? "None":widget.memtype, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.price== null? "None":widget.price, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.proccesor== null? "None":widget.proccesor, color: AppColours.green,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.ram== null? "None":widget.ram, color: AppColours.green,size: 15,),
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
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: size.width/3,
                    height: size.height / 9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(widget.image== null? "None":widget.image),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: app_med_text(text: widget.name == null? "None" : widget.name, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 40,),
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
                    child: app_med_text(text: widget.grcard== null? "None":widget.grcard, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.mem== null? "None": widget.mem,color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.memtype== null? "None":widget.memtype, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text:widget.price == null? "None" : widget.price.toString().length > 5? '\u{20B9}' + widget.price.toString()[0] + "," + widget.price.toString().substring(1,3) + "," + widget.price.toString().substring(3)
                        : '\u{20B9}' + widget.price.toString().substring(0,2) + "," + widget.price.toString().substring(2,), color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.proccesor== null? "None":widget.proccesor, color: AppColours.blue,size: 15,),
                  ),
                  const SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: app_med_text(text: widget.ram== null? "None":widget.ram, color: AppColours.blue,size: 15,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 5),
                    child: RaisedButton.icon(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectPC(
                      )));
                    }, icon: const Icon(Icons.compare_arrows,color: AppColours.green,), label: const Text("Compare", style: TextStyle(color: AppColours.green),), color: AppColours.blue,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
