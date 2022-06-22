import 'package:business_trackers/Controllers/TabbarScreenController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/Clients.dart';
import 'package:business_trackers/Views/Estimate.dart';
import 'package:business_trackers/Views/ForgotPassword.dart';
import 'package:business_trackers/Views/InvoicesActive.dart';
import 'package:business_trackers/Views/MoreScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ImageStyle.dart';


class TabbarScreen extends StatelessWidget {
  final int? indexSelected;

  TabbarScreen({Key? key, this.indexSelected = 0}) : super(key: key);

  double iconSize = 24;

  final arrBody = [
    Estimate(),
    InvoicesActive(

    ),
    Clients(

    ),
    MoreScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabbarScreenController());
    return GetBuilder(
      init: TabbarScreenController(),
      builder: (auth) {
        return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: arrBody[controller.index.value],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  ImageStyle.Group1669,height: 24,
                  color: (controller.index.value == 0)
                      ? ColorStyle.secondryColor
                      : ColorStyle.grey,
                ),
                label: 'Estimate',

              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  ImageStyle.Group1670,height: 24,
                  color: (controller.index.value == 1)
                      ? ColorStyle.secondryColor
                      : ColorStyle.grey,
                ),
                label: 'Invoices',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  ImageStyle.Group1671,height: 24,
                  color: (controller.index.value == 2)
                      ? ColorStyle.secondryColor
                      : ColorStyle.grey,
                ),
                label: 'Clients',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  ImageStyle.Group1672,height: 24,
                  color: (controller.index.value == 3)
                      ? ColorStyle.secondryColor
                      : ColorStyle.grey,
                ),
                label: 'More',
              ),

            ],
            selectedLabelStyle: TextStylesProductSans.textStyles_14.apply(
              // color: ColorStyle.secondryColor
              // fontWeightDelta: 1,
            ),
            unselectedLabelStyle: TextStylesProductSans.textStyles_14.apply(
                // color: ColorStyle.grey
              // fontWeightDelta: 1,
            ),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorStyle.secondryColor,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            currentIndex: controller.index.value,
            elevation: 10,
            onTap: (index) {
              controller.index.value = index;
            },
          ),
        ));
      },
    );
  }
}
