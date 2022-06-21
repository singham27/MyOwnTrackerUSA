import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Controllers/MyCompanyController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyCompany extends StatelessWidget {
   MyCompany({Key? key}) : super(key: key);
  final controller = Get.put(MyCompanyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'My Company',
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
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: Column(
                    children: [
                      Container(

                          child: Image.asset(ImageStyle.Group1727,height: 22,),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorStyle.grey,
                              )
                          ),
                          height: 150,
                          width: 150
                      ),
                      SizedBox(height: 12,),
                      Text(
                          'Change Logo',

                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black,fontWeightDelta: 0)),
                    ],
                  ),
                  onTap: (){},
                ),



              ),

              Text(
                  'Basic Info',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              TextFieldEditCompny(),
              SizedBox(height: 20,),
              Text(
                  'Additional Information',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 12,),
              TextField (
                decoration: InputDecoration(
                  // border: InputBorder.none,

                    hintText: 'Phone #2'
                ),
              ),
              SizedBox(height: 12,),
              TextField (
                decoration: InputDecoration(
                  // border: InputBorder.none,

                    hintText: 'Website '
                ),
              ),
              SizedBox(height: 22,),


              Text(
                  'Licence and information',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 30,),
              Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                           'Licence Document',
                           // controller.estimate1[index],
                           style:  TextStylesProductSans.textStyles_16
                               .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                       InkWell(
                         child: Text(
                             '+ ADD',
                             // controller.estimate1[index],
                             style:  TextStylesProductSans.textStyles_16
                                 .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                         onTap: (){},
                       )
                     ],
                   ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Insurance Document',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  InkWell(
                    child: Text(
                        '+ ADD',
                        // controller.estimate1[index],
                        style:  TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                    onTap: (){},
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 30,),
              Text(
                  'Website and Social Media',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              Container(
                // alignment: Alignment.center,
                height: MediaQuery.of(context).size.height-500,
                // color: ColorStyle.blue,
                child: ListView.builder(
                    // padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    itemCount: controller.images1.length,
                    // scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {


                      return   Column(
                        children: [
                          SizedBox(height: 30,),
                         InkWell(
                           child:  Row(
                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Image.asset(controller.images1[index],height: 38,),
                               SizedBox(width: 12,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     // 'www.abcd.com',
                                       controller.moreItem[index],
                                       style:  TextStylesProductSans.textStyles_16
                                           .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                   SizedBox(height: 12,),

                                   Container(
                                     height: 1,
                                     width: MediaQuery.of(context).size.width-90,
                                     alignment: Alignment.center,

                                     decoration: BoxDecoration(
                                         color: ColorStyle.grey,
                                         borderRadius: BorderRadius.circular(8)
                                     ),
                                   ),
                                 ],
                               )

                             ],
                           ),
                           onTap: (){},
                         )
                        ],
                      );

                    }),
              ),










              SizedBox(height: 30,),

              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG:ColorStyle.secondryColor,
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
