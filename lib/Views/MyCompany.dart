import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Controllers/MyCompanyController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../Components/PickerCustom.dart';

class MyCompany extends StatelessWidget {
  MyCompany({Key? key}) : super(key: key);
  final controller = Get.put(MyCompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'My Company',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: MyCompanyController(),
          initState: (state) {
            controller.reset();
          },
          builder: (auth) {
            return Obx(() => SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: ColorStyle.grey,
                                        )),
                                    child: controller.photo.value.path.isEmpty
                                        ? Image.asset(
                                            ImageStyle.Group1727,
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.file(
                                              File(controller.photo.value.path),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text('Change Logo',
                                      style: TextStylesProductSans.textStyles_16
                                          .apply(
                                              color: ColorStyle.black,
                                              fontWeightDelta: 0)),
                                ],
                              ),
                              onTap: () {
                                PickerCustom.imagePicker((file) {
                                  controller.photo.value = file;
                                });
                              },
                            ),
                          ),
                          Text('Basic Info',
                              style: TextStylesProductSans.textStyles_16.apply(
                                  color: ColorStyle.black, fontWeightDelta: 4)),
                          TextFieldUnderline(
                            controller: controller.companyNameController.value,
                            hintText: 'Company name',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.phoneController.value,
                            hintText: 'Phone #1',
                            keyboardType: TextInputType.number,
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            keyboardType: TextInputType.number,
                            controller: controller.phoneSecController.value,
                            hintText: 'Phone #2',
                            textStyle:
                            TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.companyAddressController.value,
                            hintText: 'Company address #1',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.companyAddressSecController.value,
                            hintText: 'Company address #2',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.cityController.value,
                            hintText: 'City',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.statePrivinceController.value,
                            hintText: 'State/Province',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.zipPostelCodeController.value,
                            hintText: 'Zip/Postal Code',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldUnderline(
                            controller: controller.bussinesController.value,
                            hintText: 'Business #',
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 22,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Licence and information',
                              // controller.estimate1[index],
                              style: TextStylesProductSans.textStyles_16.apply(
                                  color: ColorStyle.black, fontWeightDelta: 4)),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (controller.docLicence.value.path.isEmpty)
                              Text('Licence Document',
                                  // controller.estimate1[index],
                                  style: TextStylesProductSans.textStyles_16
                                      .apply(
                                          color: ColorStyle.black,
                                          fontWeightDelta: 0))
                              else
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    File(controller.docLicence.value.path),
                                    fit: BoxFit.fill,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              InkWell(
                                child: Text(
                                    controller.docLicence.value.path.isEmpty ? '+ ADD'  : '- Remove',
                                    // controller.estimate1[index],
                                    style: TextStylesProductSans.textStyles_16
                                        .apply(
                                            color: ColorStyle.secondryColor,
                                            fontWeightDelta: 0)),
                                onTap: () {
                                  if (controller.docLicence.value.path.isEmpty) {
                                    PickerCustom.imagePicker((file) {
                                      controller.docLicence.value = file;
                                    });
                                  } else {
                                    controller.docLicence.value = File('');
                                  }
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorStyle.grey,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (controller.docInsurance.value.path.isEmpty)
                                Text('Insurance Document',
                                    // controller.estimate1[index],
                                    style: TextStylesProductSans.textStyles_16
                                        .apply(
                                        color: ColorStyle.black,
                                        fontWeightDelta: 0))
                              else
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    File(controller.docInsurance.value.path),
                                    fit: BoxFit.fill,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),

                              InkWell(
                                child: Text(
                                    controller.docInsurance.value.path.isEmpty ? '+ ADD'  : '- Remove',
                                    // controller.estimate1[index],
                                    style: TextStylesProductSans.textStyles_16
                                        .apply(
                                            color: ColorStyle.secondryColor,
                                            fontWeightDelta: 0)),
                                onTap: () {
                                  if (controller.docInsurance.value.path.isEmpty) {
                                    PickerCustom.imagePicker((file) {
                                      controller.docInsurance.value = file;
                                    });
                                  } else {
                                    controller.docInsurance.value = File('');
                                  }
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorStyle.grey,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Website and Social Media',
                              style: TextStylesProductSans.textStyles_16.apply(
                                  color: ColorStyle.black, fontWeightDelta: 4)),
                          Row(
                            children: [
                              Image.asset(
                                ImageStyle.Group3124,
                                height: 40,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFieldUnderline(
                                  controller: controller.websiteUrlController.value,
                                  hintText: 'Paste Website URL here',
                                  textStyle:
                                      TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                ImageStyle.Group3123,
                                height: 40,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFieldUnderline(
                                  controller: controller.googleBussinesController.value,
                                  hintText: 'Paste Google Business URL here',
                                  textStyle:
                                      TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                ImageStyle.Group3125,
                                height: 40,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFieldUnderline(
                                  controller: controller.facebookUrlController.value,
                                  hintText: 'Paste Facebook URL here',
                                  textStyle:
                                      TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                ImageStyle.Group3126,
                                height: 40,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFieldUnderline(
                                  controller: controller.instagramUrlController.value,
                                  hintText: 'Paste Instagram URL here',
                                  textStyle:
                                      TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButtonCustom(
                        height: 60,
                        text: "Save",
                        colorBG: ColorStyle.secondryColor,
                        colorText: ColorStyle.primaryColor,
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          controller.validation();
                          // Get.to(ChooseYourIndustry());
                        },
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}
