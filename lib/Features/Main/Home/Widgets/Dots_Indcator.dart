import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndcator extends StatelessWidget {
  const DotsIndcator({super.key, required this.count, required this.currentPage, required this.onTap});
  final int count;
  final double currentPage;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      onTap: (position){
        onTap(position.toInt());
      },
      dotsCount: count,
      position: currentPage,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
