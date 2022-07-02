import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/ModelGenericContract.dart';
import '../Utils/API.dart';

class DocumentSettingsController extends GetxController {

  Rx<TextEditingController> genericController = TextEditingController().obs;
  Rx<TextEditingController> paymentdaysController = TextEditingController().obs;

  validation() {
    if (genericController.value.text.isEmpty) {
      'Add your generic contract'.showError();
    }else if (paymentdaysController.value.text.isEmpty) {
      'Enter your payment terms days'.showError();
    }  else {
      createGenericContract();
    }
  }
  reset() {
    Future.delayed(Duration(microseconds: 100),(){
      readGenericContract();
    });


  }
  void createGenericContract() async {
    Get.focusScope!.unfocus();

    final params =  {
      'name': genericController.value.text,
      'days': paymentdaysController.value.text,
    };


    final response = await API.instance.post(endPoint: 'createGenericContract',

        params: params

    );

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();

// Get.back();
    } else {
      response!['message'].toString().showError();
    }
  }
  void readGenericContract() async {
    final response = await API.instance.get(
      endPoint: 'readGenericContract',
    );

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Map<String, dynamic> data = Map<String, dynamic>.from(response['data']);

      final modelGenericContract = ModelGenericContract(
        name:   data['name'].toString(),
        days:   data['days'].toString(),

      );


      genericController.value.text = modelGenericContract.name!;
      paymentdaysController.value.text = modelGenericContract.days!;




    } else {
      response!['message'].toString().showError();
    }
  }
}
