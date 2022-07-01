

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_trackers/Utils/Global.dart';



class DocumentSettingsController extends GetxController {

  Rx<TextEditingController> paymentTermsController = TextEditingController().obs;

  validation() {
    if (paymentTermsController.value.text.isEmpty) {
      'Enter your payment terms(days)'.showError();
    } else {
      // createCompany();
    }
  }

}
