import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/EstimateDetails.dart';

class InvoicesPaid extends StatelessWidget {
  InvoicesPaid({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 80),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                    padding: EdgeInsets.only(
                        left:16,
                        right: 16,
                        top: 16,
                        bottom: 16
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
                                'John Deo',
                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black,)),
                            Text(
                                '\$100.00',
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
                                'June 12 • #12345',
                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black,)),
                            Row(
                              children: [
                                InkWell(child:Image.asset(ImageStyle.Path475,height: 20,),onTap: (){},),
                                SizedBox(
                                  width: 15,),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 25,right: 25,top: 8,bottom: 8),
                                    alignment: Alignment.center,
                                    child: Text(
                                        'PAID',
                                        style:  TextStylesProductSans.textStyles_12
                                            .apply(color:
                                        ColorStyle.white
                                        )
                                    ),
                                    decoration: BoxDecoration(
                                        color: ColorStyle.hex('#61C842'),
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
                  // Get.to(EstimateDetails());
                },
              );

            })
    );
  }
}
