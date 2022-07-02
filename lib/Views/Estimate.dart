

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_trackers/Controllers/EstimateController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EstimateApproved.dart';
import 'package:business_trackers/Views/EstimateDeclined.dart';
import 'package:business_trackers/Views/EstimatePending.dart';
import 'package:business_trackers/Views/EstimateCreate.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Utils/Global.dart';


class Estimate extends StatelessWidget {
  Estimate({Key? key}) : super(key: key);
  final controller = Get.put(EstimateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorStyle.white,
        leadingWidth: 0,
        centerTitle: false,
        title: Text('Estimate',
            style: TextStylesProductSans.textStyles_22
                .apply(color: ColorStyle.black, fontWeightDelta: 4)),
        actions: [
          InkWell(
            child: Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              alignment: Alignment.center,
              // height: 38,
              // width: 38,
              child: Icon(
                Icons.search,
                color: ColorStyle.secondryColor,
              ),
              decoration: BoxDecoration(
                  color: ColorStyle.secondryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(100)),
            ),
            onTap: () {},
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(
          left: 30
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButtonCustom(
                text: "Invite now",
                colorBG: ColorStyle.black,
                colorText: ColorStyle.primaryColor,
                onTap: () {
                  share();
                },
              ),
            ),
            SizedBox(width: 60,),
            Expanded(
              child: ElevatedButtonCustom(
                text: "+  Create",
                colorBG: ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                onTap: () {
                  Get.to(EstimateCreate());
                },
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder(
        init: EstimateController(),
        initState: (state) {

        },
        builder: (auth) {
          return Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    shrinkWrap: true,
                    itemCount: controller.estimate.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  // 'Technologies',
                                    controller.estimate[index],
                                    style: TextStylesProductSans.textStyles_16
                                        .apply(
                                        color: (controller.intAppBar.value ==
                                            index)
                                            ? ColorStyle.secondryColor
                                            : ColorStyle.grey,
                                        fontWeightDelta: 2)),
                                Container(
                                  alignment: Alignment.center,
                                  height: 2,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: (controller.intAppBar.value == index)
                                          ? ColorStyle.secondryColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              ],
                            ),
                            onTap: () {
                              controller.intAppBar.value = index;
                            },
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text('June 2022',
                    // controller.estimate1[index],
                    style: TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 2)),
              ),
              if (controller.intAppBar.value == 0)
                Expanded(child: EstimatePending())
              else if (controller.intAppBar.value == 1)
                Expanded(child: EstimateApproved())
              else if (controller.intAppBar.value == 2)
                  Expanded(child: EstimateDeclined()),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 70,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enjoying Business Tracker USA?',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                    Container(
                      height: 15,
                    ),
                    Text('Invite other contractors!',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_16.apply(
                            color: ColorStyle.secondryColor, fontWeightDelta: 3)),
                  ],
                ),
              ),
            ],
          ));
        },
      )
    );
  }
}
