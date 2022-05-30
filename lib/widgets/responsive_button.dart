import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  String text;
  ResponsiveButton({Key? key,
  this.width,
  required this.text,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColours.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'LatoBold',
            color: AppColours.blue,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
          ),
          const SizedBox(width: 2,),
          Icon(Icons.arrow_forward,
          color: AppColours.blue,),
        ],
      ),
    );
  }
}
