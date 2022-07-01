import 'package:flutter/material.dart';
import 'package:business_trackers/Utils/Global.dart';

import 'package:get/get.dart';


class EditCotractController extends GetxController {


  Rx<TextEditingController> genericContractController = TextEditingController().obs;

  validation() {
    if (genericContractController.value.text.isEmpty) {
      'Enter your generic Contract'.showError();
    } else {
      // createCompany();
    }
  }


}
