

import '../Controllers/EstimateController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'EstimateCreate.dart';
import '../Models/ModelEstimate.dart';
import 'EstimateDetails.dart';


class InvoicesActive extends StatelessWidget {
  List<ModelEstimate> arrModelEstimate;
  InvoicesActive({Key? key, required this.arrModelEstimate}) : super(key: key);

  final controllerEstimate = Get.put(EstimateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: Obx(()=>ListView.builder(
            itemCount: arrModelEstimate.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 80),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                    padding: EdgeInsets.only(
                      left:16,
                      right: 16,
                      top: 16,
                      bottom: 16,
                    ),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: ColorStyle.blue,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                arrModelEstimate[index].client!.name.toString(),
                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                '\$ '+arrModelEstimate[index].amountTotal!.toString(),
                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black,)),
                          ],
                        ),
                        SizedBox(
                          height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                arrModelEstimate[index].date!.toString(),
                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black,)),

                            Row(
                              children: [
                                // InkWell(child:Image.asset(ImageStyle.Path475,height: 20,),onTap: (){},),
                                // SizedBox(
                                //   width: 15,),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 6,right: 6,top: 5,bottom: 5),
                                    alignment: Alignment.center,
                                    child: Text(
                                        'DRAFT',
                                        style:  TextStylesProductSans.textStyles_10
                                            .apply(color: ColorStyle.white)
                                    ),
                                    decoration: BoxDecoration(
                                        color: ColorStyle.grays,
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                  ),
                                  onTap: (){},)
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                ),
                onTap: () {
                  Get.to(EstimateDetails(title: 'Invoice',modelEstimate: arrModelEstimate[index]))!
                      .then((value) {
                    controllerEstimate.readEstimate();
                  });;
                },
              );

            }))
    );
  }
}
