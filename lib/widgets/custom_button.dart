// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
 final String text;
   final void Function()? navigateToNextScreen;

  const CustomButton({
    Key? key,
    required this.text,
    this.navigateToNextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToNextScreen,
      child: Container(
        width: 120.w,
        height: 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Text(text),
      ),
    );
  }
}
