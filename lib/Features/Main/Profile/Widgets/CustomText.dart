import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  const Customtext({super.key, required this.text, required this.textstyle});
final String text;
final TextStyle textstyle;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: textstyle,);
  }
}
