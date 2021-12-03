import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  late TextEditingController emailController, passwordController,
      firstNameController,lastNameController, confirmPasswordController;
  var email = '';
  var password = '';
  var confirmPassword = '';
  var firstName = '';
  var lastName = '';

  var hideText = true.obs;

  void toggle(){
    hideText.toggle();
  }


  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
     lastNameController =  TextEditingController();
     confirmPasswordController =  TextEditingController();


  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();

  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validateFirstName(String value){
    if(value.isEmpty){
      return "Enter your first name";
    }
    return null;
  }
  String? validateLastName(String value){
    if(value.isEmpty){
      return "Enter your last name";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password can not be less than 6 characters";
    }
    return null;
  }
  String? validateConfirmPassword(String value){
    if(value.isEmpty){
      return "Confirm password";
    }else if(value != passwordController.text){
      return "Password does not match";
    }
    return null;
  }


}
