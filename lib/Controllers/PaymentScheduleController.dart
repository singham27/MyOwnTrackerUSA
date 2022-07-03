import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScheduleController extends GetxController {
  RxInt selectedPaymentMode = 0.obs;

  RxList<TextEditingController> arrPaymentName = <TextEditingController>[TextEditingController()].obs;
  RxList<TextEditingController> arrPaymentAmount = <TextEditingController>[TextEditingController()].obs;

  init() {
    Future.delayed(Duration(microseconds: 100), () {
      selectedPaymentMode.value = 0;

      // arrPaymentName.clear();
      // arrPaymentAmount.clear();
      //
      // arrPaymentName.add(TextEditingController());
      // arrPaymentAmount.add(TextEditingController());
    });
  }

  addPayment() {
    arrPaymentName.add(TextEditingController());
    arrPaymentAmount.add(TextEditingController());
  }

  removePayment(int index) {
    arrPaymentName.removeAt(index);
    arrPaymentAmount.removeAt(index);
  }

}
