import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import 'package:http/http.dart' as http;
import '../Utils/API.dart';
import '../Views/TabbarScreen.dart';


class MyAccountController extends GetxController {
  Rx<File> photo = File('').obs;

  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  validation() {
    if (photo.value.path.isEmpty) {
      'Select profile picture'.showError();
    } else if (firstnameController.value.text.isEmpty) {
      'Enter your first name'.showError();
    } else if (lastnameController.value.text.isEmpty) {
      'Enter your last name'.showError();
    } else if (emailController.value.text.isEmpty) {
      'Enter your email'.showError();
    } else {
      updateProfile();
    }
  }

  updateProfile() async {
    Get.focusScope!.unfocus();

    Map<String, dynamic> params = {
      'name' : firstnameController.value.text+' '+lastnameController.value.text,
      'email': emailController.value.text
    };

    final response = await API.instance.postImage(endPoint: 'updateProfile', params: params, fileParams: 'profilePicture', file: photo.value);
    print(response);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }
}
