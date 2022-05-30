import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';

class GlassButton extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;

  const GlassButton(
      {Key? key,
      required this.blur,
      required this.opacity,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: MediaQuery.of(context).size.width*0.5,
          height: MediaQuery.of(context).size.height*0.25,
          decoration: BoxDecoration(
            color: AppColours.black.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border.all(
              width: 1.5,
              color: AppColours.green.withOpacity(0.5),
            )
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
