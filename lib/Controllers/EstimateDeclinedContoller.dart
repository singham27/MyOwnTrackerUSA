import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateDeclinedContoller extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> estimate = [
    'Pending',
    'Approved',
    'Declined',
  ].obs;
  reset() {
    intAppBar.value = 0;
  }
}
