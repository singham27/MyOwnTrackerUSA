import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/EstimateDeclinedContoller.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimateDeclined extends StatelessWidget {
   EstimateDeclined({Key? key}) : super(key: key);
  final controller = Get.put(EstimateDeclinedContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 460,
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    itemCount: 4,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(right: 16,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // padding: EdgeInsets.only(top: ),
                              alignment: Alignment.center,
                              height: 100,
                              width: 12,

                              decoration: BoxDecoration(
                                color: ColorStyle.hex('#FF8989'),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                    'John Deo',
                                    // controller.estimate1[index],
                                    style:  TextStylesProductSans.textStyles_16
                                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                SizedBox(height: 18,),
                                Text(
                                    'June 12 Thu • #12345',

                                    style:  TextStylesProductSans.textStyles_16
                                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),



                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [



                                Text(
                                    '\$2,500.00',

                                    style:  TextStylesProductSans.textStyles_16
                                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                SizedBox(height: 18,),
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



            ],
          ),
        )


    );
  }
}

