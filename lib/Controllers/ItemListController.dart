import 'dart:convert';

import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/ModelItem.dart';
import '../Utils/API.dart';

class ItemListController extends GetxController {
  RxString itemID = ''.obs;

  RxBool testing = false.obs;
  RxList<ModelItem> arrModelItemList = <ModelItem>[].obs;
  RxList<bool> arrSelectedItem = <bool>[].obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      itemList();
    });
  }

  void itemList() async {
    final response = await API.instance.get(
      endPoint: 'listItem',
    );

    // debugPrint(response.toString());

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      arrModelItemList.clear();
      arrSelectedItem.clear();

      for (Map<String, dynamic> map in response['data']) {
        // debugPrint(map['tax'].toString());

        final dictTax = Map<String, dynamic>.from(map['tax']);
        debugPrint(dictTax.toString());

        ModelItem model = ModelItem(
            name: map['name'],
            quantity: map['quantity'].toString(),
            rate: map['rate'].toString(),
            taxName: dictTax['name'].toString(),
            taxValue: dictTax['tax'].toString(),
            valueAmount: map['valueAmount'].toString(),
            description: map['description'],
            id: map['_id'],
            createdTime: map['createdTime']
        );

        arrModelItemList.add(model);

        arrSelectedItem.add(false);
      }
    } else {
      response!['message'].toString().showError();
    }
  }

  void deleteList() async {
    final param = {'itemID': itemID.value};
    debugPrint(param.toString());

    final response =
        await API.instance.post(endPoint: 'deleteItem', params: param);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
      itemList();
    } else {
      response!['message'].toString().showError();
    }
  }
}
