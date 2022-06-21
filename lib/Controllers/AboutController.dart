import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController {
  RxList<String> moreItem = [
    'About Us',
    'Privacy Policy',
    'Terms of Service',
    'Your Feedack',
    'App Version',
  ].obs;

}
