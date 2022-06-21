import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimatePaymentEstimateController extends GetxController {

  RxInt intAppBar = 0.obs;

  RxList<String> payment = [
    '\$ ','%','Full',
  ].obs;

  RxList<String> paymentMethod = [
    'Cash','Check','Credit','Bank Transfer',
  ].obs;


  reset() {
    intAppBar.value = 0;
  }


}
