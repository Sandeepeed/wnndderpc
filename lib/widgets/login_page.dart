import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import '../google_sign_in.dart';
import 'AppLargeText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const colorizeColors = [
    AppColours.green,
    AppColours.blue,
    Colors.yellow,
    Colors.red,
  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Astro',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,left: 5),
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText("WNNDERPC",
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                app_large_text(text: 'Sign Up To Get Started', color: AppColours.green,size: 20,),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.height*1,
                  child: Lottie.asset("assets/developer.json"),
                ),
                const SizedBox(height: 40,),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: AppColours.green,
                      minimumSize: Size(MediaQuery.of(context).size.width*0.70,50),
                    ),
                    onPressed: (){
                      final provider =
                          Provider.of<GoogleSignInProvider>(context,listen:false);
                          provider.googleLogin();
                    },
                    icon: const FaIcon(FontAwesomeIcons.google,),
                    label: const Text("Sign Up using Google",style: TextStyle(
                      color: AppColours.blue,
                      fontWeight: FontWeight.bold,
                    ),)),
                const SizedBox(height: 10,),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width*0.70,50),
                    ),
                    onPressed: (){
                      //   final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      //   provider.googleLogin();
                      //
                    },
                    icon: const FaIcon(FontAwesomeIcons.apple,color: Colors.black,),
                    label: const Text("Sign Up using Apple ID",
                    style: TextStyle(
                      color: AppColours.blue,
                      fontWeight: FontWeight.bold,
                    ),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
