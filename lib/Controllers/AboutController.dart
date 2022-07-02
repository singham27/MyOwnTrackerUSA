import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> moreItem = [
    'About Us',
    'Privacy Policy',
    'Terms of Service',
    'Call IT Support',
    'App Version (1.0.0)',
  ].obs;
  reset() {
    intAppBar.value = 0;
  }

}
