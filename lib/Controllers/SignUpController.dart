import 'package:business_trackers/Views/CreatePassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import '../Views/TabbarScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';



class SignUpController extends GetxController {
  Rx<TextEditingController> emailaddressController =
      TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController =
      TextEditingController().obs;

  validationEmail() {
    if (emailaddressController.value.text.isEmpty) {
      'Enter your email'.showError();
    } else if (!GetUtils.isEmail(emailaddressController.value.text)) {
      'Enter a valid email id'.showError();
    } else {
      Get.to(CreatePassword());
    }
  }

  createpassword() {
    if (passwordController.value.text.isEmpty) {
      'Enter your password'.showError();
    } else if (confirmpasswordController.value.text.isEmpty) {
      'Enter your confirm  password'.showError();
    } else if (passwordController.value.text != confirmpasswordController.value.text) {
      'Password and confirm password must match.'.showError();
    } else {
      signup();
    }
  }

  void signup() async {
    Get.focusScope!.unfocus();
    final response = await API.instance.post(endPoint: 'signup',
        params: {
      'profilePicture': ' ',
      'name': ' ',
      'email': emailaddressController.value.text,
      'password': passwordController.value.text,
    });

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      final storage = GetStorage();
      storage.write(kTOKEN, response['data'][kTOKEN].toString());
      kTOKENSAVED = response['data'][kTOKEN].toString();

      Map<String, dynamic> dictUser = response['data']['user'];

      storage.write(kUSERID, dictUser['_id'].toString());
      kUSERIDSAVED = dictUser['_id'].toString();

      Get.to(TabbarScreen());
    } else {
      response!['message'].toString().showError();
    }
  }

}
