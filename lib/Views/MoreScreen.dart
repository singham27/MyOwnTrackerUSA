import 'package:business_trackers/Controllers/MoreScreenController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/MyAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
   MoreScreen({Key? key}) : super(key: key);
  final controller = Get.put(MoreScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'More',

                style:  TextStylesProductSans.textStyles_30
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            SizedBox(height: 20,),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 20,bottom: 20),
                child: Row(

                  children: [
                    Container(

                        child: Icon(Icons.person,size: 30,color: ColorStyle.secondryColor,),
                        decoration: BoxDecoration(
                          color: ColorStyle.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        width: 50
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'My Account',

                            style:  TextStylesProductSans.textStyles_16
                                .apply(color: ColorStyle.white,fontWeightDelta: 4)),
                        SizedBox(height: 6,),
                        Text(
                            'johndeo@gmail.com',

                            style:  TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.white,fontWeightDelta: 4)),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: ColorStyle.secondryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onTap: (){
                Get.to( MyAccount());
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height-262,
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16),
                  shrinkWrap: true,
                  itemCount: controller.images1.length,
                  // scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 6),
                      padding: EdgeInsets.only(left: 16,right: 16,top: 20,bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Image.asset(controller.images1[index],height: 60,),
                                decoration: BoxDecoration(
                                  color: ColorStyle.hex('#F2EBFF'),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // height: 50,
                                // width: 50
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // 'My Account',
                                      controller.moreItem[index],
                                      style:  TextStylesProductSans.textStyles_16
                                          .apply(color: ColorStyle.black,fontWeightDelta: 4)),
                                  SizedBox(height: 6,),
                                  Text(
                                    // 'johndeo@gmail.com',
                                      controller.moreItem1[index],
                                      style:  TextStylesProductSans.textStyles_14
                                          .apply(color: ColorStyle.grey.withOpacity(.3),fontWeightDelta: 4)),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                              decoration: BoxDecoration(
                                color: ColorStyle.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              height: 1,
                              // width: 50
                          ),
                        ],
                      ),

                    );

                  }),
            ),
          ],
        ),
      ),
    );
  }
}
