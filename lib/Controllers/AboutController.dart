import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<String> moreItem = [
    'About Us',
    'Privacy Policy',
    'Terms of Service',
    'Your Feedack',
    'App Version',
  ].obs;
  reset() {
    intAppBar.value = 0;
  }

}
