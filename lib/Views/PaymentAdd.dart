import 'package:business_trackers/Components/ProgressBarCustom.dart';
import 'package:business_trackers/Controllers/PaymentAddController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/PickerCustom.dart';
import '../Models/ModelEstimate.dart';


class PaymentAdd extends StatelessWidget {
  ModelEstimate? invoice;
  double paid = 0.0;
  double totalPayment = 0.0;

  PaymentAdd({Key? key, required this.invoice, required this.paid, required this.totalPayment}) : super(key: key);

  final controller = Get.put(PaymentAddController());

  buttons({required int buttonNo, required String text, required Function() onTap}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: (controller.paymentMethod.value == buttonNo) ? ColorStyle.secondryColor : ColorStyle.primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: (controller.paymentMethod.value == buttonNo) ? ColorStyle.secondryColor : ColorStyle.black,
            )),
        child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStylesProductSans.textStyles_14
                .apply(
                color: (controller.paymentMethod.value == buttonNo) ? ColorStyle.white : ColorStyle.black,
            )),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Payments',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: PaymentAddController(),
          initState: (state) {
            controller.paid.value = paid;
            controller.totalPayment.value = totalPayment;

            controller.onInit();
          },
          builder: (auth) {
            return Obx(()=> SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 30
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Paid',
                                textAlign: TextAlign.center,
                                // maxLines: 3,
                                style: TextStylesProductSans.textStyles_16.apply(
                                  color: ColorStyle.black,
                                )),
                            Text('Due \$ '+paid.toString(),
                                textAlign: TextAlign.center,
                                // maxLines: 3,
                                style: TextStylesProductSans.textStyles_14.apply(
                                  color: ColorStyle.black,
                                )),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        ProgressBarCustom(
                          paid: controller.paid.value,
                          totalPayment: controller.totalPayment.value,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Payment',
                            style: TextStylesProductSans.textStyles_16.apply(
                              color: ColorStyle.black,
                            )),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 100,
                                alignment: Alignment.center,
                                child: TextField(
                                  enabled: (controller.paymentMode.value == 2) ? false : true,
                                  controller: controller.txtPayment.value,
                                  keyboardType: TextInputType.number,
                                  style: TextStylesProductSans.textStyles_16.apply(
                                    color: ColorStyle.black,
                                  ),
                                  onChanged: (text) {
                                    controller.priceCalcuation();
                                  },
                                )
                            ),
                            Container(
                              height: 70,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 60,
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                          '\$',
                                          textAlign: TextAlign.center,
                                          style: TextStylesProductSans.textStyles_16.apply(
                                              color: (controller.paymentMode.value == 0)
                                                  ? ColorStyle.white
                                                  : ColorStyle.black)),
                                      decoration: BoxDecoration(
                                          color: (controller.paymentMode.value == 0)
                                              ? ColorStyle.secondryColor
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: (controller.paymentMode.value == 0)
                                                  ? Colors.transparent
                                                  : Colors.grey)),
                                    ),
                                    onTap: () {
                                      controller.paymentType(0);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 60,
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                          '\%',
                                          textAlign: TextAlign.center,
                                          style: TextStylesProductSans.textStyles_16.apply(
                                              color: (controller.paymentMode.value == 1)
                                                  ? ColorStyle.white
                                                  : ColorStyle.black)),
                                      decoration: BoxDecoration(
                                          color: (controller.paymentMode.value == 1)
                                              ? ColorStyle.secondryColor
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: (controller.paymentMode.value == 1)
                                                  ? Colors.transparent
                                                  : Colors.grey)),
                                    ),
                                    onTap: () {
                                      controller.paymentType(1);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: 60,
                                      padding: EdgeInsets.only(top: 10, bottom: 10),
                                      child: Text(
                                          'Full',
                                          textAlign: TextAlign.center,
                                          style: TextStylesProductSans.textStyles_16.apply(
                                              color: (controller.paymentMode.value == 2)
                                                  ? ColorStyle.white
                                                  : ColorStyle.black)),
                                      decoration: BoxDecoration(
                                          color: (controller.paymentMode.value == 2)
                                              ? ColorStyle.secondryColor
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: (controller.paymentMode.value == 2)
                                                  ? Colors.transparent
                                                  : Colors.grey)),
                                    ),
                                    onTap: () {
                                      controller.paymentType(2);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: 6
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1
                                    )
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(' Payment Date',
                                    textAlign: TextAlign.center,
                                    style: TextStylesProductSans.textStyles_16.apply(
                                      color: ColorStyle.black,
                                    )),
                                Text(
                                    controller.date.value,
                                    textAlign: TextAlign.center,
                                    style: TextStylesProductSans.textStyles_15.apply(
                                      color: ColorStyle.grey,
                                    )),
                              ],
                            ),
                          ),
                          onTap: () async {
                            controller.date.value = await PickerCustom.datePicker('EEE, dd MMM yyyy');
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Payment Method',
                            style: TextStylesProductSans.textStyles_16.apply(
                              color: ColorStyle.black,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(runSpacing: 20, spacing: 12.0, children: <Widget>[
                          buttons(buttonNo: 1, text: 'Cash', onTap: () {
                            controller.paymentMethod.value = 1;
                          }),

                          buttons(buttonNo: 2, text: 'Check', onTap: () {
                            controller.paymentMethod.value = 2;
                          }),


                          buttons(buttonNo: 3, text: 'Credit', onTap: () {
                            controller.paymentMethod.value = 3;
                          }),

                          buttons(buttonNo: 4, text: 'Bank Transfer', onTap: () {
                            controller.paymentMethod.value = 4;
                          }),

                        ]),
                      ],
                    ),
                    ElevatedButtonCustom(
                      text: "Save",
                      colorBG: ColorStyle.secondryColor,
                      colorText: ColorStyle.primaryColor,
                      width: MediaQuery.of(context).size.width,
                      onTap: () {
                        controller.validation(invoice!.id.toString());
                      },
                    ),
                  ],
                ),
              ),
            ));
          },
        )
    );
  }
}
