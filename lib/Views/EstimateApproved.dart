import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/EstimateApprovedController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EstimateApproved extends StatelessWidget {
   EstimateApproved({Key? key}) : super(key: key);
  final controller = Get.put(EstimateApprovedController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,top: 30),
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
                height: 35,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.estimate.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
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
                height: 460,
                // color: ColorStyle.grey,
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    // itemCount: 20,
                    // scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {


                      return Container(
                        // padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),

                        child: Row(
                          children: [
                            Container(
                              // padding: EdgeInsets.only(top: ),
                              alignment: Alignment.center,
                              height: 100,
                              width: 12,

                              decoration: BoxDecoration(
                                  color: ColorStyle.hex('#61C842'),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                            ),
                            Container(
                              width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                               Row(

                                 children: [
                                   Text(
                                       'John Deo',
                                       // controller.estimate1[index],
                                       style:  TextStylesProductSans.textStyles_16
                                           .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                   Container(
                                     width: 147,),
                                   Text(
                                       '\$2,500.00',

                                       style:  TextStylesProductSans.textStyles_16
                                           .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                 ],
                               ),
                                Container(
                                  height: 10,),
                                Row(

                                  children: [
                                    Text(
                                        'June 12 • #12345',

                                        style:  TextStylesProductSans.textStyles_16
                                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                    Container(
                                      width: 50,),
                                    Container(
                                      child: Row(
                                        children: [
                                          InkWell(child:Image.asset(ImageStyle.Path475,height: 20,),onTap: (){},),
                                          Container(
                                            width: 15,),
                                          InkWell(child: Container(
                                            padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                                            alignment: Alignment.center,
                                            // height: 2,
                                            // width: 20,
                                            child: Text(
                                                'INVOICED',
                                                // controller.estimate2[index],
                                                style:  TextStylesProductSans.textStyles_12
                                                    .apply(color: ColorStyle.white, fontWeightDelta: 0)),
                                            decoration: BoxDecoration(
                                                color: ColorStyle.grays,
                                                borderRadius: BorderRadius.circular(6)
                                            ),
                                          ),onTap: (){},)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
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
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 0)),
              Container(
                height: 15,),
              Text(
                  'Invite other contractors!',
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
                      // Get.to(.NewEstimate());
                    },
                  ),
                ],)
            ],
          ),
        )
    );
  }
}