import 'package:business_trackers/Components/AddTaxes.dart';
import 'package:business_trackers/Controllers/TaxListController.dart';
import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Utils/API.dart';
import '../Utils/Constant.dart';

class AddTaxesController extends GetxController {

  Rx<TextEditingController> itemNameController = TextEditingController().obs;
  Rx<TextEditingController> gstController = TextEditingController().obs;

  addNewTax() {
    if (itemNameController.value.text.isEmpty) {
      'Enter your item name'.showError();
    }  else if (gstController.value.text.isEmpty) {
      'Enter your GST% '.showError();
    } else {
      createTax();
    }
  }

  void createTax() async {
    Get.focusScope!.unfocus();
    final response = await API.instance.post(endPoint: 'createTax',
        params: {
      'name': itemNameController.value.text,
      'tax': gstController.value.text,
    });

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      // final storage = GetStorage();
      // storage.write(kTOKEN, response['data'][kTOKEN].toString());
      // kTOKENSAVED = response['data'][kTOKEN].toString();
      //
      // Map<String, dynamic> dictUser = response['data'];
      //
      // storage.write(kUSERID, dictUser['_id'].toString());
      // kUSERIDSAVED = dictUser['_id'].toString();
      //
      // // Get.to(AddTaxes());

      Get.back();

    } else {
      response!['message'].toString().showError();
    }
  }

}
