import 'package:business_trackers/Views/InvoicesActived.dart';
import 'package:business_trackers/Views/InvoicesPaid.dart';
import 'package:flutter/material.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:get/get.dart';

import '../Components/InvoicesActiveCustom.dart';
import '../Controllers/InvoicesActiveController.dart';


class InvoicesActive extends StatelessWidget {
  InvoicesActive({Key? key}) : super(key: key);


  final controller = Get.put(InvoicesActiveController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(

          init: InvoicesActiveController(),
          initState: (state) {
            controller.reset();

            print(controller.intAppBar.value);
          },
          builder: (authController) {
            return Obx(() =>  SingleChildScrollView(
              padding: EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Invoices',
                          style:  TextStylesProductSans.textStyles_30
                              .apply(color: ColorStyle.black, fontWeightDelta: 5)),
                      InkWell(child:  Container(
                        alignment: Alignment.center,
                        height: 38,
                        width: 38,
                        child:  Icon(Icons.search,color: ColorStyle.secondryColor,),
                        decoration: BoxDecoration(
                            color: ColorStyle.secondryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                        onTap: (){},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,),
                  Container(
                    height: 35,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.invoice.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              InkWell(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      controller.invoice[index],
                                      style:  TextStylesProductSans.textStyles_16
                                          .apply(color: (controller.intAppBar.value == index)
                                          ? ColorStyle.secondryColor
                                          : ColorStyle.grey,fontWeightDelta: 2 )
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 2,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: (controller.intAppBar.value == index)
                                            ? ColorStyle.secondryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(2)
                                    ),
                                  ),
                                ],
                              ),onTap: (){  controller.intAppBar.value = index;},),
                              SizedBox(width: 25,),

                            ],
                          );

                        }),
                  ),
                  // SizedBox(
                  //   height: 15,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //         'June 2022',
                  //         style:  TextStylesProductSans.textStyles_16
                  //             .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  //     Text(
                  //         '\$456.00',
                  //         style:  TextStylesProductSans.textStyles_16
                  //             .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  //   ],),
                  // SizedBox(
                  //   height: 10,),
                  // Container(
                  //     height: 1,
                  //     color: ColorStyle.grey
                  // ),
                  // SizedBox(
                  //   height: 15,),
                  // InvoicesActiveCustom(),
                  // Container(
                  //   alignment: Alignment.bottomRight,
                  //   child: ElevatedButtonCustom(
                  //     text: "+  Create",
                  //     colorBG:ColorStyle.secondryColor,
                  //     colorText: ColorStyle.primaryColor,
                  //     width: 116,
                  //     onTap: () {
                  //       // Get.to(.NewEstimate());
                  //     },
                  //   ),
                  // ),
                  if (controller.intAppBar.value == 0)
                    Expanded(child: InvoicesActived())
                  else if (controller.intAppBar.value == 1)
                    Expanded(child: InvoicesPaid())
                ],
              ),
            ),);
          },
        )


    );
  }
}
