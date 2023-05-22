import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final VoidCallback function;
  const CustomButton({
    Key? key,
    required this.text,
    this.height,
    this.fontSize,
    this.width,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height ?? 50,
        width: width ?? 327.33,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: fontSize ?? 17),
        )),
        decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 2.0,
              center: Alignment(0.1, 0.8),
              colors: [
                Color(0xffF0C97C),
                Color(0xffEDAA51),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(50))),
      ),
    );
  }
}
