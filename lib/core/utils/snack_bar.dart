import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apex_test/core/constants/colors_constant.dart';
import 'package:apex_test/core/widgets/generic_rich_text.dart';

SnackBar showSnackBar(
    {required BuildContext context, required String message, Color color = black}) {
  return SnackBar(
    content: GenericRichText(
      text: message,
      size: 12.sp,
      color: white,
      textAlign: TextAlign.start,
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 3),
    showCloseIcon: true,
  );
}
