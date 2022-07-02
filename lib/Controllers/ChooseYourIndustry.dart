import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseYourIndustryController extends GetxController {
  RxInt intAppBar = 0.obs;
  reset() {
    intAppBar.value = 0;
  }

}
