import 'package:business_trackers/Controllers/EstimateController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EstimateApproved.dart';
import 'package:business_trackers/Views/EstimateDeclined.dart';
import 'package:business_trackers/Views/Estimated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Estimate extends StatelessWidget {
  Estimate({Key? key}) : super(key: key);
  final controller = Get.put(EstimateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: ColorStyle.primaryColor,
        body:SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Estimate',

                      style:  TextStylesProductSans.textStyles_30
                          .apply(color: ColorStyle.black, fontWeightDelta: 2)),
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
              Container(
                height: 25,),
              Container(
                // alignment: Alignment.center,
                height: 35,
                // color: ColorStyle.grey,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.estimate.length,
                    scrollDirection: Axis.horizontal,
                    // physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {

                      return Row(
                        children: [
                          InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  // 'Technologies',
                                    controller.estimate[index],
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
                            ),
                            onTap: (){
                              controller.intAppBar.value = index;

                            },),
                          SizedBox(width: 25,),
                        ],
                      );

                    }),
              ),
              SizedBox(
                height: 15,
              ),
              if (controller.intAppBar.value == 0)
                Expanded(child: Estimated())
              else if (controller.intAppBar.value == 1)
                Expanded(child: EstimateApproved())
              else  if (controller.intAppBar.value == 2)
                  Expanded(child: EstimateDeclined())

              // if (controller.intAppBar.value == 0)
              //   Expanded(
              //       child:Estimated()
              //   ),
              // if (controller.intAppBar.value == 1)
              //   Expanded(
              //       child:EstimateApproved()),
              // if (controller.intAppBar.value == 2)
              //   Expanded(
              //       child:EstimateDeclined()),



            ],
          ),
        )



    );
  }
}