import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget{
  final String text;
  final Function onClick;

  const PrimaryButton({
    required this.text,
    required this.onClick,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: 317.w,
      height: 48.h,
      child: ElevatedButton(
        onPressed: (){
          onClick();
        },
        style:  ElevatedButton.styleFrom(
          //elevation: 10,
          //shadowColor: wPrimaryColorDark,
          primary: AppColor.primaryDark,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10.r), // <-- Radius
          // ),
          textStyle: AppTextStyles.btnText
        ),
        child: Text(
          text,
        ),
      ),
    );
  }

}