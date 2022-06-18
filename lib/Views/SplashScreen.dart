import 'package:business_trackers/Components/OnBording.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);



  @override

  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(OnBording());
    });

    return Scaffold(

      backgroundColor: ColorStyle.primaryColor,
      body: Center(
        child: Image.asset(ImageStyle.Image3,height: 84,),
      ),
    );
  }
}
