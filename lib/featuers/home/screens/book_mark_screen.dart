import 'package:flutter/material.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Mark"), centerTitle: true),

      body: Center(child: Text("Book Mark Screen")),
    );
  }
}
