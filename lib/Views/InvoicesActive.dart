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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorStyle.white,
          leadingWidth: 150,
          leading: Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Text('Invoices',
                  style: TextStylesProductSans.textStyles_24
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            ],
          ),
          actions: [
            InkWell(
              child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                alignment: Alignment.center,
                // height: 38,
                // width: 38,
                child: Icon(
                  Icons.search,
                  color: ColorStyle.secondryColor,
                ),
                decoration: BoxDecoration(
                    color: ColorStyle.secondryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(100)),
              ),
              onTap: () {},
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: InvoicesActiveController(),
          initState: (state) {
            controller.reset();

            print(controller.intAppBar.value);
          },
          builder: (authController) {
            return Obx(
              () => Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.invoice.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                InkWell(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(controller.invoice[index],
                                          style: TextStylesProductSans
                                              .textStyles_16
                                              .apply(
                                                  color: (controller.intAppBar
                                                              .value ==
                                                          index)
                                                      ? ColorStyle.secondryColor
                                                      : ColorStyle.grey,
                                                  fontWeightDelta: 2)),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color:
                                                (controller.intAppBar.value ==
                                                        index)
                                                    ? ColorStyle.secondryColor
                                                    : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    controller.intAppBar.value = index;
                                  },
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (controller.intAppBar.value == 0)
                      Expanded(
                          child: InvoicesActived()
                      ),
                     if (controller.intAppBar.value == 1)
                      Expanded(child: InvoicesPaid())
                  ],
                ),
              ),
            );
          },
        ));
  }
}
