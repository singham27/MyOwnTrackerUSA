import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ItemListController.dart';
import '../Utils/API.dart';

class EditItemController extends GetxController {
  Rx<TextEditingController> itemNameController = TextEditingController().obs;
  Rx<TextEditingController> quantityController = TextEditingController().obs;
  Rx<TextEditingController> rateController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;

  final controllerItemList = Get.put(ItemListController());

  editItem() {
    if (itemNameController.value.text.isEmpty) {
      'Enter your item name'.showError();
    } else if (quantityController.value.text.isEmpty) {
      'Enter  quantity'.showError();
    } else if (rateController.value.text.isEmpty) {
      'Enter  rate'.showError();
    } else if (descriptionController.value.text.isEmpty) {
      'Enter description'.showError();
    } else {
      createItem();
    }
  }

  void createItem() async {
    Get.focusScope!.unfocus();

    final params = {
      // 'name': 'vat',
      // 'quantity': '2',
      // 'rate': '2',
      // 'tax': '8',
      // 'description': 'the',

      'name': itemNameController.value.text.toString(),
      'quantity': quantityController.value.text.toString(),
      'rate': rateController.value.text.toString(),
      'tax': '2'.toString(),
      ' description':descriptionController.value.text.toString(),
    };

    debugPrint(params.toString());

    // return;

    final response =
        await API.instance.post(endPoint: 'createItem', params: params);

    debugPrint(response.toString());

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Get.back();
      response['message'].toString().showSuccess();

      controllerItemList.itemList();
    } else {
      response!['message'].toString().showError();
    }
  }
}
