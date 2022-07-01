
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/AddTaxesController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTaxes {


  static addTaxes(context) {

    final controller = Get.put(AddTaxesController());

    return Get.bottomSheet(Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            height: 360,
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 60,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Add New Tax',
                    textAlign: TextAlign.center,
                    // controller.estimate1[index],
                    style: TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                SizedBox(
                  height: 20,
                ),


                TextFieldUnderline(
                  controller: controller.itemNameController.value,
                  hintText: 'Item name',
                  textStyle: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 0),
                ),



                SizedBox(
                  height: 16,
                ),


                TextFieldUnderline(
                  controller: controller.gstController.value,
                  hintText: '0%',
                  keyboardType: TextInputType.number,
                  textStyle: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 0),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButtonCustom(
                  height: 60,
                  text: "Save",
                  colorBG: ColorStyle.secondryColor,
                  colorText: ColorStyle.primaryColor,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  onTap: () {
                    // Get.back();
                    controller.taxes();
                  },
                ),
              ],
            ),
          ),
        )
    )
    );
  }
}