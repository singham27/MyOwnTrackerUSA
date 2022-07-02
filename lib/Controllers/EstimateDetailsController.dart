import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateDetailsController extends GetxController {
  RxInt estimateStatus = 0.obs;

  RxList<String> arrSend = [
    'Signature',
    'Print',
    'payment',
    'SMS',
    'Email',
    'Share',
  ].obs;
}
