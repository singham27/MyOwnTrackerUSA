
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/ModelEstimate.dart';
import 'dart:convert';


class EstimateController extends GetxController {
  RxInt intAppBar = 0.obs;
  RxList<ModelEstimate> arrModelEstimate = <ModelEstimate>[].obs;

  RxList<String> estimate = [
    'Pending',
    'Approved',
    'Declined',
  ].obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      intAppBar.value = 0;
      readEstimate();
    });
  }

  readEstimate() async {
    try {
      final response = await API.instance.get(endPoint: 'readEstimate');
      print(response!['status']);
      print(response['data']);

      if (response != null && response.isNotEmpty && response['status'].toString() == '200') {

        final arrData = List<Map<String, dynamic>>.from(response['data']);
        arrModelEstimate.value = List<ModelEstimate>.from(arrData.map((x) => ModelEstimate.fromJson(x)));

      } else {
        response['message'].toString().showError();
      }
    } catch (error) {
      error.toString().showError();
      print(error.toString());
    }
  }

}
