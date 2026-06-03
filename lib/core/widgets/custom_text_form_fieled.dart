import 'package:flutter/material.dart';

class CustomTextFormFieled extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassowrd;
  final FormFieldValidator<String>? validator;
  const CustomTextFormFieled({
    super.key,
    required this.hintText,
    required this.isPassowrd,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextFormFieled> createState() => _CustomTextFormFieledState();
}

class _CustomTextFormFieledState extends State<CustomTextFormFieled> {
  late bool obsecureTexet;
  @override
  void initState() {
    super.initState();
    setState(() {
      obsecureTexet = widget.isPassowrd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: obsecureTexet,
      cursorColor: Colors.black,
      cursorWidth: 1,
      cursorHeight: 15,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Color(0xff141414), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "TimesNewRoman"),
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        suffixIcon: widget.isPassowrd
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obsecureTexet = !obsecureTexet;
                  });
                },
                child: Icon(obsecureTexet ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
