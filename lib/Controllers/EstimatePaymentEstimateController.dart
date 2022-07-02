import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateInvoicePaymentController extends GetxController {

  RxInt paymentMode = 0.obs;
  RxString date = ''.obs;

  RxInt paymentMethod = 0.obs;

  reset() {
    paymentMode.value = 0;
  }


}
