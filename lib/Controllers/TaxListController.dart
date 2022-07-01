import 'package:business_trackers/Utils/API.dart';
import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/ModelTaxList.dart';

class TaxListController extends GetxController {

  RxBool testing = false.obs;
  RxString taxID = ''.obs;
  RxList<ModelTaxList> arrModelTaxList = <ModelTaxList> [].obs;

  reset() {
    arrModelTaxList.clear();
    Future.delayed(Duration(microseconds: 100),(){
      taxList();
    });


  }

  void taxList() async {
    arrModelTaxList.clear();
    final response = await API.instance.get(
        endPoint: 'listTax',
    );

    print(response);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {

          for(Map map in response['data']) {
            ModelTaxList model = ModelTaxList(name: map['name'],tax: map['tax'],id: map['_id'],createdTime: map['createdTime']);
            arrModelTaxList.add(model);
          }

    } else {
      response!['message'].toString().showError();
    }
  }


  void deleteList() async {
    final param =  {'taxID': taxID.value};
    debugPrint(param.toString());

    final response = await API.instance.post(
        endPoint: 'deleteTax',
        params: param
    );

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
      arrModelTaxList.clear();
      for (Map map in response['data']) {
        ModelTaxList model = ModelTaxList(
            name: map['name'],
            tax: map['tax'],
            id: map['_id'],
            createdTime: map['createdTime']);
        arrModelTaxList.add(model);
      }
    } else {
      response!['message'].toString().showError();
    }
  }

}


