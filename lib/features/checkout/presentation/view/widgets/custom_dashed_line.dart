import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (index) => Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              color: const Color(0xffB8B8B8),
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
