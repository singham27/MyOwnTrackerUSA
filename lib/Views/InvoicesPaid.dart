import 'package:business_trackers/Components/InvoicesPaidCustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Controllers/InvoicesActiveController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class InvoicesPaid extends StatelessWidget {
  InvoicesPaid({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'June 2022',
                    style:  TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                Text(
                    '\$200.00',
                    style:  TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              ],),
            SizedBox(
              height: 10,),
            Container(
                height: 1,
                color: ColorStyle.grey
            ),
            SizedBox(
              height: 15,),

            Expanded(child: InvoicesPaidCustom()),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButtonCustom(
                text: "+  Create",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: 116,
                onTap: () {
                  // Get.to(.NewEstimate());
                },
              ),
            )
          ],
        ),
    );
  }
}
