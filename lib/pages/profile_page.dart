import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget textField({required String hintText, required String gfield}){
    return Material(
      elevation:4,
      color: Colors.black45,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
              hintText: hintText + "    " + gfield,
              hintStyle: const TextStyle(
              letterSpacing: 1,
            color: AppColours.green,
            fontWeight: FontWeight.bold,
            fontFamily: "Astro",
                fontSize: 12
        ),
          fillColor: AppColours.black,
          filled: true ,
        ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        backgroundColor: AppColours.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff555555),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
            iconSize: 20
            ,onPressed: () {
              Navigator.of(context).pop();
          },
          ),
        ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: size.height * .55,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textField(hintText: "User Name:"  , gfield: user.displayName!),
                    textField(hintText: "Email-ID : ", gfield:  user.email!),
                    textField(hintText: "Email Verification : ", gfield: user.emailVerified? "Verified" : "Not Verified")
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: SizedBox(
              width: size.width,
              height: size.height,
            ),
            painter: HeaderCurvedCOntainer()
          ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,fontFamily: "Astro",
                    color: AppColours.green
                  ),
                ),),
                Container(
                  width: size.width / 3,
                  height: size.width/3,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColours.green,width: 3 ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.photoURL!),
                      fit: BoxFit.fitWidth
                    )


                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
class HeaderCurvedCOntainer extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff555555);
    Path path = Path()..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width/2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
      canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> false;


}