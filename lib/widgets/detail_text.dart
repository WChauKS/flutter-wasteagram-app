import 'package:flutter/material.dart';

class DetailText extends StatelessWidget {
  final String txt;
  final double size;
  DetailText({this.txt, this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(txt, style: TextStyle(fontSize: size),)
    );
  }
}