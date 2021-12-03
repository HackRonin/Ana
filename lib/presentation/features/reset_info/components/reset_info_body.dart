import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:ana/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetInfoBody extends StatelessWidget {
  const ResetInfoBody({Key? key}) : super(key: key);

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
                  child: SvgPicture.asset(
                    'assets/images/auth_back.svg',
                    width: 170.w,
                  )),
              Positioned(
                top: 122.h,
                child: Image.asset(
                  Utils.getImagePath('auth_ill'),
                  width: 255.w,
                ),
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
                  SizedBox(
                    height: 65.h,
                  ),
                  SvgPicture.asset(
                    'assets/icons/success.svg',
                    width: 50.w,
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: 286.w,
                    height: 80.h,
                    child: Text(
                      'Please follow instructions sent to your email to reset your password',
                      style: AppTextStyles.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    width: 317.w,
                    height: 48.h,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                           side: BorderSide(
                             color: AppColor.primaryDark,
                             width: 2.w
                           ),
                          primary: Colors.white,
                          textStyle: AppTextStyles.btnText),
                      child: const Text(
                        'Back to login',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
