import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericButton extends StatefulWidget {
  final String label;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final double height;
  final double width;
  final bool fulCurve;
  final bool isBusy;
  final Function()? onClick;
  final FocusNode? focusNode;

  const GenericButton({
    Key? key,
    required this.label,
    this.labelColor,
    this.labelStyle,
    this.backgroundColor,
    this.height = 56,
    this.width = 200.0,
    this.fulCurve = true,
    required this.onClick,
    this.focusNode,
    this.isBusy = false,
  }) : super(key: key);

  @override
  State<GenericButton> createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        focusNode: widget.focusNode,
        onPressed: widget.isBusy ? null : widget.onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.fulCurve ? 30.0 : 15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.label,
              style: widget.labelStyle ??
                  TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: widget.labelColor,
                  ),
            ),
            _paddedLoading(),
          ],
        ),
      ),
    );
  }

  Widget _paddedLoading() {
    if (widget.isBusy) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 16.w),
          const SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
