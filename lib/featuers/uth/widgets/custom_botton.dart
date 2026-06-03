import 'package:flutter/material.dart';

class CustomBotton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget text;
  const CustomBotton({super.key, required this.onPressed, required this.text});

  @override
  State<CustomBotton> createState() => _CustomBottonState();
}

class _CustomBottonState extends State<CustomBotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: double.infinity,
        height: 48,
        color: Color(0xffC53030),
        child: Center(child: widget.text),
      ),
    );
  }
}
