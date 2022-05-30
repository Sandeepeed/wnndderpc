import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wnndderpc/pages/homepage.dart';
import 'package:wnndderpc/widgets/video_widget.dart';
import '../colors.dart';
import '../widgets/AppLargeText.dart';
import '../widgets/login_page.dart';
import '../widgets/responsive_button.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({Key? key}) : super(key: key);

  @override
  _Welcome_pageState createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
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
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return index == 0
                ? Stack(
                    children: [
                      VideoApp(
                        url: "videos/back1.mov",
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 2.0, top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedTextKit(
                                  animatedTexts: [
                                    ColorizeAnimatedText("WNNDERPC",
                                        textStyle: colorizeTextStyle,
                                        colors: colorizeColors),
                                  ],
                                  repeatForever: true,
                                  isRepeatingAnimation: true,
                                ),
                                Column(
                                  children: List.generate(3, (index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 8,
                                      height: index == 0 ? 25 : 8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColours.green),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 120, left: 15),
                                      child: app_large_text(
                                        text:
                                            "Build Your Own Custom PC’s\nExclusively available in India.",
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 190.0,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
                                          );
                                        },
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()),
                                            );
                                          },
                                          child: ResponsiveButton(
                                            text: "Get Started",
                                            width: 140,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : index == 1
                    ? Stack(
                        children: [
                          VideoApp(
                            url: "videos/back3.mov",
                          ),
                          Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.0, top: 60),
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
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2.0, top: 60),
                                    child: Column(
                                      children: List.generate(3, (index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          width: 8,
                                          height: index == 1 ? 25 : 8,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: AppColours.green),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              // Container(
                              //   margin: const EdgeInsets.only(top: 130),
                              //   height: MediaQuery.of(context).size.height *0.75,
                              //   width: MediaQuery.of(context).size.width *0.75,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(180),
                              //     image: DecorationImage(
                              //         colorFilter: ColorFilter.mode(
                              //             AppColours.black.withOpacity(0.5),
                              //             BlendMode.dstATop),
                              //         fit: BoxFit.cover,
                              //         image: const AssetImage("images/second.jpg")),
                              //   ),
                              // ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(
                                          left: 150, top: 300, right: 10),
                                      child: Text(
                                          "Gaming brings people together\n-Lisa Su.",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: "LatoBold",
                                          ))),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                        "Check Our Affordable Prices For\nReady-Made Gaming PC’S ",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: "LatoBold",
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()),
                                        );
                                      },
                                      child: ResponsiveButton(
                                          text: "See Product List", width: 140),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    : Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.black87,
                        child: Container(
                          margin: const EdgeInsets.only(left: 2.0, top: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      ColorizeAnimatedText("WNNDERPC",
                                          textStyle: colorizeTextStyle,
                                          colors: colorizeColors),
                                    ],
                                    repeatForever: true,
                                    isRepeatingAnimation: true,
                                  ),
                                  Column(
                                    children: List.generate(3, (index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 8,
                                        height: index == 2 ? 25 : 8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppColours.green),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: app_large_text(
                                      text: "Are You Ready To Drop In?",
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: app_large_text(
                                      text: "Sign Up and Get Started.",
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()),
                                        );
                                      },
                                      child: ResponsiveButton(
                                        text: "Sign Up Or Continue Buying",
                                        width: 250,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child:
                                        Lottie.asset("assets/animation.json"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
          }),
    );
  }
}
