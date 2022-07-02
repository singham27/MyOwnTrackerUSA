import 'package:business_trackers/Controllers/EstimateDetailsController.dart';
import 'package:business_trackers/Views/EstimateCreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/EstimateCreate.dart';
import '../Views/PaymentList.dart';
import '../Utils/Global.dart';


class EstimateDetails extends StatelessWidget {
  EstimateDetails({Key? key}) : super(key: key);

  final controller = Get.put(EstimateDetailsController());

  bottomSheetSend() {
    return Get.bottomSheet(Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              // bottom: 60,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text('Send',
                      style: TextStylesProductSans.textStyles_16.apply(
                          color: ColorStyle.black, fontWeightDelta: 4)),
                ),
                Expanded(child: ListView.builder(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
                    shrinkWrap: true,
                    itemCount: controller.arrSend.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Image.asset(ImageStyle.Group1731,height: 40,),
                                SizedBox(width: 15,),
                                Text(
                                    controller.arrSend[index],
                                    style: TextStylesProductSans.textStyles_16.apply(
                                        color: ColorStyle.black, fontWeightDelta: 0)),
                              ],
                            )
                          ],
                        ),
                        onTap: () {
                          Get.back();

                          if (index == 2) {
                            Get.to(PaymentList());
                          } else if (index == 5) {
                            share();
                          }
                        },
                      );
                    }),)
              ],
            ),
          ),
        )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Estimate #1',
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [
            IconButton(
              icon: Image.asset(ImageStyle.IconlyBold,height: 20,),
              onPressed: () {
                Get.to(EstimateCreate());
              },
            ),
            IconButton(
              icon: Icon(Icons.delete,color: ColorStyle.hex('#FF8989')),
              onPressed: () {

              },
            ),
          ],
        ),
        body: GetBuilder(
          init: EstimateDetailsController(),
          builder: (auth) {
            return Obx(()=>SingleChildScrollView(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Estimate Status',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 5)),
                  SizedBox(height: 20,),
                  Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              child:  Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10,right: 10,),
                                // width:94,
                                // height: 40,
                                child: Text(
                                    'PENDING',
                                    style:  TextStylesProductSans.textStyles_14
                                        .apply(color: (controller.estimateStatus.value == 0)
                                        ? ColorStyle.white
                                        : ColorStyle.black,fontWeightDelta: 2 )
                                ),
                                decoration: BoxDecoration(
                                    color: (controller.estimateStatus.value == 0)
                                        ? ColorStyle.secondryColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: (controller.estimateStatus.value == 0)
                                            ? Colors.transparent
                                            : ColorStyle.black
                                    )
                                ),
                              ),
                              onTap: () {
                                controller.estimateStatus.value = 0;
                              }

                          ),
                          InkWell(
                              child:  Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10,right: 10,),
                                child: Text(
                                    'APPROVED',
                                    style:  TextStylesProductSans.textStyles_14
                                        .apply(color: (controller.estimateStatus.value == 1)
                                        ? ColorStyle.white
                                        : ColorStyle.black,fontWeightDelta: 2 )
                                ),
                                decoration: BoxDecoration(
                                    color: (controller.estimateStatus.value == 1)
                                        ? ColorStyle.hex('#61C842')
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: (controller.estimateStatus.value == 1)
                                            ? Colors.transparent
                                            : ColorStyle.black
                                    )
                                ),
                              ),
                              onTap: () {
                                controller.estimateStatus.value = 1;
                              }

                          ),
                          InkWell(
                              child:  Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 10,right: 10,),
                                child: Text(
                                    'DECLINED',
                                    style:  TextStylesProductSans.textStyles_14
                                        .apply(color: (controller.estimateStatus.value == 2)
                                        ? ColorStyle.white
                                        : ColorStyle.black,fontWeightDelta: 2 )
                                ),
                                decoration: BoxDecoration(
                                    color: (controller.estimateStatus.value == 2)
                                        ? ColorStyle.hex('#FF8989')
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: (controller.estimateStatus.value == 2)
                                            ? Colors.transparent
                                            : ColorStyle.black
                                    )
                                ),
                              ),
                              onTap: () {
                                controller.estimateStatus.value = 2;
                              }

                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                    alignment: Alignment.center,
                    // height: 185,
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Upgrade to Add Your LOGO',
                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                            InkWell(
                              child: Icon(
                                Icons.clear, size: 25,
                              ),
                              onTap: (){
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text(
                            'Upgrade to Business Tracker USA PRO to add '
                                'your logo to your estimates and invoices.',
                            style:  TextStylesProductSans.textStyles_13
                                .apply(color: ColorStyle.black,)),
                        SizedBox(height: 25,),
                        ElevatedButtonCustom(
                          height: 50,
                          text: "Upgrade Now",
                          colorBG:ColorStyle.secondryColor,
                          colorText: ColorStyle.primaryColor,
                          width: MediaQuery.of(context).size.width,
                          onTap: () {
                            // Get.to(ChooseYourIndustry());
                          },
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color:ColorStyle.secondryColor
                        )
                    ),
                  ),
                  SizedBox(height: 42,),
                  Container(
                    alignment: Alignment.center,
                    child:Text(
                        'ESTIMATE',
                        // controller.estimate1[index],
                        style:  TextStylesProductSans.textStyles_10
                            .apply(color: ColorStyle.grey,)),
                  ),
                  SizedBox(height: 9,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(ImageStyle.Group1727,height: 55,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Bill To',
                                style:  TextStylesProductSans.textStyles_10
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                'John Deo',
                                style:  TextStylesProductSans.textStyles_7
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                '100, abc stret',
                                style:  TextStylesProductSans.textStyles_7
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                'abc city, abc, 123456',
                                style:  TextStylesProductSans.textStyles_7
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                '0123 456 7890',
                                style:  TextStylesProductSans.textStyles_7
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                '0123 456 7890',
                                style:  TextStylesProductSans.textStyles_7
                                    .apply(color: ColorStyle.black,)),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'ABC Company',
                                style:  TextStylesProductSans.textStyles_10
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                'Email : johndeo@gmail.com',
                                style:  TextStylesProductSans.textStyles_7
                                    .apply(color: ColorStyle.black,)),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        // padding: EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Estimate #',
                                    style:  TextStylesProductSans.textStyles_7
                                        .apply(color: ColorStyle.black,)),
                                Text(
                                    '1',
                                    style:  TextStylesProductSans.textStyles_7
                                        .apply(color: ColorStyle.black,)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Date',
                                    style:  TextStylesProductSans.textStyles_7
                                        .apply(color: ColorStyle.black,)),
                                Text(
                                    '16/06/2022',
                                    style:  TextStylesProductSans.textStyles_7
                                        .apply(color: ColorStyle.black,)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'PO #',
                                    style:  TextStylesProductSans.textStyles_7
                                        .apply(color: ColorStyle.black,)),
                                Text(
                                    '1234567890',
                                    style:  TextStylesProductSans.textStyles_7
                                        .apply(color: ColorStyle.black,)),
                              ],
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 17,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Description',
                          style:  TextStylesProductSans.textStyles_10
                              .apply(color: ColorStyle.black,)),
                      Text(
                          'Total',
                          style:  TextStylesProductSans.textStyles_10
                              .apply(color: ColorStyle.black,)),


                    ],
                  ),
                  SizedBox(height: 4,),
                  Container(
                    height: 1,
                    color: ColorStyle.black,
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Solid',
                          style:  TextStylesProductSans.textStyles_10
                              .apply(color: ColorStyle.black,)),
                      Text(
                          '\$100.00',
                          style:  TextStylesProductSans.textStyles_9
                              .apply(color: ColorStyle.black,)),


                    ],
                  ),
                  SizedBox(height: 4,),
                  Text(
                      'Lorem ipsum',
                      style:  TextStylesProductSans.textStyles_8
                          .apply(color: ColorStyle.black,)),
                  SizedBox(height: 8,),
                  Container(
                    height: 1,
                    color: ColorStyle.hex('#BBB7C4'),
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Solid',
                          style:  TextStylesProductSans.textStyles_10
                              .apply(color: ColorStyle.black,)),
                      Text(
                          '\$100.00',
                          style:  TextStylesProductSans.textStyles_9
                              .apply(color: ColorStyle.black,)),


                    ],
                  ),
                  SizedBox(height: 4,),
                  Text(
                      'Lorem ipsum',
                      style:  TextStylesProductSans.textStyles_8
                          .apply(color: ColorStyle.black,)),
                  SizedBox(height: 9,),
                  Container(
                    height: 1,
                    color: ColorStyle.hex('#BBB7C4'),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 120,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Subtotal',
                                  style:  TextStylesProductSans.textStyles_8
                                      .apply(color: ColorStyle.black,)),
                              Text(
                                  '\$200.00',
                                  style:  TextStylesProductSans.textStyles_7
                                      .apply(color: ColorStyle.black,)),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 1,
                            color: ColorStyle.hex('#BBB7C4'),
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'GST',
                                  style:  TextStylesProductSans.textStyles_8
                                      .apply(color: ColorStyle.black,)),
                              Text(
                                  '\$24.00',
                                  style:  TextStylesProductSans.textStyles_7
                                      .apply(color: ColorStyle.black,)),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 1,
                            color: ColorStyle.hex('#BBB7C4'),
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Total',
                                  style:  TextStylesProductSans.textStyles_8
                                      .apply(color: ColorStyle.black,)),
                              Text(
                                  '\$224.00',
                                  style:  TextStylesProductSans.textStyles_7
                                      .apply(color: ColorStyle.black,)),
                            ],
                          ),
                          SizedBox(height: 8,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 214,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                  'Payment Schedule',
                                  style:  TextStylesProductSans.textStyles_8
                                      .apply(color: ColorStyle.black,)),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Container(
                            height: 1,
                            color: ColorStyle.black,
                          ),
                          SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '1st Payment (40%)',
                                  style:  TextStylesProductSans.textStyles_8
                                      .apply(color: ColorStyle.black,)),
                              Text(
                                  '\$100.00',
                                  style:  TextStylesProductSans.textStyles_7
                                      .apply(color: ColorStyle.black,)),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '2nd Payment (60%)',
                                  style:  TextStylesProductSans.textStyles_8
                                      .apply(color: ColorStyle.black,)),
                              Text(
                                  '\$124.00',
                                  style:  TextStylesProductSans.textStyles_7
                                      .apply(color: ColorStyle.black,)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 1,
                    color: ColorStyle.hex('#BBB7C4'),
                  ),
                  SizedBox(height: 5,),
                  Text(
                      'Notes',
                      style:  TextStylesProductSans.textStyles_10
                          .apply(color: ColorStyle.black,)),
                  SizedBox(height: 7,),
                  Text(
                      'Lorem Ipsum',
                      style:  TextStylesProductSans.textStyles_8
                          .apply(color: ColorStyle.black,)),
                  SizedBox(height: 30,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width:100,
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.end,
                        children: [
                          Image.asset(ImageStyle.Sign,height: 20,),
                          SizedBox(height:10),
                          Container(
                            height: 1,
                            color: ColorStyle.black,
                          ),
                          SizedBox(height: 8,),
                          Text(
                              'John Deo',
                              style:  TextStylesProductSans.textStyles_8
                                  .apply(color: ColorStyle.black,)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 67,),
                  Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width:103,
                          height: 50,
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Send',
                                  style:  TextStylesProductSans.textStyles_15
                                      .apply(color: ColorStyle.white,)),
                              SizedBox(width: 11,),
                              Icon(Icons.arrow_forward,color: ColorStyle.white
                              ),

                            ],
                          ),
                          decoration: BoxDecoration(
                              color: ColorStyle.secondryColor,
                              borderRadius: BorderRadius.circular(16)
                          ),
                        ),
                        onTap: () {
                          Get.to(bottomSheetSend());
                        },
                      )
                  ),
                ],
              ),
            ));
          },
        )
    );
  }
}
