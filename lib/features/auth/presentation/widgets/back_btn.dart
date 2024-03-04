import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.popRoute(),
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(13.r),
          border: Border.all(color: grey.withOpacity(.3)),
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 16.sp,
          color: black,
        ),
      ),
    );
  }
}
