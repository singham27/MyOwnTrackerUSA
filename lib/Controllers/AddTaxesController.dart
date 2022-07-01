import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Controllers/TaxListController.dart';


class AddTaxesController extends GetxController {
  Rx<TextEditingController> itemNameController = TextEditingController().obs;
  Rx<TextEditingController> gstController = TextEditingController().obs;

  final controllerTaxList = Get.put(TaxListController());

  taxes() {
    if (itemNameController.value.text.isEmpty) {
      'Enter your item name'.showError();
    } else if (gstController.value.text.isEmpty) {
      'Enter  GST%'.showError();
    } else {
      createTax();
    }
  }

  void createTax() async {
    Get.focusScope!.unfocus();

    final response = await API.instance.post(endPoint: 'createTax', params: {
      'name': itemNameController.value.text,
      'tax': gstController.value.text,
    });

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      itemNameController.value.text = '';
      gstController.value.text = '';

      Get.back();
      controllerTaxList.taxList();
    } else {
      response!['message'].toString().showError();
    }
  }
}
