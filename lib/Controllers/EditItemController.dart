import 'package:business_trackers/Utils/API.dart';
import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemController extends GetxController {
  Rx<TextEditingController> itemNameController = TextEditingController().obs;
  Rx<TextEditingController> quantityController = TextEditingController().obs;
  Rx<TextEditingController> rateController = TextEditingController().obs;
  // Rx<TextEditingController> taxController = TextEditingController().obs;
  Rx<TextEditingController>descriptionController = TextEditingController().obs;

  editNewItem() {
    if (itemNameController.value.text.isEmpty) {
      'Enter your item name'.showError();
    }  else if (quantityController.value.text.isEmpty) {
      'Enter your quantity '.showError();
    }else if (rateController.value.text.isEmpty) {
      'Enter item rate '.showError();
    }else if (descriptionController.value.text.isEmpty) {
      'Enter your description '.showError();
    } else {
      createItem();
    }
  }

  void createItem() async {
    final param =  {
      'name': itemNameController.value.text,
      'tax': 'tax',
      'quantity': quantityController.value.text,
      'rate':    rateController.value.text,
      'description':    descriptionController.value.text,
    };
    debugPrint(param.toString());

    Get.focusScope!.unfocus();

    final response = await API.instance.post(endPoint: 'createItem',
        params: param
    );



    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      debugPrint(response.toString());
      Get.back();

    } else {
      response!['message'].toString().showError();
    }
  }
}
