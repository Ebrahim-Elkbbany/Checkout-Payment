import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonName,
      this.onPressed,
       this.height,
       this.width=double.infinity,
       this.radius, this.style,
      })
      : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final double ?height;
  final double ?width;
  final double ?radius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 66.h,
        width: width ?? double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: style ?? Style.font22mediumBlack,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
