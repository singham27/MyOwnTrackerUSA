import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> estimate = [
    'Pending',
    'Approved',
    'Declined',
  ].obs;


  RxList<String> estimate1 = [
    'Estimate #12345',
    'John Deo',
    'Abc Company ',
    'Estimate #12345',
  ].obs;
  RxList<String> estimate2 = [
    'DRAFT',
    'ISSUED',
    'ISSUED',
    'DRAFT',
  ].obs;
  reset() {
    intAppBar.value = 0;
  }

}
