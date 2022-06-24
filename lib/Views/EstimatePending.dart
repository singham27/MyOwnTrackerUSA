import '../Controllers/EstimateApprovedController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/EstimateDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstimatePending extends StatelessWidget {
  EstimatePending({Key? key}) : super(key: key);
  final controller = Get.put(EstimateApprovedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: ListView.builder(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 16),
            shrinkWrap: true,
            itemCount: 14,
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
                        // padding: EdgeInsets.only(top: ),
                        alignment: Alignment.center,
                        height: 100,
                        width: 12,

                        decoration: BoxDecoration(
                          color: ColorStyle.hex('#7432FF'),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Deo',
                              // controller.estimate1[index],
                              style: TextStylesProductSans.textStyles_16
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                          SizedBox(
                            height: 18,
                          ),
                          Text('June 12 Thu • #12345',
                              style: TextStylesProductSans.textStyles_16
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('\$2,500.00',
                              style: TextStylesProductSans.textStyles_16
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            child: Row(
                              children: [
                                InkWell(
                                  child: Image.asset(
                                    ImageStyle.Path475,
                                    height: 20,
                                  ),
                                  onTap: () {},
                                ),
                                Container(
                                  width: 15,
                                ),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 8,
                                        bottom: 8),
                                    alignment: Alignment.center,
                                    // height: 2,
                                    // width: 20,
                                    child: Text('INVOICED',
                                        // controller.estimate2[index],
                                        style: TextStylesProductSans
                                            .textStyles_12
                                            .apply(
                                            color: ColorStyle.white,
                                            fontWeightDelta: 0)),
                                    decoration: BoxDecoration(
                                        color: ColorStyle.grays,
                                        borderRadius:
                                        BorderRadius.circular(6)),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                          )
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
                  Get.to(EstimateDetails());
                },
              );
            })
    );
  }
}
