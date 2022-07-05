import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Utils/Global.dart';
import '../Utils/API.dart';


class MyAccountController extends GetxController {
  Rx<File> photo = File('').obs;
  RxString  profilePicture = ''.obs;

  RxString emailOutSide = ''.obs;

  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  reset() {
    Future.delayed(Duration(milliseconds: 100), () {
      refresh();
      readProfile();
    });
  }

  refresh() {
    photo.value = File('');
    firstnameController.value.text = '';
    lastnameController.value.text = '';
    emailController.value.text = '';
  }

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

  readProfile() async {
    final response = await API.instance.get(endPoint: 'readProfile');
    print(response);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      final dictData = Map<String, dynamic>.from(response['data']);
      profilePicture.value = dictData['profilePicture'].toString();
      final name = dictData['name'].toString();
      final email = dictData['email'].toString();

      String firstName = '';
      String lastName = '';

      final arrName = name.split(' ');

      if (arrName.length>0) {
        firstName = arrName[0];
      }

      if (arrName.length>1) {
        lastName = arrName[1];
      }

      firstnameController.value.text = firstName;
      lastnameController.value.text = lastName;
      emailController.value.text = email;

      emailOutSide.value = email;
    } else {
      response!['message'].toString().showError();
    }
  }

  updateProfile() async {
    Get.focusScope!.unfocus();

    Map<String, dynamic> params = {
      'name' : firstnameController.value.text+' '+lastnameController.value.text,
      'email': emailController.value.text
    };

    debugPrint(params.toString());

    final response = await API.instance.postImage(endPoint: 'updateProfile', params: params, fileParams: 'profilePicture', file: photo.value);
    print(response);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }
}
