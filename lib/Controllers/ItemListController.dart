import 'package:business_trackers/Models/ItemListModel.dart';
import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/API.dart';

class ItemListController extends GetxController {
  RxBool testing = false.obs;
  RxString itemID = ''.obs;
  RxList<ItemListModel> arrItemListModel = <ItemListModel> [].obs;

  reset() {
    arrItemListModel.clear();
    Future.delayed(Duration(microseconds: 100), () {
      ItemList();
    });
  }

  void ItemList() async {
    arrItemListModel.clear();

    final response = await API.instance.get(
      endPoint: 'listItem',
    );
debugPrint(response.toString());
    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      for (Map map in response['data']) {
        ItemListModel model = ItemListModel(
            name: map['name'],
            quantity: map['quantity'],
            rate: map['rate'],
            tax: map['tax'],
            description:map['description'],
            id: map['_id'],
            createdTime: map['createdTime']);




        arrItemListModel.add(model);
      }
    } else {
      response!['message'].toString().showError();
    }
  }

  void deleteList() async {
    final param =  {'itemID': itemID.value};
    debugPrint(param.toString());

    final response = await API.instance.post(
        endPoint: 'deleteItem',
        params: param
    );

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
      arrItemListModel.clear();


      for (Map map in response['data']) {
        ItemListModel model = ItemListModel(

            name: map['name'],
            quantity: map['quantity'],
            rate: map['rate'],
            tax: map['tax'],
            description:map['description'],
            id: map['_id'],
            createdTime: map['createdTime']);

        arrItemListModel.add(model);
      }

    } else {
      response!['message'].toString().showError();
    }
  }

}
