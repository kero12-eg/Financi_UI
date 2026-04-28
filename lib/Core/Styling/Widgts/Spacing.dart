import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  const Spacing({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
