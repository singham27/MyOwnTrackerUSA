import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Models/ModelClient.dart';
import 'package:business_trackers/Models/ModelEstimate.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/Clients.dart';
import 'package:business_trackers/Views/DocumentSettings.dart';
import 'package:business_trackers/Views/ItemList.dart';
import 'package:business_trackers/Views/SignatureScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controllers/EstimateCreateController.dart';
import '../Views/PaymentSchedule.dart';
import '../Components/SwitchCustom.dart';
import '../Components/PickerCustom.dart';
import 'dart:typed_data';
import 'package:intl/intl.dart';



class EstimateCreate extends StatelessWidget {
  String title;
  ModelEstimate? estimate;
  EstimateCreate({Key? key, required this.title, this.estimate}) : super(key: key);
  final controller = Get.put(EstimateCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: title,
          leading: BackButton(
            color: ColorStyle.black,
            onPressed: () {
              Get.back();
              controller.refresh();
            },
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: EstimateCreateController(),
          initState: (state) {
            if (estimate != null) {
              if (estimate!.signature != null) {
                controller.signature.value = estimate!.signature!.toJson();
                controller.isSwitchOn.value = true;
              }

              controller.selectedClient.value = estimate!.client!;
              controller.arrSelectedItem.value = estimate!.items!;
              controller.paymentSchedule.value = estimate!.paymentSchedule!.toJson();
              controller.genericContract.value = estimate!.contract!.toJson();

              controller.txtNotes.value.text = estimate!.notes!;
              controller.docID.value.text = estimate!.docID!;
              controller.date.value = estimate!.date!;
              controller.txtPO.value.text = estimate!.po!;
            }
          },

          builder: (auth) {
            return Obx(()=>SingleChildScrollView(
              padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Client',
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  SizedBox(height: 22,),
                  if (controller.selectedClient.value.name == null)
                    InkWell(
                      child:  Container(
                        padding: EdgeInsets.only(top: 12,bottom: 12,),
                        alignment: Alignment.center,
                        child: Text(
                            '+  Add Client',
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
                        Get.to(Clients(isFromEstimate: true))!
                            .then((value) {
                          controller.selectedClient.value = value;
                        });
                      },
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              controller.selectedClient.value.name.toString(),
                              style:  TextStylesProductSans.textStyles_16
                                  .apply(color: ColorStyle.black, fontWeightDelta: 2)),
                        ),
                        InkWell(
                          child: Text(
                              'Edit Client',
                              style:  TextStylesProductSans.textStyles_16
                                  .apply(color: ColorStyle.secondryColor, fontWeightDelta: 2)),
                          onTap: () {
                            Get.to(Clients(isFromEstimate: true))!
                                .then((value) {
                              controller.selectedClient.value = value;
                            });
                          },
                        ),
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
                  SizedBox(height: 16,),
                  Text(
                      'Description',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  if (controller.arrSelectedItem.isNotEmpty)
                    Column(
                      children: [
                        SizedBox(height: 10,),
                        ListView.separated(
                          itemCount: controller.arrSelectedItem.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Container(
                              height: 1,
                              color: ColorStyle.grey,
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text(
                                        controller.arrSelectedItem[index].name.toString(),
                                        style:  TextStylesProductSans.textStyles_16
                                            .apply(color: ColorStyle.black,))),
                                    Row(
                                      children: [
                                        Text(
                                            controller.arrSelectedItem[index].quantity.toString()+'x ',
                                            style:  TextStylesProductSans.textStyles_14
                                                .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                                        Text(
                                            '\$'+controller.arrSelectedItem[index].rate.toString(),
                                            style:  TextStylesProductSans.textStyles_14
                                                .apply(color: ColorStyle.black,)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    controller.arrSelectedItem[index].description.toString(),
                                    style:  TextStylesProductSans.textStyles_14
                                        .apply(color: ColorStyle.grey,)),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  SizedBox(height: 20,),
                  InkWell(
                    child:  Container(
                      padding: EdgeInsets.only(top: 12,bottom: 12,),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorStyle.secondryColor
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(
                          controller.arrSelectedItem.isEmpty ?
                          '+ Add Line Item'
                              : 'Organize Line Item',
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.secondryColor, fontWeightDelta: 2)),
                    ),
                    onTap: () {
                      Get.to( ItemList(isFromEstimate: true))!
                          .then((value) {
                        controller.arrSelectedItem.value = value;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Subtotal',
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                      Text(
                          '\$'+controller.subTotal().toStringAsFixed(2),
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Tax '+'(${controller.taxTotal().toStringAsFixed(2)} %)',
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                      Text(
                          '\$'+controller.tax().toStringAsFixed(2),
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
                          '\$'+controller.totalAmount().toStringAsFixed(2),
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
                            controller.paymentSchedule.value.isEmpty
                                ? '+ Add' : 'Edit',
                            style:  TextStylesProductSans.textStyles_16
                                .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                        onTap: () {
                          Get.to( PaymentSchedule(paymentSchedule: controller.paymentSchedule.value,))!
                              .then((value) {
                            controller.paymentSchedule.value = value;
                          });
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
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  SizedBox(height: 8,),
                  TextFieldUnderline(
                    controller: controller.txtNotes.value,
                    maxLines: 6,
                    textStyle: TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black),
                    hintText: 'Add Notes',
                    padding: EdgeInsets.only(
                        bottom: 10
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                      'Contract & Signature',
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Contract',
                          style:  TextStylesProductSans.textStyles_16
                      ),
                      InkWell(
                        child: Text(
                            controller.genericContract.value.isEmpty ?
                            'Generic Contract' : controller.genericContract.value['name'].toString(),
                            style:  TextStylesProductSans.textStyles_16.apply(
                                color: ColorStyle.secondryColor
                            )
                        ),
                        onTap: (){
                          Get.to(DocumentSettings(isFromEstimate: true))!
                              .then((value) {
                            controller.genericContract.value = value;
                          });
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
                        isSwitched: controller.isSwitchOn.value,
                        onChanged: (value) {
                          Get.focusScope!.unfocus();

                          controller.isSwitchOn.value = !controller.isSwitchOn.value;

                          if (controller.isSwitchOn.value) {
                            Get.to(SignatureScreen())!.then((valueBack) {
                              if (valueBack == null) {
                                controller.isSwitchOn.value = false;
                                controller.signature.value = {};
                              } else {
                                final dataImage = valueBack as Uint8List;
                                controller.imageDataSignature.value = dataImage;

                                controller.uploadImage();
                              }
                            });
                          } else {
                            controller.signature.value = {};
                          }
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
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                      Expanded(
                        child: TextField(
                          controller: controller.docID.value,
                          style: TextStylesProductSans.textStyles_16.apply(color: ColorStyle.black, fontWeightDelta: 0),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintText: 'Type info ...',
                            hintStyle: TextStylesProductSans.textStyles_16.apply(color: ColorStyle.grey, fontWeightDelta: 0),
                          ),
                        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Date',
                          // controller.estimate1[index],
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                      InkWell(
                        child: Text(
                            controller.date.value,
                            style:  TextStylesProductSans.textStyles_16.apply(
                                color: (controller.date.value == 'Pick a date') ? ColorStyle.grey : ColorStyle.black,
                                fontWeightDelta: 0
                            )),
                        onTap: () async {
                          controller.date.value = await PickerCustom.datePicker('E, dd MMMM yyyy');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'PO',
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                      Expanded(
                        child: TextFieldUnderlinePrefixText(
                          controller: controller.txtPO.value,
                          textStyle: TextStylesProductSans.textStyles_15.apply(color: ColorStyle.black, fontWeightDelta: 0),
                          prefixText: '',
                          hintText: '0000',
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  ElevatedButtonCustom(
                    height: 60,
                    text: "Save",
                    colorBG:ColorStyle.secondryColor,
                    colorText: ColorStyle.white,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      if (title.toLowerCase().contains('edit')) {
                        controller.estimateID = estimate!.id!;
                        controller.estimate = estimate;
                      }
                      controller.validation(title);
                    },
                  ),
                ],
              ),
            ));
          },
        )
    );
  }
}

