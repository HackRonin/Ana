import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:ana/app/routes/app_routes.dart';
import 'package:ana/app/widgets/keyboard.dart';
import 'package:ana/app/widgets/primary_button.dart';
import 'package:ana/presentation/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordForm extends StatefulWidget{
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordForm createState()=> _ForgotPasswordForm();
}
class _ForgotPasswordForm extends State<ForgotPasswordForm>{


  final _formKey = GlobalKey<FormState>();
  final bool _autoValidate = false;
  final _controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        onChanged: () =>
            setState(() => _formKey.currentState!.validate()),
        autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildEmailField(),
              SizedBox(height: 21.h,),
              PrimaryButton(text: "Request password reset",
                  onClick: (){
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // if all are valid then go to success screen

                      KeyboardUtil.hideKeyboard(context);

                    }else{
                      Get.snackbar(
                        "Default SnackBar",
                        "This is the Getx default SnackBar",
                      );
                      Get.offAllNamed(AppRoutes.resetInfo);
                    }
                  }
              ),
              SizedBox(height: 50.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Remembered your password?', style: AppTextStyles.subInfo,),
                  SizedBox(width: 5.w,),
                  GestureDetector(
                    onTap: (){
                      Get.off(AppRoutes.login);
                    },
                    child: Text('Back to login', style: GoogleFonts.mulish(
                        fontSize: 13.sp,
                        color: AppColor.green,
                        fontWeight: FontWeight.w600
                    ),),
                  )
                ],
              ),
            ]
        ));
  }


  TextFormField buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: AppTextStyles.inputText,
      controller: _controller.emailController,
      onSaved: (value) {
        _controller.email = value!;
      },
      validator: (value) {
        return _controller.validateEmail(value!);
      },
      decoration: InputDecoration(
        fillColor:  AppColor.primary,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryDark),

        ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  }
