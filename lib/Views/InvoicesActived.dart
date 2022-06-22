import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/InvoicesActiveCustom.dart';
import 'package:business_trackers/Controllers/InvoicesActiveController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoicesActived extends StatelessWidget {
   InvoicesActived({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body:  Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'June 2022',
                    style:  TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                Text(
                    '\$456.00',
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
            Expanded(child: InvoicesActiveCustom(),),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButtonCustom(
                text: "+  Create",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: 116,
                onTap: () {
                  // Get.to(.NewEstimate());
                },
              ),
            ),
          ],
        ),
    );
  }
}
