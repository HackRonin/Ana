import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:ana/app/config/constants.dart';
import 'package:ana/app/routes/app_routes.dart';
import 'package:ana/app/widgets/keyboard.dart';
import 'package:ana/app/widgets/primary_button.dart';
import 'package:ana/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({Key? key}) : super(key: key);


  @override
  _LoginForm createState()=> _LoginForm();
}
class _LoginForm extends State<LoginForm>{


  final _formKey = GlobalKey<FormState>();
  final bool _autoValidate = false;
  final _controller = Get.put(LoginController());

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
              SizedBox(height: 11.h,),
              Text('Password',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildPasswordField(),
              SizedBox(height: 11.h,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.forgotPassword);
                  },
                  child: Text(
                    'Forgot Password',
                    style: AppTextStyles.forgotText ,
                  ),
                ),
              ),
              SizedBox(height: 21.h,),
              PrimaryButton(text: "Login to account",
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
                      Get.to(AppRoutes.bottomNav);
                    }
                  }
              ),
              SizedBox(height: 50.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Constants.dhvaText, style: AppTextStyles.subInfo,),
                  SizedBox(width: 5.w,),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.register);
                    },
                    child: Text(Constants.createText, style: GoogleFonts.mulish(
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

  Widget buildPasswordField() {
    return Obx(
          () =>TextFormField(
        obscureText: _controller.hideText.isTrue,
        keyboardType: TextInputType.text,
        style: AppTextStyles.inputText,
        controller: _controller.passwordController,
        onSaved: (value) {
          _controller.password = value!;
        },
        validator: (value) {
          _controller.validatePassword(value!);
        },
        decoration: InputDecoration(
          fillColor:  AppColor.primary,
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(
               _controller.hideText.isFalse ? Icons.visibility : Icons.visibility_off,
              color: AppColor.grey,
            ), onPressed: () {
            _controller.toggle();
            },
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryDark),

          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );

  }
}