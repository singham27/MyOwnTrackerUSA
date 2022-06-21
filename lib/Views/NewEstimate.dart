import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditClient.dart';
import 'package:business_trackers/Views/EditItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/NewEstimateController.dart';


class NewEstimate extends StatelessWidget {
   NewEstimate({Key? key}) : super(key: key);
  final controller = Get.put(NewEstimateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'New Estimate',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Client',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
               SizedBox(height: 22,),
              InkWell(
                child:  Container(
                  padding: EdgeInsets.only(top: 12,bottom: 12,),
                  alignment: Alignment.center,
                  child: Text(
                      '+  Add Client',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.secondryColor, fontWeightDelta: 2)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorStyle.secondryColor
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                ),
                onTap: (){
                  Get.to(EditClient());
                },
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 26,),
              Text(
                  'Description',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 22,),
              InkWell(
                child:  Container(
                  padding: EdgeInsets.only(top: 12,bottom: 12,),
                  alignment: Alignment.center,
                  child: Text(
                      '+  Add Line Item',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.secondryColor, fontWeightDelta: 2)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorStyle.secondryColor
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                ),
                onTap: (){
                  Get.to( EditItem());
                },
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Subtotal',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      'S0.00',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Tax',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      'S0.00',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Total Amount',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      'S0.00',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 15,),
              Text(
                  'Payment Options',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Payment Schedule',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                 InkWell(child:  Text(
                     '+ ADD',
                     // controller.estimate1[index],
                     style:  TextStylesProductSans.textStyles_16
                         .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),onTap: (){},)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 15,),
              Text(
                  'Notes for Client ',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 8,),
              TextField (
            decoration: InputDecoration(
                border: InputBorder.none,

                hintText: 'Add Notes'
            ),
          ),
              SizedBox(height: 80,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 15,),
              Text(
                  'Contract & Signature',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 15,),
              Container(
                // alignment: Alignment.center,
                height: 35,
                // color: ColorStyle.grey,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.estimate.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {

                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(child:   Container(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      alignment: Alignment.center,
                      // height: 2,
                      // width: 20,
                      child:  Text(
                      // 'Technologies',
                      controller.estimate[index],
                      style:  TextStylesProductSans.textStyles_12
                          .apply(color: (controller.intAppBar.value == index)
                      ? ColorStyle.white
                          : ColorStyle.black,fontWeightDelta: 2 )
                      ),
                      decoration: BoxDecoration(
                      color: (controller.intAppBar.value == index)
                      ? ColorStyle.secondryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5)
                      ),
                      ),
                            onTap: (){  controller.intAppBar.value = index;},),
                          SizedBox(width: 25,),
                        ],
                      );

                    }),
              ),
              SizedBox(height: 15,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 15,),
              Text(
                  'Signature',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Client Signature',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  InkWell(child:  Image.asset(ImageStyle.Group1709,height: 20,),onTap: (){},)
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 15,),
              Text(
                  'Document Info',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Estimate #',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      '1',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Date',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      'Thursday, 16 June 2022',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'PO',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      '00000',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                ],
              ),
              SizedBox(height: 30,),
          ElevatedButtonCustom(
            height: 60,
                text: "Save",
                colorBG:ColorStyle.grays,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(ChooseYourIndustry());
                },
              ),

            ],
          ),
        )
    );
  }
}
