import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyCompanyController extends GetxController {

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

