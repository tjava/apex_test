import 'package:flutter/material.dart';

class GenericTextButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final Border? borderStyle;
  final double width;
  final double height;
  final bool fulCurve;
  final Function() onClick;

  const GenericTextButton({
    super.key,
    required this.label,
    this.labelColor,
    this.labelStyle,
    this.backgroundColor,
    this.borderStyle,
    this.fulCurve = true,
    this.width = 150.0,
    this.height = 52.0,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(fulCurve ? 30.0 : 10.0),
          border: borderStyle,
        ),
        child: Center(
          child: Text(
            label,
            style: labelStyle ??
                TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: labelColor,
                ),
          ),
        ),
      ),
    );
  }
}
