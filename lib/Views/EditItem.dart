import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/ItemList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Views/TaxList.dart';


class EditItem extends StatelessWidget {
  EditItem({Key? key}) : super(key: key);
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ColorStyle.secondryColor;
    }
    return ColorStyle.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Edit Item',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldUnderline(
                hintText: 'Item name',
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 0),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldUnderlinePrefixText(
                keyboardType: TextInputType.number,
                prefixText: 'Quantity',
                colorBoder: ColorStyle.grey,
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 0),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldUnderlinePrefixText(
                keyboardType: TextInputType.number,
                prefixText: 'Rate',
                colorBoder: ColorStyle.grey,
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 0),
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.check_box_rounded,
                      size: 30,
                      color: ColorStyle.secondryColor,
                    ),
                    onTap: () {
                      filter(context);
                    },
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: Text('Save to items list for future use',
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)),
              ),
              SizedBox(
                height: 14,
              ),
              Text('Taxes',
                  // controller.estimate1[index],
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)),
              SizedBox(
                height: 14,
              ),
              InkWell(
                child: Text('+ ADD NEW TAX',
                    // controller.estimate1[index],
                    style: TextStylesProductSans.textStyles_16.apply(
                        color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                onTap: () {
                  Get.to(TaxList());
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Description',
                  // controller.estimate1[index],
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)),
              TextFieldUnderline(
                hintText: 'Add notes',
                maxLines: 6,
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG: ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(ItemList());
                },
              ),
            ],
          ),
        ));
  }
}

filter(context) {
  return Get.dialog(Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 18, right: 18, top: 22, bottom: 22),
            margin: EdgeInsets.only(left: 50, right: 50, top: 80),
            // height: 100,
            width: MediaQuery.of(Get.context!).size.width,
            decoration: BoxDecoration(
              color: ColorStyle.primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do you want to save your changes?',
                    textAlign: TextAlign.center,
                    // controller.estimate1[index],
                    style: TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                SizedBox(
                  height: 20,
                ),
                ElevatedButtonCustom(
                  height: 50,
                  text: "Save",
                  colorBG: ColorStyle.secondryColor,
                  colorText: ColorStyle.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Text("  Don't Save",
                      textAlign: TextAlign.center,
                      // controller.estimate1[index],
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      )));
}

