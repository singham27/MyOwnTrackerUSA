import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Controllers/EditItemController.dart';
import '../Controllers/ItemListController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Views/TaxList.dart';


class EditItem extends StatelessWidget {
  String title;
  EditItem({Key? key, required this.title}) : super(key: key);
  bool isChecked = false;

  final controller = Get.put(EditItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: this.title,
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        body: GetBuilder(
          init: EditItemController(),
          initState: (state) {
            controller.init();
          },
          builder: (auth) {
            return Obx(()=>SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldUnderline(
                    controller: controller.itemNameController.value,
                    hintText: 'Item name',
                    textStyle: TextStylesProductSans.textStyles_16
                        .apply(color: ColorStyle.black, fontWeightDelta: 0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldUnderlinePrefixText(
                    controller: controller.quantityController.value,
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
                    controller: controller.rateController.value,
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
                          controller.isSave.value ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                          size: 30,
                          color: ColorStyle.secondryColor,
                        ),
                        onTap: () {
                          controller.isSave.value = !controller.isSave.value;
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
                    height: 16,
                  ),
                  if (controller.dictTaxes.value.name!.isNotEmpty)
                  Column(
                    children: [
                      Text(
                          controller.dictTaxes.value.name!+' (${controller.dictTaxes.value.tax}%)',
                          style: TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black, fontWeightDelta: 0)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    child: Text('+ ADD NEW TAX',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_16.apply(
                            color: ColorStyle.secondryColor, fontWeightDelta: 0)),
                    onTap: () {
                      Get.to(TaxList(isFromItem: true));
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
                  Text(

                      'Description',
                      // controller.estimate1[index],
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 3)),
                  TextFieldUnderline(
                    controller: controller.descriptionController.value,
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
                      controller.validation();
                    },
                  ),
                ],
              ),
            ));
          },
        )
    );
  }
}



