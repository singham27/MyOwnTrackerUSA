

import 'package:business_trackers/Models/ModelItem.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Models/ModelEstimate.dart';
import '../Controllers/MyCompanyController.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';


class EstimateDetailsController extends GetxController {
  RxInt estimateStatus = 0.obs;

  final controllerMyCompany = Get.put(MyCompanyController());

  RxList<String> arrSendEstimate = [
    'Signature',
    'Invoice',
    'Print',
    'SMS',
    'Email',
    'Share',
  ].obs;

  RxList<String> arrSendInvoice = [
    'Signature',
    'Payment',
    'Print',
    'SMS',
    'Email',
    'Share',
  ].obs;

  onInit() {
    Future.delayed(Duration(microseconds: 100), () {
      controllerMyCompany.readCompany();
    });
  }

  double taxCalcuation(List<ModelItem> items) {
    double taxTotal = 0.0;

    for (int i=0;  i<items.length; i++) {
      taxTotal += double.parse(items[i].taxValue.toString());
    }

    return taxTotal;
  }

  String taxPriceCaluculation(ModelEstimate estimate) {
    final tax = taxCalcuation(estimate.items!);
    final taxPrice = (estimate.subTotal!*tax)/100;
    return taxPrice.toStringAsFixed(2);
  }

  deleteEstimate(String estimateID) async {
    debugPrint(estimateID);

    final params = {
      'estimateID': estimateID,
    };

    debugPrint(params.toString());

    final response = await API.instance.post(endPoint: 'deleteEstimate', params: params);

    print(response);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

  updateEstimateStates(String estimateID, String states) async {
    final params = {
      'estimateID': estimateID,
      'states': states,
    };

    final response = await API.instance.post(endPoint: 'updateEstimateStates', params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      // Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

}
