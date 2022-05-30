import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wnndderpc/pages/mainLaptop.dart';
import 'package:wnndderpc/ContentPages/pc.dart';
import 'package:wnndderpc/ContentPages/pc_parts.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/widgets/app_medtext.dart';
import 'package:wnndderpc/widgets/content_button.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  static const colorizeColors = [
    AppColours.green,
    AppColours.blue,
    Colors.yellow,
    Colors.red,
  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    letterSpacing: 0.5,
    fontFamily: 'Astro',
  );
  bool _isBlur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/BackGround-min.jpg"),
          fit: BoxFit.cover,
        )),
        height: double.maxFinite,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130.0,left: 100),
                child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText("Select Category: ",
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors),
                    ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBlur = !_isBlur;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const MainLaptop()));
                      },
                      child: GlassButton(
                        blur: _isBlur ? 28 : 0,
                        opacity: 0.25,
                        child: Lottie.network(
                            "https://assets1.lottiefiles.com/packages/lf20_1elvfrxr.json"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBlur = !_isBlur;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPC()));
                      },
                      child: GlassButton(
                        blur: _isBlur ? 28 : 0,
                        opacity: 0.25,
                        child: Lottie.network(
                          "https://assets4.lottiefiles.com/packages/lf20_lpsLVC.json",
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.width * 0.35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  app_med_text(
                    text: "Laptops",
                    color: AppColours.green,
                    size: 18,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  app_med_text(
                    text: "Custom Built PC's",
                    color: AppColours.green,
                    size: 18,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBlur = !_isBlur;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PC_Parts()));
                      },
                      child: GlassButton(
                        blur: _isBlur ? 15 : 0,
                        opacity: 0.1,
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 500,
                            child: Lottie.network(
                            "https://assets10.lottiefiles.com/packages/lf20_anvjxyyq.json",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  app_med_text(
                    text: "PC Parts",
                    color: AppColours.green,
                    size: 18,
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
