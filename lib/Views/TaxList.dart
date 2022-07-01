import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/TaxListController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Components/AddTaxes.dart';
import '../Utils/Constant.dart';

class TaxList extends StatelessWidget {
  TaxList({Key? key}) : super(key: key);

  delete(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        'Delete',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      onPressed: () {
        Get.back();
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
        Get.back();
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

  final controller = Get.put(TaxListController());

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
                  return Container(
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
                  );
                }),
          ));
        },
      ),
    );
  }
}
