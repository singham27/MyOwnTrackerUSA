import 'package:business_trackers/Views/CreatePassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Views/TabbarScreen.dart';

class SignUpController extends GetxController {

  Rx<TextEditingController> emailaddressController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController = TextEditingController().obs;

  signUp() {
    if (emailaddressController.value.text.isEmpty) {
      'Enter your email'.showError();
    }
    else {
      Get.to(CreatePassword());
      // createpassword();
      // signup();
    }
  }

  createpassword() {
    if (passwordController.value.text.isEmpty) {
      'Enter your password'.showError();
    } else if (confirmpasswordController.value.text.isEmpty) {
      'Enter your confirm  password'.showError();
    }
    else {
signup();

    }
  }


  void signup() async {
    Get.focusScope!.unfocus();
    final response = await API.instance.post(endPoint: 'signup', params: {
      'profilePicture': ' ',
      'name': ' ',
      'email': emailaddressController.value.text,
      'password': passwordController.value.text,
    });

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {

      Get.to(TabbarScreen());
    } else {
      response!['message'].toString().showError();
    }
  }




  // fixerConvert(String selectCurrency) async {
  //   final response = await API.instance.post(
  //       endPoint: APIEndPoints.instance.kFixerConvert,
  //       params: {
  //         "profilePicture"
  //         "name"
  //         "email": '1'
  //       }
  //   );
  //
  //   print(response);
  //
  //   // if (response![Constants.instance.kMessage].toString().isNotEmpty) {
  //   //   final dictMessages = Map<String, dynamic>.from(response[Constants.instance.kMessage]);
  //   //   debugPrint(dictMessages.toString());
  //   //   conversionPrice.value = dictMessages[Constants.instance.kResult].toStringAsFixed(2);
  //   //   priceConversationPrice();
  //   // } else if (!response[Constants.instance.kSuccess]) {
  //   //
  //   // }
  // }



}
