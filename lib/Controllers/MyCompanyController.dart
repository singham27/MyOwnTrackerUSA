import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class MyCompanyController extends GetxController {
  Rx<File> photo = File('').obs;
  Rx<File> docLicence = File('').obs;
  Rx<File> docInsurance = File('').obs;

  RxList<String> images1 = <String>[
    ImageStyle.Group3124,
    ImageStyle.Group3123,
    ImageStyle.Group3125,
    ImageStyle.Group3126,
  ].obs;
  RxList<String> moreItem = [
    'www.abcd.com',
    'www.google.com/abcd',
    'www.facebook.com/abcd',
    'www.instagram.com/abcd',
  ].obs;
}

