import 'package:business_trackers/Components/OnBording.dart';
import 'package:business_trackers/Views/About.dart';
import 'package:business_trackers/Views/CreateAnAccount.dart';
import 'package:business_trackers/Views/DocumentSettings.dart';
import 'package:business_trackers/Views/EditCotract.dart';
import 'package:business_trackers/Views/EditItem.dart';
import 'package:business_trackers/Views/EmailMessage.dart';
import 'package:business_trackers/Views/ItemList.dart';
import 'package:business_trackers/Views/ItemListEditItem.dart';
import 'package:business_trackers/Views/LiveChat.dart';
import 'package:business_trackers/Views/MoreScreen.dart';
import 'package:business_trackers/Views/MyCompany.dart';
import 'package:business_trackers/Views/SplashScreen.dart';
import 'package:business_trackers/Views/TabbarScreen.dart';
import 'package:business_trackers/Views/TaxesScreen.dart';
import 'package:business_trackers/Views/UpgrdeToPro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/AuthenticationEstimate.dart';
import 'Views/ChooseYourIndustry.dart';

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
      home:  About(),
    );
  }
}


