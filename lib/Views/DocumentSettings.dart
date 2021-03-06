import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditContract.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/DocumentSettingsController.dart';

class DocumentSettings extends StatelessWidget {
  bool isFromEstimate;

  DocumentSettings({Key? key, this.isFromEstimate = false}) : super(key: key);
  final controller = Get.put(DocumentSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Document Settings',
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [
            if (isFromEstimate)
              IconButton(
                icon: Icon(
                  Icons.check_circle_sharp,
                  color: ColorStyle.secondryColor,
                  size: 30,
                ),
                onPressed: () {
                  final mapGenericContacts = {
                    'name': controller.genericText.value,
                    'days': controller.paymentdaysController.value.text,
                  };
                  Get.back(result: mapGenericContacts);
                },
              ),
          ],
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: DocumentSettingsController(),
          initState: (state) {
            controller.reset();
          },
          builder: (auth) {
            return Obx(() => Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contract & Signature',
                              style: TextStylesProductSans.textStyles_16.apply(
                                  color: ColorStyle.black, fontWeightDelta: 3)),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Contact',
                                  style: TextStylesProductSans.textStyles_14
                                      .apply(
                                          color: ColorStyle.black,
                                          fontWeightDelta: 0)),
                              InkWell(
                                child: Text(
                                    controller.genericText.value.isEmpty
                                        ? 'Generic Contract'
                                        : controller.genericText.value,
                                    style: TextStylesProductSans.textStyles_14
                                        .apply(
                                            color: ColorStyle.secondryColor,
                                            fontWeightDelta: 0)),
                                onTap: () {
                                  Get.to(EditCotract(
                                    isShowDelete: controller.isShowDelete.value,
                                  ));
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 14,
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
                          TextFieldUnderlinePrefixText(
                            controller: controller.paymentdaysController.value,
                            prefixText: 'Payment Terms (days)',
                            hintText: '0',
                            keyboardType: TextInputType.number,
                            textStyle: TextStylesProductSans.textStyles_14
                                .apply(
                                    color: ColorStyle.black,
                                    fontWeightDelta: 0),
                          ),
                        ],
                      ),
                      ElevatedButtonCustom(
                        height: 60,
                        text: "Save",
                        colorBG: ColorStyle.secondryColor,
                        colorText: ColorStyle.primaryColor,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          controller.genericText.value =
                              controller.genericController.value.text;
                          controller.validation();
                          // Get.to(ItemList());
                        },
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}
