
import 'package:business_trackers/Views/About.dart';
import 'package:business_trackers/Views/AboutUs.dart';
import 'package:business_trackers/Views/EstimateApproved.dart';
import 'package:business_trackers/Views/EstimateDeclined.dart';
import 'package:business_trackers/Views/EstimatePending1.dart';
import 'package:business_trackers/Views/InvoicesActive.dart';
import 'package:business_trackers/Views/InvoicesActived.dart';
import 'package:business_trackers/Views/MoreScreen.dart';
import 'package:business_trackers/Views/PrivacyPolicy.dart';
import 'package:business_trackers/Views/TabbarScreen.dart';
import 'package:business_trackers/Views/TermsOfService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Views/ClientDetails.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EstimatePending1(),
    );
  }
}


