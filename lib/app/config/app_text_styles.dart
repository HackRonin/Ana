import 'package:ana/app/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextStyles{
  static TextStyle title = GoogleFonts.teko(
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryDark,
  );


  static TextStyle subTitle = GoogleFonts.mulish(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryDark,
  );
  static TextStyle btnText = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle subInfo = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryDark,
  );

  static TextStyle label = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: AppColor.labelColor,
  );

  static TextStyle inputText = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryDark,
  );
  static TextStyle forgotText = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryDark,
  );

  static TextStyle labelStyleSelected = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: AppColor.primaryDark,
  );
  static TextStyle labelStyleUnSelected = GoogleFonts.mulish(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: Colors.black.withOpacity(0.5),
  );

}