

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(
    this.data,
    {
      this.color,
      this.fontSize,
      this.fontWeight,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}