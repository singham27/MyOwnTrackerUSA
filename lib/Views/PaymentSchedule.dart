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

class PaymentSchedule extends StatelessWidget {
   PaymentSchedule({Key? key}) : super(key: key);

  final controller = Get.put(PaymentScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Payment Schedule',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body:  GetBuilder(
          init: PaymentScheduleController(),
          initState: (state) {
            controller.reset();

            print(controller.intAppBar.value);
          },
          builder: (authController) {
            return Obx(() =>   SingleChildScrollView(
              padding: EdgeInsets.only(left: 20,right: 20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                        '100% Remaining ',

                        style:  TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    // color: ColorStyle.grey,
                    child: ListView.builder(
                      // padding: EdgeInsets.only(bottom: 16),
                        shrinkWrap: true,
                        itemCount: controller.paymentSchedule.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return   InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                  height: 40,
                                  width: 80,

                                  alignment: Alignment.center,
                                  child:  Text(
                                    // '%',
                                    controller.paymentSchedule[index],
                                    style:  TextStylesProductSans.textStyles_20
                                        .apply(color: (controller.intAppBar.value == index)
                                        ? ColorStyle.white
                                        : ColorStyle.black,fontWeightDelta: 0 ),
                                  ),

                                  decoration: BoxDecoration(
                                      color: (controller.intAppBar.value == index)
                                          ? ColorStyle.secondryColor
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: (controller.intAppBar.value == index)
                                            ? ColorStyle.secondryColor
                                            : Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                              ],
                            ),
                            onTap: (){
                              controller.intAppBar.value = index;
                            },
                          );

                        }),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: TextField (
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                            labelText: 'PAYMENT NAME'

                        ),
                      ),),
                      SizedBox(width: 20,),
                      Expanded(child: TextField (
                        decoration: InputDecoration(
                          // border: InputBorder.none,

                            labelText: 'PAYMENT AMOUNT'
                        ),
                      ),),

                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(child: TextField (
                        decoration: InputDecoration(
                          // border: InputBorder.none,
                            labelText: 'PAYMENT NAME'

                        ),
                      ),),
                      SizedBox(width: 20,),
                      Expanded(child: TextField (
                        decoration: InputDecoration(
                          // border: InputBorder.none,

                            labelText: 'PAYMENT AMOUNT'
                        ),
                      ),),
                     InkWell(
                       child:  Icon(Icons.delete,color: ColorStyle.hex('#FF8989'),),
                       onTap: (){

                       },
                     )


                    ],
                  ),
                  SizedBox(height: 80,),
                  InkWell(
                    child:  Container(
                      padding: EdgeInsets.only(top: 12,bottom: 12,),
                      alignment: Alignment.center,
                      child: Text(
                          '+  Add Payment',
                          // controller.estimate1[index],
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
                      // Get.to( EditItem());
                    },
                  ),
                  SizedBox(height: 80,),
                  ElevatedButtonCustom(
                    height: 60,
                    text: "Save",
                    colorBG:ColorStyle.secondryColor,
                    colorText: ColorStyle.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      Get.to(UpgrdeToPro());
                    },
                  ),


                  // SizedBox(height: 15,),




                ],
              ),
            ));
          },
        )


    );
  }
}
