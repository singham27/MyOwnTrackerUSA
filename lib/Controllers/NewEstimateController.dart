import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewEstimateController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> estimate = [
    'Contact',
    'PRO',
    'Generic Contract ',
  ].obs;
  reset() {
    intAppBar.value = 0;
  }
}
