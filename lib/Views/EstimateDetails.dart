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
import '../Models/ModelEstimate.dart';

class EstimateDetails extends StatelessWidget {
  String title;
  ModelEstimate modelEstimate;

  EstimateDetails({Key? key, required this.modelEstimate, required this.title}) : super(key: key);

  final controller = Get.put(EstimateDetailsController());

  bottomSheetSend() {
    return showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: Get.context!,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
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
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Send',
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                ),
                Expanded(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
                      shrinkWrap: true,
                      itemCount: title.toLowerCase().contains('invoice') ? controller.arrSendInvoice.length : controller.arrSendEstimate.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    ImageStyle.Group1731,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                      title.toLowerCase().contains('invoice') ? controller.arrSendInvoice[index] : controller.arrSendEstimate[index],
                                      style: TextStylesProductSans.textStyles_16
                                          .apply(
                                              color: ColorStyle.black,
                                              fontWeightDelta: 0)),
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            Get.back();
                            if (index == 2) {
                              // Get.to(PaymentList());
                            } else if (index == 6) {
                              share();
                            }
                          },
                        );
                      }),
                )
              ],
            ),
          );
        });
  }

  delete() {
    Widget cancelButton = TextButton(
      child: Text(
        'Delete',
        style: TextStylesProductSans.textStyles_16.apply(fontWeightDelta: 0),
      ),
      onPressed: () {
        Get.back();
        controller.deleteEstimate(modelEstimate.id.toString());
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        'Cancel',
        style: TextStylesProductSans.textStyles_16.apply(fontWeightDelta: 0),
      ),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        'Are you sure?',
        style: TextStylesProductSans.textStyles_16
            .apply(color: Colors.red, fontWeightDelta: 0),
      ),
      content: Text(
        'Do you want to delete this estimate?',
        style: TextStylesProductSans.textStyles_16.apply(fontWeightDelta: 0),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: '${title}#' + modelEstimate.docID.toString(),
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [
            IconButton(
              icon: Image.asset(
                ImageStyle.IconlyBold,
                height: 20,
              ),
              onPressed: () {
                Get.to(EstimateCreate(
                  title: 'Edit ${title}',
                  estimate: modelEstimate,
                ));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: ColorStyle.hex('#FF8989')),
              onPressed: () {
                Future.delayed(Duration(microseconds: 100), () {
                  delete();
                });
              },
            ),
          ],
        ),
        body: GetBuilder(
          init: EstimateDetailsController(),
          initState: (state) {
            controller.onInit();
            if (modelEstimate.states.toString().toLowerCase() == 'pending') {
              controller.estimateStatus.value = 0;
            } else if (modelEstimate.states.toString().toLowerCase() == 'approved') {
              controller.estimateStatus.value = 1;
            } else if (modelEstimate.states.toString().toLowerCase() == 'declined') {
              controller.estimateStatus.value = 2;
            }
          },
          builder: (auth) {
            return Obx(() => SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Estimate Status',
                          style: TextStylesProductSans.textStyles_16.apply(
                              color: ColorStyle.black, fontWeightDelta: 5)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    // width:94,
                                    // height: 40,
                                    child: Text('PENDING',
                                        style: TextStylesProductSans
                                            .textStyles_14
                                            .apply(
                                                color: (controller
                                                            .estimateStatus
                                                            .value ==
                                                        0)
                                                    ? ColorStyle.white
                                                    : ColorStyle.black,
                                                fontWeightDelta: 2)),
                                    decoration: BoxDecoration(
                                        color:
                                            (controller.estimateStatus.value ==
                                                    0)
                                                ? ColorStyle.secondryColor
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: (controller
                                                        .estimateStatus.value ==
                                                    0)
                                                ? Colors.transparent
                                                : ColorStyle.black)),
                                  ),
                                  onTap: () {
                                    controller.estimateStatus.value = 0;
                                    controller.updateEstimateStates(modelEstimate.id.toString(), 'Pending');
                                  }),
                              InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Text('APPROVED',
                                        style: TextStylesProductSans
                                            .textStyles_14
                                            .apply(
                                                color: (controller
                                                            .estimateStatus
                                                            .value ==
                                                        1)
                                                    ? ColorStyle.white
                                                    : ColorStyle.black,
                                                fontWeightDelta: 2)),
                                    decoration: BoxDecoration(
                                        color:
                                            (controller.estimateStatus.value ==
                                                    1)
                                                ? ColorStyle.hex('#61C842')
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: (controller
                                                        .estimateStatus.value ==
                                                    1)
                                                ? Colors.transparent
                                                : ColorStyle.black)),
                                  ),
                                  onTap: () {
                                    controller.estimateStatus.value = 1;
                                    controller.updateEstimateStates(modelEstimate.id.toString(), 'Approved');
                                  }),
                              InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Text('DECLINED',
                                        style: TextStylesProductSans
                                            .textStyles_14
                                            .apply(
                                                color: (controller
                                                            .estimateStatus
                                                            .value ==
                                                        2)
                                                    ? ColorStyle.white
                                                    : ColorStyle.black,
                                                fontWeightDelta: 2)),
                                    decoration: BoxDecoration(
                                        color:
                                            (controller.estimateStatus.value ==
                                                    2)
                                                ? ColorStyle.hex('#FF8989')
                                                : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: (controller
                                                        .estimateStatus.value ==
                                                    2)
                                                ? Colors.transparent
                                                : ColorStyle.black)),
                                  ),
                                  onTap: () {
                                    controller.estimateStatus.value = 2;
                                    controller.updateEstimateStates(modelEstimate.id.toString(), 'Declined');
                                  }),
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                      //   alignment: Alignment.center,
                      //   child: Column(
                      //     children: [
                      //       SizedBox(height: 15,),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //               'Upgrade to Add Your LOGO',
                      //               style:  TextStylesProductSans.textStyles_16
                      //                   .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                      //           InkWell(
                      //             child: Icon(
                      //               Icons.clear, size: 25,
                      //             ),
                      //             onTap: (){
                      //             },
                      //           ),
                      //         ],
                      //       ),
                      //       SizedBox(height: 15,),
                      //       Text(
                      //           'Upgrade to Business Tracker USA PRO to add '
                      //               'your logo to your estimates and invoices.',
                      //           style:  TextStylesProductSans.textStyles_13
                      //               .apply(color: ColorStyle.black,)),
                      //       SizedBox(height: 25,),
                      //       ElevatedButtonCustom(
                      //         height: 50,
                      //         text: "Upgrade Now",
                      //         colorBG:ColorStyle.secondryColor,
                      //         colorText: ColorStyle.primaryColor,
                      //         width: MediaQuery.of(context).size.width,
                      //         onTap: () {
                      //           // Get.to(ChooseYourIndustry());
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //       border: Border.all(
                      //           color:ColorStyle.secondryColor
                      //       )
                      //   ),
                      // ),
                      // SizedBox(height: 42,),
                      Container(
                        alignment: Alignment.center,
                        child: Text('ESTIMATE',
                            style: TextStylesProductSans.textStyles_10.apply(
                              color: ColorStyle.grey,
                            )),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset(ImageStyle.Group1727,height: 55,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                                controller.controllerMyCompany.logoURL.value,
                                height: 55,
                                width: 55,
                                fit: BoxFit.fill,
                                errorBuilder: (context, exception, stackTrace) {
                              return Image.asset(
                                ImageStyle.Group1727,
                                height: 55,
                              );
                            }),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bill To',
                                    style: TextStylesProductSans.textStyles_10
                                        .apply(
                                      color: ColorStyle.black,
                                    )),
                                Text(
                                    modelEstimate.client!.name.toString() +
                                        '\n' +
                                        modelEstimate.client!.billing_address_1
                                            .toString() +
                                        '\n' +
                                        modelEstimate.client!.billing_address_2
                                            .toString() +
                                        '\n' +
                                        modelEstimate.client!.billing_city
                                            .toString() +
                                        '\n' +
                                        modelEstimate
                                            .client!.billing_state_Province
                                            .toString() +
                                        '\n' +
                                        modelEstimate
                                            .client!.billing_zip_Postal_Code
                                            .toString(),
                                    style: TextStylesProductSans.textStyles_7
                                        .apply(
                                      color: ColorStyle.black,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller
                                        .controllerMyCompany.nameOutSide.value,
                                    style: TextStylesProductSans.textStyles_10
                                        .apply(
                                      color: ColorStyle.black,
                                    )),
                                Text(
                                    'Email: ' +
                                        controller.controllerMyCompany
                                            .emailOutSide.value,
                                    style: TextStylesProductSans.textStyles_7
                                        .apply(
                                      color: ColorStyle.black,
                                    )),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Estimate #',
                                        style: TextStylesProductSans
                                            .textStyles_7
                                            .apply(
                                          color: ColorStyle.black,
                                        )),
                                    Text(modelEstimate.docID.toString(),
                                        style: TextStylesProductSans
                                            .textStyles_7
                                            .apply(
                                          color: ColorStyle.black,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Date',
                                        style: TextStylesProductSans
                                            .textStyles_7
                                            .apply(
                                          color: ColorStyle.black,
                                        )),
                                    Text(modelEstimate.date.toString(),
                                        style: TextStylesProductSans
                                            .textStyles_7
                                            .apply(
                                          color: ColorStyle.black,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('PO #',
                                        style: TextStylesProductSans
                                            .textStyles_7
                                            .apply(
                                          color: ColorStyle.black,
                                        )),
                                    Text(modelEstimate.po.toString(),
                                        style: TextStylesProductSans
                                            .textStyles_7
                                            .apply(
                                          color: ColorStyle.black,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Items Description',
                              style: TextStylesProductSans.textStyles_10.apply(
                                color: ColorStyle.black,
                              )),
                          Text('Total',
                              style: TextStylesProductSans.textStyles_10.apply(
                                color: ColorStyle.black,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 1,
                        color: ColorStyle.black,
                      ),
                      SizedBox(height: 10),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: modelEstimate.items!.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1,
                            color: ColorStyle.hex('#BBB7C4'),
                            margin: EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                            ),
                          );
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      modelEstimate.items![index].name
                                          .toString(),
                                      style: TextStylesProductSans.textStyles_10
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                          'QTY: ' +
                                              modelEstimate
                                                  .items![index].quantity
                                                  .toString(),
                                          style: TextStylesProductSans
                                              .textStyles_9
                                              .apply(
                                            color: ColorStyle.black,
                                          )),
                                      Text(' | ',
                                          style: TextStylesProductSans
                                              .textStyles_9
                                              .apply(
                                            color: ColorStyle.black,
                                          )),
                                      Text(
                                          '\$ ' +
                                              modelEstimate.items![index].rate
                                                  .toString(),
                                          style: TextStylesProductSans
                                              .textStyles_9
                                              .apply(
                                            color: ColorStyle.black,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                  modelEstimate.items![index].description
                                      .toString(),
                                  style:
                                      TextStylesProductSans.textStyles_8.apply(
                                    color: ColorStyle.black,
                                  )),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 1,
                        color: ColorStyle.hex('#BBB7C4'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Subtotal',
                                      style: TextStylesProductSans.textStyles_8
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                  Text(
                                      '\$ ' + modelEstimate.subTotal.toString(),
                                      style: TextStylesProductSans.textStyles_7
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 1,
                                color: ColorStyle.hex('#BBB7C4'),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Tax ' +
                                          '(${controller.taxCalcuation(modelEstimate.items!).toString()}%)',
                                      style: TextStylesProductSans.textStyles_8
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                  Text(
                                      '\$ ' +
                                          controller.taxPriceCaluculation(
                                              modelEstimate),
                                      style: TextStylesProductSans.textStyles_7
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 1,
                                color: ColorStyle.hex('#BBB7C4'),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total',
                                      style: TextStylesProductSans.textStyles_8
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                  Text(
                                      '\$ ' +
                                          modelEstimate.amountTotal.toString(),
                                      style: TextStylesProductSans.textStyles_7
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text('Payment Schedule',
                                      style: TextStylesProductSans.textStyles_8
                                          .apply(
                                        color: ColorStyle.black,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 1,
                                color: ColorStyle.black,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: modelEstimate
                                    .paymentSchedule!.paymentList!.length,
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 1,
                                    color: ColorStyle.hex('#BBB7C4'),
                                    margin: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6,
                                    ),
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          // '1st Payment (40%)',
                                          modelEstimate.paymentSchedule!
                                              .paymentList![index].paymentName
                                              .toString(),
                                          // + '(${modelEstimate.paymentSchedule!.paymentType.toString()})',
                                          style: TextStylesProductSans
                                              .textStyles_8
                                              .apply(
                                            color: ColorStyle.black,
                                          )),
                                      Text(
                                          '\$ ' +
                                              modelEstimate
                                                  .paymentSchedule!
                                                  .paymentList![index]
                                                  .paymentAmount
                                                  .toString(),
                                          style: TextStylesProductSans
                                              .textStyles_7
                                              .apply(
                                            color: ColorStyle.black,
                                          )),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 1,
                        color: ColorStyle.hex('#BBB7C4'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Notes',
                          style: TextStylesProductSans.textStyles_10.apply(
                            color: ColorStyle.black,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(modelEstimate.notes.toString(),
                          style: TextStylesProductSans.textStyles_8.apply(
                            color: ColorStyle.black,
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                ImageStyle.Sign,
                                height: 20,
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 1,
                                color: ColorStyle.black,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text('John Deo',
                                  style:
                                      TextStylesProductSans.textStyles_8.apply(
                                    color: ColorStyle.black,
                                  )),
                              Text('Signed on: 17/06/2022',
                                  style:
                                      TextStylesProductSans.textStyles_8.apply(
                                    color: ColorStyle.black,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              width: 103,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Send',
                                      style: TextStylesProductSans.textStyles_15
                                          .apply(
                                        color: ColorStyle.white,
                                      )),
                                  SizedBox(
                                    width: 11,
                                  ),
                                  Icon(Icons.arrow_forward,
                                      color: ColorStyle.white),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: ColorStyle.secondryColor,
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            onTap: () {
                              Get.to(bottomSheetSend());
                            },
                          )),
                    ],
                  ),
                ));
          },
        ));
  }
}
