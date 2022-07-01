

import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import '../Views/TabbarScreen.dart';

class LoginController extends GetxController {


  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  login() {
    if (emailController.value.text.isEmpty) {
      'Enter your email'.showError();
    } else if (!GetUtils.isEmail(emailController.value.text)) {
      'Enter a valid email id'.showError();
    } else if (passwordController.value.text.isEmpty) {
      'Enter your password'.showError();
    } else {
      signin();
    }
  }

  void signin() async {
    Get.focusScope!.unfocus();
    final response = await API.instance.post(endPoint: 'signin',

        params: {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    });

    // print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      kTOKENSAVED = response['data'][kTOKEN].toString();

      final storage = GetStorage();
      storage.write(kTOKEN, kTOKENSAVED);

      Map<String, dynamic> dictUser = response['data']['user'];
      kUSERIDSAVED = dictUser[kUSERID].toString();

      storage.write(kUSERID, kUSERIDSAVED);

      Get.to(TabbarScreen());
    } else {
      response!['message'].toString().showError();
    }
  }
}
