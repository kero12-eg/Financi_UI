import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpcode extends StatelessWidget {
Otpcode({super.key, this.controller, this.validator});
PinInputController? controller = PinInputController();
String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return MaterialPinFormField(
      length: 4,
      pinController: controller,
      validator: validator,
      onCompleted: (pin) => print('PIN: $pin'),
      onChanged: (value) => print('Changed: $value'),
      theme: MaterialPinTheme(
        shape: MaterialPinShape.outlined,
        cellSize: Size(70.w, 60.h),
        spacing: 8,
        borderRadius: BorderRadius.circular(8.r),
        borderWidth: 1.5,
        focusedBorderWidth: 2.0,
        borderColor: Colors.grey,
        focusedBorderColor: Colors.blue,
        filledBorderColor: Colors.green,
        errorColor: Colors.red,
        fillColor: Colors.grey[100],
        focusedFillColor: Colors.blue[50],
        filledFillColor: Colors.green[50],

        textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textGradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
        obscuringCharacter: '●',
        showCursor: true,
        cursorColor: Colors.blue,
        cursorWidth: 2,
        animateCursor: true,
        entryAnimation: MaterialPinAnimation.scale,
        animationDuration: Duration(milliseconds: 150),
        animationCurve: Curves.easeOut,
        enableErrorShake: true,
        errorAnimationDuration: Duration(milliseconds: 500),
      ),
      
    );
  }
}
