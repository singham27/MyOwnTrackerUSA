import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/ModelGenericContract.dart';
import '../Utils/API.dart';

class DocumentSettingsController extends GetxController {
  Rx<TextEditingController> genericController = TextEditingController().obs;
  Rx<TextEditingController> paymentdaysController = TextEditingController().obs;

  RxString genericText = 'Generic Contract'.obs;
  RxBool isShowDelete = false.obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      refresh();
      readGenericContract();
    });
  }

  refresh() {
    genericText.value = 'Generic Contract';
    isShowDelete.value = false;
    genericController.value.text = '';
    paymentdaysController.value.text = '';
  }

  validationContractName() {
    if (genericController.value.text.isEmpty) {
      'Enter your generic Contract'.showError();
    } else {
      Get.back();
      genericText.value = genericController.value.text;
    }
  }

  validation() {
    if (genericController.value.text.isEmpty) {
      'Add your generic contract'.showError();
    } else if (paymentdaysController.value.text.isEmpty) {
      'Enter your payment terms days'.showError();
    } else {
      createGenericContract();
    }
  }

  void readGenericContract() async {
    final response = await API.instance.get(
      endPoint: 'readGenericContract',
    );

    debugPrint(response.toString());

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Map<String, dynamic> data = Map<String, dynamic>.from(response['data']);

      final modelGenericContract = ModelGenericContract(
        name: data['name'].toString(),
        days: data['days'].toString(),
      );

      if (modelGenericContract.name!.isNotEmpty && modelGenericContract.days!.isNotEmpty) {
        isShowDelete.value = true;
      }

      genericController.value.text = modelGenericContract.name!;
      paymentdaysController.value.text = modelGenericContract.days!;
    } else {
      response!['message'].toString().showError();
    }
  }

  void createGenericContract() async {
    Get.focusScope!.unfocus();

    final params = {
      'name': genericController.value.text,
      'days': paymentdaysController.value.text,
    };

    final response = await API.instance
        .post(endPoint: 'createGenericContract', params: params);

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();

    } else {
      response!['message'].toString().showError();
    }
  }

  void updateGenericContract() async {
    Get.focusScope!.unfocus();

    final params = {
      'name': '',
      'days': '',
    };

    final response = await API.instance
        .post(endPoint: 'updateGenericContract', params: params);

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Get.back();
      'Generic Deleted successfully.'.showSuccess();
      Future.delayed(Duration(microseconds: 200), () {
        refresh();
      });
    } else {
      response!['message'].toString().showError();
    }
  }
}
