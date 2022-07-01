import 'package:business_trackers/Utils/Global.dart';

import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Controllers/TaxListController.dart';
import '../Controllers/EditItemController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Components/AddTaxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class TaxList extends StatelessWidget {
  bool isFromItem;
  TaxList({Key? key, this.isFromItem = false}) : super(key: key);

  final controller = Get.put(TaxListController());
  final controllerEditItem = Get.put(EditItemController());

  delete(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        'Delete',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      onPressed: () {
        hideLoader();
        controller.deleteList();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        'Cancel',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      onPressed: () {
        hideLoader();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        'Are you sure?',
        style: TextStylesProductSans.textStyles_16.apply(
            color: Colors.red,
            fontWeightDelta: 0
        ),
      ),
      content: Text(
        'Do you want to delete ?',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyless(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Taxes',
        leading: BackButton(
          color: ColorStyle.black,
        ),
      ),
      floatingActionButton: ElevatedButtonCustom(
        height: 50,
        text: " +  Add",
        colorBG: ColorStyle.secondryColor,
        colorText: ColorStyle.primaryColor,
        width: 120,
        onTap: () {
          AddTaxes.addTaxes(context);
        },
      ),
      body: GetBuilder(
        init: TaxListController(),
        initState: (state) {
          controller.reset();
        },
        builder: (auth) {
          return Obx(() => Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: ListView.separated(
                padding: EdgeInsets.only(bottom: 80),
                itemCount: controller.arrModelTaxList.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        color: ColorStyle.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                  controller.arrModelTaxList[index].name!,
                                  style: TextStylesProductSans.textStyles_16.apply(
                                      color: ColorStyle.black, fontWeightDelta: 2)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  controller.arrModelTaxList[index].tax.toString() + ' %',
                                  style: TextStylesProductSans.textStyles_16.apply(
                                      color: ColorStyle.black, fontWeightDelta: 2)),
                            ],
                          ),
                          IconButton(
                            icon: Image.asset(
                              ImageStyle.delete,
                              height: 50,
                            ),
                            splashColor: Colors.red,
                            onPressed: () {
                              controller.taxID.value = controller.arrModelTaxList[index].id!;
                              delete(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      if (isFromItem) {
                        controllerEditItem.dictTaxes.value = controller.arrModelTaxList[index];
                        Get.back();
                      }
                    },
                  );
                }),
          ));
        },
      ),
    );
  }
}
