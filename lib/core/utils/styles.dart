import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Style{
  static TextStyle font25mediumBlack =  TextStyle(
    color: Colors.black,
    fontSize: 25.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  static TextStyle font18RegularBlack =  TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );
  static TextStyle font20RegularBlackOpacity =  TextStyle(
    color: Colors.black.withOpacity(0.800000011920929),
    fontSize: 20.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 0,
  );
  static TextStyle font18SemiBoldBlack =  TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );
  static TextStyle font22mediumBlack =  TextStyle(
    color: Colors.black,
    fontSize: 22.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  static TextStyle font24SemiBoldBlack =  TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,
  );

}