import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/EstimateController.dart';
import 'package:business_trackers/Controllers/PaymentScheduleController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/UpgrdeToPro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/TextFieldCustom.dart';

class PaymentSchedule extends StatelessWidget {
  Map<String, dynamic> paymentSchedule;
  PaymentSchedule({Key? key, this.paymentSchedule = const {}}) : super(key: key);

  final controller = Get.put(PaymentScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Payment Schedule',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(left: 30, bottom: 30),
          child:
          ElevatedButtonCustom(
            height: 60,
            text: "Save",
            colorBG: ColorStyle.secondryColor,
            colorText: ColorStyle.primaryColor,
            width: MediaQuery.of(context).size.width,
            onTap: () {
              Get.focusScope!.unfocus();

              List<Map<String, dynamic>> arrPaymentSchedule = [];

              for (int i = 0; i<controller.arrPaymentName.length; i++) {
                final mapPayments = {
                  'payment_name': controller.arrPaymentName[i].value.text,
                  'payment_amount': controller.arrPaymentAmount[i].value.text,
                };

                arrPaymentSchedule.add(mapPayments);
              }

              final mapPaymentSchedule = {
                'payment_Type': (controller.selectedPaymentMode.value == 0) ? '%' : '\$',
                'payment_List': arrPaymentSchedule
              };

              // debugPrint(mapPaymentSchedule.toString());

              Get.back(result: mapPaymentSchedule);
            },
          ),
        ),
        body: GetBuilder(
          init: PaymentScheduleController(),
          initState: (state) {
            controller.init();

            Future.delayed(Duration(microseconds: 200), () {
              controller.arrPaymentName.clear();
              controller.arrPaymentAmount.clear();

              final payment_Type = paymentSchedule['payment_Type'].toString();
              if (payment_Type == '%') {
                controller.selectedPaymentMode.value = 0;
              } else {
                controller.selectedPaymentMode.value = 1;
              }
              final arrPaymentSchedule = List<Map<String, dynamic>>.from(paymentSchedule['payment_List']);
              for (Map payment in arrPaymentSchedule) {
                final txtPaymentName = TextEditingController();
                txtPaymentName.text = payment['payment_name'].toString();
                controller.arrPaymentName.add(txtPaymentName);

                final txtPaymentAmount = TextEditingController();
                txtPaymentAmount.text = payment['payment_amount'].toString();
                controller.arrPaymentAmount.add(txtPaymentAmount);
              }

              print(controller.arrPaymentName.length);
            });
          },
          builder: (authController) {
            return Obx(()=>SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 140),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                        '100% Remaining ',
                        style: TextStylesProductSans.textStyles_16.apply(
                            color: ColorStyle.black, fontWeightDelta: 0)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          height: 40,
                          width: 80,
                          alignment: Alignment.center,
                          child: Text(
                            '%',
                            style: TextStylesProductSans.textStyles_20
                                .apply(
                                color:
                                (controller.selectedPaymentMode.value ==
                                    0)
                                    ? ColorStyle.white
                                    : ColorStyle.black,
                                fontWeightDelta: 0),
                          ),
                          decoration: BoxDecoration(
                              color: (controller.selectedPaymentMode.value ==
                                  0)
                                  ? ColorStyle.secondryColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: (controller.selectedPaymentMode.value ==
                                    0)
                                    ? ColorStyle.secondryColor
                                    : Colors.black,
                              ),
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        onTap: () {
                          controller.selectedPaymentMode.value = 0;
                        },
                      ),
                      SizedBox(width: 20,),
                      InkWell(
                        child: Container(
                          height: 40,
                          width: 80,
                          alignment: Alignment.center,
                          child: Text(
                            '\$',
                            style: TextStylesProductSans.textStyles_20
                                .apply(
                                color:
                                (controller.selectedPaymentMode.value ==
                                    1)
                                    ? ColorStyle.white
                                    : ColorStyle.black,
                                fontWeightDelta: 0),
                          ),
                          decoration: BoxDecoration(
                              color: (controller.selectedPaymentMode.value ==
                                  1)
                                  ? ColorStyle.secondryColor
                                  : Colors.transparent,
                              border: Border.all(
                                color: (controller.selectedPaymentMode.value ==
                                    1)
                                    ? ColorStyle.secondryColor
                                    : Colors.black,
                              ),
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        onTap: () {
                          controller.selectedPaymentMode.value = 1;
                        },
                      ),
                    ],
                  ),
                  ListView.separated(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 30),
                      shrinkWrap: true,
                      itemCount: controller.arrPaymentAmount.length,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 16,);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Expanded(child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'PAYMENT NAME',
                                            style: TextStylesProductSans.textStyles_13.apply(
                                                color: ColorStyle.grey, fontWeightDelta: 0)),
                                        TextFieldUnderline(
                                          controller: controller.arrPaymentName[index],
                                          hintText: '',
                                          textStyle: TextStylesProductSans.textStyles_16
                                              .apply(color: ColorStyle.black, fontWeightDelta: 0),
                                        )
                                      ],
                                    )
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'PAYMENT AMOUNT',
                                            style: TextStylesProductSans.textStyles_13.apply(
                                                color: ColorStyle.grey, fontWeightDelta: 0)),
                                        TextFieldUnderline(
                                          controller: controller.arrPaymentAmount[index],
                                          hintText: '',
                                          padding: EdgeInsets.all(0),
                                          keyboardType: TextInputType.number,
                                          textStyle: TextStylesProductSans.textStyles_16
                                              .apply(color: ColorStyle.black, fontWeightDelta: 0),
                                        )
                                      ],
                                    )
                                ),
                              ],
                            )),

                            if (index != 0)
                            InkWell(
                              child: Container(
                                child: Icon(Icons.delete, color: ColorStyle.hex('#FF8989'),),
                                padding: EdgeInsets.only(
                                    top: 16,
                                    bottom: 16
                                ),
                              ),
                              onTap: () {
                                controller.removePayment(index);
                              },
                            )
                          ],
                        );
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      alignment: Alignment.center,
                      child: Text('+  Add Payment',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_16.apply(
                              color: ColorStyle.secondryColor,
                              fontWeightDelta: 2)),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorStyle.secondryColor),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onTap: () {
                      controller.addPayment();
                    },
                  ),
                ],
              ),
            ));
          },
        ));
  }
}
