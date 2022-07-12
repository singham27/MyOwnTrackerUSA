import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Utils/Global.dart';
import 'dart:convert';
import 'package:business_trackers/Models/ModelItem.dart';
import '../Utils/API.dart';


class PaymentAddController extends GetxController {
  String? invoiceID;

  RxDouble paid = 0.0.obs;
  RxDouble paidStorage = 0.0.obs;
  RxDouble totalPayment = 0.0.obs;

  RxInt paymentMode = 0.obs;
  RxString date = ''.obs;
  RxInt paymentMethod = 0.obs;

  Rx<TextEditingController> txtPayment = TextEditingController().obs;

  onInit() {
    Future.delayed(Duration(microseconds: 100), () {
      paidStorage.value = paid.value;
      // refresh();
    });
  }

  refresh() {
    paymentMode.value = 0;
    paid.value = 120.0;
    paidStorage.value = paid.value;
    totalPayment.value = 224.0;

    date.value = '';
    paymentMethod.value = 0;
  }

  paymentType(int index) {
    Get.focusScope!.unfocus();

    paymentMode.value = index;

    txtPayment.value.text = '';
    paid.value = paidStorage.value;

    if (paymentMode.value == 0) {

    } else if (paymentMode.value == 1) {

    } else if (paymentMode.value == 2) {
      txtPayment.value.text = (totalPayment.value-paid.value).toString();
      paid.value = totalPayment.value;
    }
  }

  priceCalcuation() {
    if (paymentMode.value == 0) {
      final textFieldValue = txtPayment.value.text.isEmpty ? '0' : txtPayment.value.text;
      paid.value = paidStorage.value+double.parse(textFieldValue);
    } else if (paymentMode.value == 1) {
      final amoundToBePaid = (totalPayment.value-paidStorage.value);
      paid.value = paidStorage.value + ((amoundToBePaid*(double.parse(txtPayment.value.text)))/100);
    }
  }

  validation(String invoiceID) {
    if (txtPayment.value.text == '0' || txtPayment.value.text == '0.0') {
      'Entered amount must greater than 0'.showError();
    } else if (txtPayment.value.text.isEmpty) {
      'Enter some payment'.showError();
    } else if (paid.value > totalPayment.value) {
      'Entered payment must not be greater than Total Payment'.showError();
    } else if (date.value.isEmpty) {
      'Select a date'.showError();
    } else if (paymentMethod.value == 0) {
      'Select a payment method'.showError();
    } else {
      createPayment(invoiceID);
    }
  }

  createPayment(String invoiceID) async {
    Get.focusScope!.unfocus();

    String? strPaymentType;

    if (paymentMode.value == 0) {
      strPaymentType = '\$';
    } else if (paymentMode.value == 1) {
      strPaymentType = '%';
    } else if (paymentMode.value == 2) {
      strPaymentType = 'Full';
    }

    print(paymentMode.value);

    String? strPaymentMethod;
    if (paymentMethod.value == 1) {
      strPaymentMethod = 'Cash';
    } else if (paymentMethod.value == 2) {
      strPaymentMethod = 'Check';
    } else if (paymentMethod.value == 3) {
      strPaymentMethod = 'Credit';
    } else if (paymentMethod.value == 4) {
      strPaymentMethod = 'Bank Transfer';
    }

    final dictPayment = {
      'totalAmount': totalPayment.value,
      'paidAmount': paid.value,
      'paymentType': strPaymentType!,
      'paymentDate': date.value,
      'paymentMethod': strPaymentMethod,
    };

    final params = {
      'invoiceID': invoiceID,
      'payment': jsonEncode(dictPayment),
    };

    print(params);

    // updateInvoiceStates();
    // return;

    final response = await API.instance.post(endPoint: 'createPayment', params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }

    updateInvoiceStates();
  }

  updateInvoiceStates() async {
    final params = {
      'invoiceID': invoiceID,
      'states': (paid.value < totalPayment.value) ? 'Active' : 'Paid',
    };

    debugPrint(paid.value.toString());
    debugPrint(totalPayment.value.toString());
    debugPrint('params params params params params');
    debugPrint(params.toString());

    // updateInvoiceStatesName();
    // return;


    final response = await API.instance.post(endPoint: 'updateInvoiceStates', params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      updateInvoiceStatesName();
    } else {
      response!['message'].toString().showError();
    }
  }

  updateInvoiceStatesName() async {
    final params = {
      'invoiceID': invoiceID,
      'states_name': (paid.value < totalPayment.value) ? 'Partial' : 'Paid',
    };

    debugPrint(paid.value.toString());
    debugPrint(totalPayment.value.toString());

    debugPrint('params params params params params');
    debugPrint(params.toString());
    // return;

    final response = await API.instance.post(endPoint: 'updateInvoiceStatesName', params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      refresh();
    } else {
      response!['message'].toString().showError();
    }

  }

}
