import 'package:business_trackers/Views/OnBording.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import '../Utils/Constant.dart';
import '../Views/TabbarScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      final storage = GetStorage();
      final getToken = storage.read(kTOKEN);

      print(getToken);

      if (getToken == null) {
        Get.to(() => OnBording());
      } else {
        kTOKENSAVED = getToken.toString();
        kUSERIDSAVED = storage.read(kUSERID).toString();

        Get.to(TabbarScreen());
      }
    });

    return Scaffold(
      backgroundColor: ColorStyle.primaryColor,
      body: Center(
        child: Image.asset(
          ImageStyle.logo,
          height: 84,
        ),
      ),
    );
  }
}
