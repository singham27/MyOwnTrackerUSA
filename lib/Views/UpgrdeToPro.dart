import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UpgrdeToPro extends StatelessWidget {
  const UpgrdeToPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
             InkWell(
               child:  Image.asset(ImageStyle.Group1718,height: 34,),
               onTap: (){
                 Get.back();
               },
             ),
              SizedBox(height: 40,),
              Text(
                  'Upgrade now to continue',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_20
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)),
              Row(
                children: [
                  Text(
                      'accessing these',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_20
                          .apply(color: ColorStyle.black, fontWeightDelta: 3)),
                  Text(
                      ' Pro Feature',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_20
                          .apply(color: ColorStyle.secondryColor, fontWeightDelta: 3)),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Business Tracker USA',
                                  // controller.estimate1[index],
                                  style:  TextStylesProductSans.textStyles_14
                                      .apply(color: ColorStyle.white, fontWeightDelta: 0)),
                              SizedBox(width: 50,),
                              InkWell(
                                child:   Container(
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Text(
                                      'PRO',
                                      // controller.estimate1[index],
                                      style:  TextStylesProductSans.textStyles_14
                                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                  decoration: BoxDecoration(
                                    color: ColorStyle.white,
                                    borderRadius: BorderRadius.circular(5),

                                  ),
                                ),
                                onTap: (){},
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                              'Look Professional and Get More Jobs',
                              // controller.estimate1[index],
                              style:  TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.white, fontWeightDelta: 0)),

                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight:  Radius.circular(18),
                          topLeft: Radius.circular(18)
                        ),
                          color: ColorStyle.secondryColor,


                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Logo Branding',
                              // controller.estimate1[index],
                              style:  TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                          SizedBox(height: 20,),
                          Text(
                              'Custom Contracts',
                              // controller.estimate1[index],
                              style:  TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                          SizedBox(height: 20,),
                          Text(
                              'Work Orders',
                              // controller.estimate1[index],
                              style:  TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                          SizedBox(height: 20,),
                          Text(
                              'QuickBooks Sync',
                              // controller.estimate1[index],
                              style:  TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.black, fontWeightDelta: 0)),

                        ],
                      ),

                    ),
                    SizedBox(height: 40,),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20,),
                      child: ElevatedButtonCustom(
                        height: 60,
                        text: "UPGRDE TO PRO",
                        colorBG:ColorStyle.secondryColor,
                        colorText: ColorStyle.primaryColor,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          // Get.to(EditCotract());
                        },
                      ),

                    ),
                    SizedBox(height: 40,),

                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: ColorStyle.secondryColor
                  )
                ),
              ),
              SizedBox(height: 40,),
            Container(
              alignment: Alignment.center,
              child:    InkWell(
                child:   Text(
                    "I'LL UPDRAGE LATER",
                    style:  TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.secondryColor, fontWeightDelta: 3)),
                onTap: (){
                  Get.back();
                },
              ),


            )
            ],
          ),
        )
    );
  }
}
