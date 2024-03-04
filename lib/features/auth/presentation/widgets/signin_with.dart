import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninWith extends StatelessWidget {
  final String image;
  const SigninWith({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(color: grey.withOpacity(.3)),
      ),
      child: Image.asset(image),
    );
  }
}
