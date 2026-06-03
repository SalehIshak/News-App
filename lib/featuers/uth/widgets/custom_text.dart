import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomText extends StatefulWidget {
  final String fristText;
  final String secondText;
  final VoidCallback onPress;
  const CustomText({
    super.key,
    required this.fristText,
    required this.secondText,
    required this.onPress,
  });

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.fristText,
          style: TextStyle(
            color: Color(0xff141414),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "TimesNewRoman",
          ),
        ),
        Gap(10),
        GestureDetector(
          onTap: widget.onPress,
          child: Text(
            widget.secondText,
            style: TextStyle(
              color: Color(0xffC53030),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "TimesNewRoman",
            ),
          ),
        ),
      ],
    );
  }
}
