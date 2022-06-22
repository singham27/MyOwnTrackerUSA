import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoicesPaidController extends GetxController {


  RxInt intAppBar = 0.obs;

  RxList<String> paid = [
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',
    'PAID',

  ].obs;

  reset() {
    intAppBar.value = 0;
  }

}
