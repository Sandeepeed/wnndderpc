import 'package:flutter/cupertino.dart';


class app_med_text extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final String FontFamily;
  app_med_text({Key? key,
    required this.text,
    required this.color,
    this.size = 30,
    this.FontFamily = 'LatoBold'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
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
