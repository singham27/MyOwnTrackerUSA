import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/EstimateController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/NewEstimate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Estimate extends StatelessWidget {
   Estimate({Key? key}) : super(key: key);
  final controller = Get.put(EstimateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(

          init: EstimateController(),
          initState: (state) {
            controller.reset();

            print(controller.intAppBar.value);
          },
          builder: (authController) {
            return Obx(() =>  SingleChildScrollView(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Estimate',

                          style:  TextStylesProductSans.textStyles_30
                              .apply(color: ColorStyle.black, fontWeightDelta: 2)),
                      InkWell(child:  Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 38,
                        child:  Icon(Icons.search,color: ColorStyle.secondryColor,),
                        decoration: BoxDecoration(
                            color: ColorStyle.secondryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                        onTap: (){},
                      ),

                    ],
                  ),
                  Container(
                    height: 25,),
                  Container(
                    // alignment: Alignment.center,
                    height: 35,
                    // color: ColorStyle.grey,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.estimate.length,
                        scrollDirection: Axis.horizontal,
                        // physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {

                          return Row(
                            children: [
                              InkWell(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [


                                  Text(
                                    // 'Technologies',
                                      controller.estimate[index],
                                      style:  TextStylesProductSans.textStyles_16
                                          .apply(color: (controller.intAppBar.value == index)
                                          ? ColorStyle.secondryColor
                                          : ColorStyle.grey,fontWeightDelta: 2 )
                                  ),
                                  // SizedBox(height: 8,),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 2,
                                    width: 20,

                                    decoration: BoxDecoration(
                                        color: (controller.intAppBar.value == index)
                                            ? ColorStyle.secondryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                  ),

                                ],
                              ),onTap: (){  controller.intAppBar.value = index;},),
                              SizedBox(width: 25,),
                            ],
                          );

                        }),
                  ),
                  Container(
                    height: 15,),
                  Text(
                      'June 2022',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 2)),

                  Container(
                    // alignment: Alignment.center,
                    height: 500,
                    // color: ColorStyle.grey,
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 16),
                        shrinkWrap: true,
                        itemCount: controller.estimate1.length,
                        // scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {


                          return Container(
                            padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                            alignment: Alignment.center,
                            // height: 2,
                            // width: 20,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      // 'Estimate #12345',
                                        controller.estimate1[index],
                                        style:  TextStylesProductSans.textStyles_16
                                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                    Text(
                                        '\$2,500.00',

                                        style:  TextStylesProductSans.textStyles_16
                                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'June 12 • #12345',

                                        style:  TextStylesProductSans.textStyles_16
                                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                    InkWell(child: Container(
                                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                                      alignment: Alignment.center,
                                      // height: 2,
                                      // width: 20,
                                      child: Text(
                                        // 'DRAFT',
                                          controller.estimate2[index],
                                          style:  TextStylesProductSans.textStyles_12
                                              .apply(color: ColorStyle.white, fontWeightDelta: 0)),
                                      decoration: BoxDecoration(
                                          color: ColorStyle.bluee,
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                    ),onTap: (){},)
                                  ],
                                )
                              ],
                            ),
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: ColorStyle.blue,
                                borderRadius: BorderRadius.circular(20)
                            ),
                          );

                        }),
                  ),
                  Container(
                    height: 15,),
                  Text(
                      'Enjoying Business Tracker USA?',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Container(
                    height: 15,),
                  Text(
                      'Invite other contractors!',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.secondryColor, fontWeightDelta: 3)),
                  Container(
                    height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButtonCustom(

                        text: "Invite now",

                        colorBG:ColorStyle.black,
                        colorText: ColorStyle.primaryColor,
                        width: 124,
                        onTap: () {
                          // Get.to(ChooseYourIndustry());
                        },
                      ),
                      ElevatedButtonCustom(
                        text: "+  Create",
                        colorBG:ColorStyle.secondryColor,
                        colorText: ColorStyle.primaryColor,
                        width: 116,
                        onTap: () {
                          Get.to(NewEstimate());
                        },
                      ),
                    ],)

                ],
              ),
            ));
          },
        )


    );
  }
}
