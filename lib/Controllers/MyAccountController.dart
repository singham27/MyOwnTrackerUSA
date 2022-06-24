
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Utils/Global.dart';
import '../Views/TabbarScreen.dart';

class MyAccountController extends GetxController {
  Rx<File> photo = File('').obs;

  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;



  myaccount() {
    if (firstnameController.value.text.isEmpty) {
      'Enter your first name'.showError();
    } else if (lastnameController.value.text.isEmpty) {
      'Enter your last name'.showError();
    } else if (emailController.value.text.isEmpty) {
      'Enter your email'.showError();
    }
    else {
      Get.to(TabbarScreen());
    }
  }



}

