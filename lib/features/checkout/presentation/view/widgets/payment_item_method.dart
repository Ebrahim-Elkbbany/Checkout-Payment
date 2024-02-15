import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentItemMethod extends StatelessWidget {
  const PaymentItemMethod(
      {super.key,
      required this.image,
      required this.isSelected,
      required this.onTap});
  final String image;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 103.w,
        height: 62.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.50.w,
                color: isSelected ? const Color(0xFF34A853) : Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: isSelected ? const Color(0xFF34A853) : Colors.grey,
              blurRadius: isSelected ? 4 : 1,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: SvgPicture.asset(
            image,
            height: 30.h,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
