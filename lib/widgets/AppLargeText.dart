import 'package:flutter/cupertino.dart';


class app_large_text extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final String FontFamily;
  app_large_text({Key? key, required this.text,  required this.color,  this.size = 30, this.FontFamily = 'LatoBold'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: size,
        fontFamily: FontFamily,
        color: color,
        fontWeight: FontWeight.w200
        ,
      ),
    );
  }
}
