import '../Controllers/EstimateApprovedController.dart';
import '../Controllers/EstimateController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/EstimateDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/ModelEstimate.dart';

class EstimateApproved extends StatelessWidget {
  List<ModelEstimate> arrModelEstimate;
  EstimateApproved({Key? key, required this.arrModelEstimate}) : super(key: key);
  final controller = Get.put(EstimateApprovedController());
  final controllerEstimate = Get.put(EstimateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: ListView.builder(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
            shrinkWrap: true,
            itemCount: arrModelEstimate.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                  padding: EdgeInsets.only(
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 12,
                        decoration: BoxDecoration(
                          color: ColorStyle.hex('#61C842'),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(width: 6,),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              arrModelEstimate[index].client!.name.toString(),
                              style: TextStylesProductSans.textStyles_14
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                              arrModelEstimate[index].date!.toString(),
                              style: TextStylesProductSans.textStyles_14
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                        ],
                      )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              '\$ '+arrModelEstimate[index].amountTotal!.toString(),
                              style: TextStylesProductSans.textStyles_14
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              // InkWell(
                              //   child: Image.asset(
                              //     ImageStyle.Path475,
                              //     height: 20,
                              //   ),
                              //   onTap: () {},
                              // ),
                              // Container(
                              //   width: 15,
                              // ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 6,
                                    right: 6,
                                    top: 5,
                                    bottom: 5),
                                alignment: Alignment.center,
                                // height: 2,
                                // width: 20,
                                child: Text(
                                    arrModelEstimate[index].states_name.toString(),
                                    style: TextStylesProductSans
                                        .textStyles_10
                                        .apply(
                                        color: ColorStyle.white,
                                        fontWeightDelta: 0)),
                                decoration: BoxDecoration(
                                    color: ColorStyle.grays,
                                    borderRadius:
                                    BorderRadius.circular(6)),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: ColorStyle.blue,
                      borderRadius: BorderRadius.circular(20)),
                ),
                onTap: () {
                  Get.to(EstimateDetails(
                    title: 'Estimate',
                    modelEstimate: arrModelEstimate[index],))!
                      .then((value) {
                    controllerEstimate.readEstimate();
                  });
                },
              );
            }));
  }
}
