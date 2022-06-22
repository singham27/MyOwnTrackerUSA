import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoicesActiveController extends GetxController {


  RxInt intAppBar = 0.obs;

  RxList<String> invoice = [
    'Active',
    'Paid',
  ].obs;


  RxList<String> active = [
    'DRAFT',
    'PARTIAL',
    'DRAFT',
    'PARTIAL',
    'DRAFT',
    'PARTIAL',
    'DRAFT',
    'PARTIAL',
    'DRAFT',
    'PARTIAL',
    'DRAFT',
    'PARTIAL',
  ].obs;

  reset() {
    intAppBar.value = 0;
  }




}
