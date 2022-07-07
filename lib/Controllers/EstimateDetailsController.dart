

import 'package:business_trackers/Models/ModelItem.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Models/ModelEstimate.dart';
import '../Controllers/MyCompanyController.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import 'dart:convert';


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

  updateEstimateStatesName(ModelEstimate estimate) async {
    final params = {
      'estimateID': estimate.id,
      'states_name': 'Invoice',
    };

    final response = await API.instance.post(endPoint: 'updateEstimateStatesName', params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      invoiceFromEstimate(estimate);
    } else {
      response!['message'].toString().showError();
    }

  }

  invoiceFromEstimate(ModelEstimate estimate) async {
    final params = {
      'client': jsonEncode(estimate.client!.toMap()),
      'items': jsonEncode(ModelItem().listModelToListMap(estimate.items!)),
      'paymentSchedule': jsonEncode(estimate.paymentSchedule!.toJson()),
      'contract': jsonEncode(estimate.contract!.toJson()),
      'subTotal': estimate.tax.toString(),
      'tax': estimate.tax.toString(),
      'amountTotal': estimate.amountTotal.toString(),
      'notes': estimate.notes.toString(),
      'docID': estimate.docID.toString(),
      'date': estimate.date.toString(),
      'po': estimate.po.toString(),
      'states': 'Pending',
      // 'states': 'Active',
      'states_name': 'Draft',
    };

    final response = await API.instance.post(endPoint: 'createInvoice', params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

}
