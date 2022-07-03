
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Models/ModelGenericContract.dart';
import '../Utils/API.dart';


class EmailMessageController extends GetxController {
  Rx<TextEditingController> txtEstimateEmailMessage = TextEditingController().obs;
  Rx<TextEditingController> txtInvoiceEmailMessage = TextEditingController().obs;

  RxBool isCreate = true.obs;

  onInit() {
    Future.delayed(Duration(microseconds: 100), () {
      readEstimateEmailMessage();
    });
  }

  refresh() {
    txtEstimateEmailMessage.value.text = '';
    txtInvoiceEmailMessage.value.text = '';
  }

  validation() {
    if (txtEstimateEmailMessage.value.text.isEmpty) {
      'Enter Estimate Email Message'.showError();
    } else if (txtInvoiceEmailMessage.value.text.isEmpty) {
      'Enter Invoice Email Message'.showError();
    } else {
      if (isCreate.value) {
        createEstimateEmailMessage();
      } else {
        updateEstimateEmailMessage();
      }
    }
  }

  void readEstimateEmailMessage() async {
    final response = await API.instance.get(
      endPoint: 'readEmailMessage',
    );

    debugPrint(response.toString());

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Map<String, dynamic> data = Map<String, dynamic>.from(response['data']);

      if (data.isEmpty) {
        isCreate.value = true;
      } else {
        isCreate.value = false;
        txtEstimateEmailMessage.value.text =
            data['estimateEmailMessage'].toString();
        txtInvoiceEmailMessage.value.text =
            data['invoiceEmailMessage'].toString();
      }
    } else {
      response!['message'].toString().showError();
    }
  }

  void createEstimateEmailMessage() async {
    Get.focusScope!.unfocus();

    final params = {
      'estimateEmailMessage': txtEstimateEmailMessage.value.text,
      'invoiceEmailMessage':  txtInvoiceEmailMessage.value.text,
    };

    final response = await API.instance
        .post(endPoint: 'createEmailMessage', params: params);

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

  void updateEstimateEmailMessage() async {
    Get.focusScope!.unfocus();

    final params = {
      'estimateEmailMessage': txtEstimateEmailMessage.value.text,
      'invoiceEmailMessage':  txtInvoiceEmailMessage.value.text,
    };

    final response = await API.instance
        .post(endPoint: 'updateEmailMessage', params: params);

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

}