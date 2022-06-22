import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScheduleController extends GetxController {
  RxInt selectedPaymentMode = 0.obs;

  RxList<String> paymentSchedule = [
    '%',
    '\$',
  ].obs;

  reset() {
    selectedPaymentMode.value = 0;
  }
}
