import 'package:flutter/material.dart';

class ViewAllComponants extends StatelessWidget {
  final String title;
  final Color? texColor;
  final Function onTap;
  const ViewAllComponants({super.key, required this.title, this.texColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: texColor ?? Color(0xffFFFCFC),
              fontSize: 15,
              fontFamily: "TimesNewRoman",
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => onTap(),
            child: Text(
              "View all",
              style: TextStyle(
                color: texColor ?? Color(0xffFFFCFC),
                fontSize: 15,
                fontFamily: "TimesNewRoman",
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: texColor ?? Color(0xffFFFCFC),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
