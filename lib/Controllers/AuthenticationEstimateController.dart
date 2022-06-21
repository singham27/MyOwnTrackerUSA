import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationEstimateController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> estimate = [
    'PENDING',
    'APPROVED',
    'DECLINED',
  ].obs;



}
