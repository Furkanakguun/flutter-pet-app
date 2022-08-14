import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  Color? color;
  String name;
  double? fontsize;
  FontWeight? fontWeight;
  TextWidget(
      {Key? key,
      this.color,
      required this.name,
      this.fontsize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontsize ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: "Poppins"),
    );
  }
}
