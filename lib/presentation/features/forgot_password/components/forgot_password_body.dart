import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:ana/app/config/constants.dart';
import 'package:ana/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget{
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: AppColor.primaryAccent.withOpacity(0.2),
                  height: 244.h,
                ),
                Positioned(
                    top: 17.h,
                    left: 232.w,
                    child: SvgPicture.asset('assets/images/auth_back.svg',width: 170.w,)),
                Positioned(
                  top: 122.h,
                  child: Image.asset(Utils.getImagePath('auth_ill'), width: 255.w,),
                )
              ],
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 33.h,),
                    Text(Constants.resetText,
                      style: AppTextStyles.title,),
                    SizedBox(height: 8.h,),
                    Text(Constants.resetSubText,
                      style: AppTextStyles.subTitle,),
                    SizedBox(height: 21.h,),
                    const ForgotPasswordForm()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}