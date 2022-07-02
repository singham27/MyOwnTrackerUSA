import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditClient.dart';
import 'package:business_trackers/Views/EditContract.dart';
import 'package:business_trackers/Views/ItemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/NewEstimateController.dart';
import '../Views/PaymentSchedule.dart';
import '../Components/SwitchCustom.dart';


class EstimateCreate extends StatelessWidget {
   EstimateCreate({Key? key}) : super(key: key);
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
                  Get.to(EditClient(title: 'Add Client',));
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
                  Get.to( ItemList());
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
                      '\$0.00',
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
                      '\$0.00',
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
                      '\$0.00',
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
                 InkWell(
                   child:  Text(
                     '+ ADD',
                     // controller.estimate1[index],
                     style:  TextStylesProductSans.textStyles_16
                         .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                   onTap: (){
                     Get.to(PaymentSchedule());
                   },)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Contact',
                      // controller.estimate[index],
                      style:  TextStylesProductSans.textStyles_16

                  ),
                  InkWell(
                    child: Text(
                        'Generic Contract ',
                        // controller.estimate[index],
                        style:  TextStylesProductSans.textStyles_16.apply(
                            color: ColorStyle.secondryColor
                        )

                    ),
                    onTap: (){
                      Get.to(EditCotract(isShowDelete: true,));
                    },
                  )
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
                  // InkWell(child:  Image.asset(ImageStyle.Group1709,height: 20,),onTap: (){},)
                  SwitchCustom(
                    onChanged: (value) {
                      print(value);
                    },
                  )
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
