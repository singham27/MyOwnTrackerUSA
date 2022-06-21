import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScheduleController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> paymentSchedule = [
    '%',
    '\$',
  ].obs;
  reset() {
    intAppBar.value = 0;
  }
}
