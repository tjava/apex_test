import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/widgets/column_sized_box.dart';
import 'package:apex_test/core/widgets/generic_rich_text.dart';
import 'package:apex_test/features/on_boarding/domain/entities/page_content_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingFirst extends StatelessWidget {
  const OnBoardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColumnSizedBox(50.h),
          Image.asset(
            PageContentEntity.first().image,
            height: 266.h,
            width: 356.w,
            fit: BoxFit.contain,
          ),
          ColumnSizedBox(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: GenericRichText(
              text: PageContentEntity.first().title,
              size: 24.sp,
              weight: FontWeight.w600,
              color: black,
            ),
          ),
          ColumnSizedBox(15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GenericRichText(
              text: PageContentEntity.first().description,
              lineHeight: 1.4.sp,
              size: 14.sp,
              weight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
