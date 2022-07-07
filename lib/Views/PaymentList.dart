import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Components/ProgressBarCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/PaymentAdd.dart';
import '../Controllers/PaymentListController.dart';
import '../Models/ModelEstimate.dart';


class PaymentList extends StatelessWidget {
  ModelEstimate? invoice;
  PaymentList({Key? key, required this.invoice}) : super(key: key);

  final controller = Get.put(PaymentListController());

  double paidAmount() {
    double amount = 0.0;

    if (controller.arrModelPayment.length > 0) {
      for (int i = 0; i < controller.arrModelPayment.length; i++) {
        amount += double.parse(controller.arrModelPayment[i].paidAmount.toString());
      }
    }

    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Payments',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        floatingActionButton: ElevatedButtonCustom(
          text: "+ Add",
          colorBG:ColorStyle.secondryColor,
          colorText: ColorStyle.primaryColor,
          width: 94,
          onTap: () {
            Get.to(PaymentAdd(invoice: invoice, paid: paidAmount(), totalPayment: invoice!.amountTotal!))!
            .then((value) {
              if (value.toString() == 'true') {
                controller.listPayment();
              }
            });
          },
        ),
        body: GetBuilder(
          init: PaymentListController(),
          initState: (state) {
            controller.invoice = invoice!;
            controller.onInit();
          },
          builder: (auth) {
            return Obx(()=> SingleChildScrollView(
              padding: EdgeInsets.only(left: 20,right: 20, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Paid',
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black,)),
                      Text(
                          '\$ '+invoice!.amountTotal!.toString(),
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black,)),
                    ],),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  ProgressBarCustom(
                    paid: paidAmount(),
                    totalPayment: invoice!.amountTotal!,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.arrModelPayment.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '\$ '+controller.arrModelPayment[index].paidAmount.toString(),
                                style:  TextStylesProductSans.textStyles_15
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                controller.arrModelPayment[index].paymentDate.toString()+' • '+controller.arrModelPayment[index].paymentMethod.toString(),
                                style:  TextStylesProductSans.textStyles_13
                                    .apply(color: ColorStyle.black,)),
                            SizedBox(height: 10,),
                            Container(
                                height: 1,
                                color: ColorStyle.grey
                            ),
                            SizedBox(height: 10,),
                          ],
                        );

                      }),
                ],
              ),
            ));
          },
        )
    );
  }
}


