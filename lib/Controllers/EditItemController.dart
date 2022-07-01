import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ItemListController.dart';
import '../Utils/API.dart';
import '../Models/ModelTaxList.dart';
import 'dart:convert';


class EditItemController extends GetxController {
  final controllerItemList = Get.put(ItemListController());

  RxBool isSave = false.obs;
  Rx<ModelTaxList> dictTaxes = ModelTaxList(
    name: '',
    tax: 0
  ).obs;

  Rx<TextEditingController> itemNameController = TextEditingController().obs;
  Rx<TextEditingController> quantityController = TextEditingController().obs;
  Rx<TextEditingController> rateController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;

  init() {
    Future.delayed(Duration(milliseconds: 100), () {
      reset();
    });
  }

  reset() {
    itemNameController.value.text = '';
    quantityController.value.text = '';
    rateController.value.text = '';
    descriptionController.value.text = '';

    dictTaxes.value = ModelTaxList(
        name: '',
        tax: 0
    );
  }

  validation() {
    if (itemNameController.value.text.isEmpty) {
      'Enter your item name'.showError();
    } else if (quantityController.value.text.isEmpty) {
      'Enter  quantity'.showError();
    } else if (rateController.value.text.isEmpty) {
      'Enter  rate'.showError();
    } else if (dictTaxes.value.name!.isEmpty) {
      'Select a tax'.showError();
    } else if (descriptionController.value.text.isEmpty) {
      'Enter description'.showError();
    } else {
      createItem();
    }
  }

  createItem() async {
    Get.focusScope!.unfocus();

    final dictTax = {
      'name': dictTaxes.value.name,
      'tax': dictTaxes.value.tax,
    };

    final intQuantity = int.parse(quantityController.value.text.toString());
    final intRate = int.parse(rateController.value.text.toString());
    final intTax = int.parse(dictTaxes.value.tax.toString());

    // debugPrint(intQuantity.toString());
    // debugPrint(intRate.toString());
    // debugPrint(intTax.toString());

    final taxAmount = (intQuantity*intRate*intTax)/100;
    // debugPrint(taxAmount.toString());

    final valueAmount = (intQuantity*intRate)+taxAmount;
    // debugPrint(valueAmount.toStringAsFixed(2));

    final params = {
      'name': itemNameController.value.text.toString(),
      'quantity': quantityController.value.text.toString(),
      'rate': rateController.value.text.toString(),
      'tax': jsonEncode(dictTax),
      'description':descriptionController.value.text.toString(),
      'valueAmount': valueAmount.toStringAsFixed(2)
    };

    print(params);

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
