
import 'package:ana/app/config/app_color.dart';
import 'package:ana/app/config/app_text_styles.dart';
import 'package:ana/app/config/constants.dart';
import 'package:ana/app/widgets/keyboard.dart';
import 'package:ana/app/widgets/primary_button.dart';
import 'package:ana/presentation/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatefulWidget{
  const RegisterForm({Key? key}) : super(key: key);


  @override
  _RegisterForm createState()=> _RegisterForm();
}
class _RegisterForm extends State<RegisterForm>{


  final _formKey = GlobalKey<FormState>();
  final bool _autoValidate = false;
  final _controller = Get.put(RegisterController());

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
              Text('First Name',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildFirstNameField(),
              SizedBox(height: 11.h,),
              Text('Last Name',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildLastNameField(),
              SizedBox(height: 11.h,),
              Text('Email',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildEmailField(),
              SizedBox(height: 11.h,),
              Text('Password',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildPasswordField(),
              SizedBox(height: 11.h,),
              Text('Repeat Password',  style:  AppTextStyles.label,),
              SizedBox(height: 4.h,),
              buildPasswordField(),
              SizedBox(height: 21.h,),
              PrimaryButton(text: "Login to account",
                  onClick: (){
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // if all are valid then go to success screen
                      // Get.toNamed(AppRoutes.LOGIN);
                      KeyboardUtil.hideKeyboard(context);

                    }else{
                      Get.snackbar(
                        "Default SnackBar",
                        "This is the Getx default SnackBar",
                      );
                    }
                  }
              ),
              SizedBox(height: 50.h,),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: Constants.ahacText,
                    style: AppTextStyles.subInfo,
                    children: <TextSpan>[
                      TextSpan(text: " "+Constants.loginText, style: GoogleFonts.mulish(
                          fontSize: 13.sp,
                          color: AppColor.primaryAccent,
                          fontWeight: FontWeight.w600
                      ),),
                      // TextSpan(text: ''),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.h,),
            ]
        ));
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: AppTextStyles.inputText,
      controller: _controller.lastNameController,
      onSaved: (value) {
        _controller.lastName = value!;
      },
      validator: (value) {
        return _controller.validateLastName(value!);
      },
      decoration: InputDecoration(
        fillColor:  AppColor.primary,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:AppColor.primary),

        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: AppTextStyles.inputText,
      controller: _controller.firstNameController,
      onSaved: (value) {
        _controller.firstName = value!;
      },
      validator: (value) {
        return _controller.validateFirstName(value!);
      },

      decoration: InputDecoration(
        fillColor:  AppColor.primary,
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:AppColor.primary),

        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
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

  Widget buildConfirmPasswordField() {
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