
import 'package:business_trackers/Models/ModelItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/ModelClient.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import 'dart:convert';


class EstimateCreateController extends GetxController {
  RxInt intAppBar = 0.obs;

  Rx<ModelClient>  selectedClient = ModelClient().obs;
  RxList<ModelItem> arrSelectedItem = <ModelItem>[].obs;
  RxMap<String, dynamic> paymentSchedule = <String, dynamic>{}.obs;
  RxMap<String, dynamic> genericContract = <String, dynamic>{}.obs;

  RxString date = 'Pick a date'.obs;
  Rx<TextEditingController> txtNotes = TextEditingController().obs;
  Rx<TextEditingController> txtEstimate = TextEditingController().obs;
  Rx<TextEditingController> txtPO = TextEditingController().obs;

  double subTotal() {
    double amount = 0.0;
    for (int i = 0; i<arrSelectedItem.length; i++) {
      final priceItem = double.parse(arrSelectedItem[i].quantity.toString())*double.parse(arrSelectedItem[i].rate.toString());
      amount += priceItem;
    }

    return amount;
  }

  taxTotal() {
    double tax = 0.0;
    for (int i = 0; i<arrSelectedItem.length; i++) {
      tax += double.parse(arrSelectedItem[i].taxValue.toString());
    }

    return tax;
  }

  tax() {
    double tax = 0.0;
    for (int i = 0; i<arrSelectedItem.length; i++) {
      tax += double.parse(arrSelectedItem[i].taxValue.toString());
    }

    final taxPrice = (subTotal()*tax)/100;

    return taxPrice;
  }

  totalAmount() {
    return subTotal()+tax();
  }

  RxList<String> estimate = [
    'Contact',
    'PRO',
    'Generic Contract ',
  ].obs;

  reset() {
    intAppBar.value = 0;
  }

  refresh() {
    selectedClient.value = ModelClient();
    arrSelectedItem.value = [];
    paymentSchedule.value = {};
    txtNotes.value.text = '';
    genericContract.value = {};
    txtEstimate.value.text = '';
    date.value = 'Pick a date';
    txtPO.value.text = '';
  }

  validation() {
    print(paymentSchedule.value.isEmpty);

    if (selectedClient.value.name == null) {
      'Add a client'.showError();
    } else if (arrSelectedItem.value.isEmpty) {
      'Add a line item'.showError();
    } else if (paymentSchedule.value.isEmpty) {
      'Schedule a payment'.showError();
    } else if (txtNotes.value.text.isEmpty) {
      'Please enter some notes'.showError();
    } else if (genericContract.value.toString().isEmpty) {
      'Select a generic contract'.showError();
    } else if (txtEstimate.value.text.isEmpty) {
      'Enter estimate value'.showError();
    } else if (date == 'Pick a date') {
      'Select a date'.showError();
    } else if (txtPO.value.text.isEmpty) {
      'Please enter PO value'.showError();
    } else {
      createEstimate();
    }
  }

  createEstimate() async {
    Get.focusScope!.unfocus();

    final hello = jsonEncode(selectedClient.value.toMap());
    print(hello);

    final helloOne = jsonEncode(ModelItem().listModelToListMap(arrSelectedItem.value));
    print(helloOne);

    final params = {
      'client': jsonEncode(selectedClient.value.toMap()),
      'items': jsonEncode(ModelItem().listModelToListMap(arrSelectedItem.value)),
      'paymentSchedule': jsonEncode(paymentSchedule.value),
      'contract': jsonEncode(genericContract.value),
      'subTotal': subTotal().toString(),
      'tax': tax().toString(),
      'amountTotal': totalAmount().toString(),
      'notes': txtNotes.value.text,
      'estimateDocID': txtEstimate.value.text,
      'date': date.value,
      'po': txtPO.value.text,
      'states': 'draft',
    };

    print(params);
    // return;

    final response = await API.instance.post(endPoint: 'createEstimate', params: params);

    print(response);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
      refresh();
    } else {
      response!['message'].toString().showError();
    }
  }
}
