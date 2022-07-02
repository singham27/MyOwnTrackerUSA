import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/ClientList.dart';
import '../Components/SwitchCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/EditClientController.dart';
import '../Controllers/MyCompanyController.dart';
import '../Models/ModelClient.dart';


class EditClient extends StatelessWidget {
  String title;
  EditClient({Key? key, required this.title}) : super(key: key);

  final controller = Get.put(EditClientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title:title,
          leading: BackButton(
            color: ColorStyle.black,
            onPressed: () {
              controller.refresh();
              Get.back();
            },
          ),
          trailings: [
            InkWell(
              child: Text('My Client',
                  style: TextStylesProductSans.textStyles_14.apply(
                      color: ColorStyle.secondryColor, fontWeightDelta: 0)),
              onTap: () {
                filter();
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: GetBuilder(
          init: EditClientController(),
          initState: (state) {
            controller.init();
          },
          builder: (auth) {
            return Obx(()=>SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Basic Info',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                      SizedBox(height: 16,),
                      TextFieldUnderline(
                        controller: controller.clientNameController.value,
                        hintText: 'Client name',
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.emailAddressController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email address',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.mobileNumberController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: true
                        ),
                        hintText: 'Mobile number',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.homeNumberController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: true
                        ),
                        hintText: 'Home number',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Billing Address',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                      Text('Address where the bill be sent',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_12
                              .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                      TextFieldUnderline(
                        controller: controller.addressController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'Address #1',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.addressSecController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'Address #2',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.cityController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'City',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.statePrivinceController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'State/Province',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.zipPostelCodeController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'Zip/Postal Code',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Billing address is different than',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_14
                              .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                      SwitchCustom(),
                    ],
                  ),
                  Text('service address',
                      // controller.estimate1[index],
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorStyle.grey,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    height: 22,
                  ),



                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Service Address',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 4)),

                      Text('Address where the work will be done',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_12
                              .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                      TextFieldUnderline(
                        controller: controller.serviceAddressController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'Address #1',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.serviceAddressSecController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'Address #2',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.serviceCityController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'City',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.serviceStatePrivinceController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'State/Province',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFieldUnderline(
                        controller: controller.serviceZipPostelCodeController.value,
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 0
                        ),
                        hintText: 'Zip/Postal Code',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Private Notes',
                      // controller.estimate1[index],
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 4)),
                  TextFieldUnderline(
                    controller: controller.addNotesController.value,
                    padding: EdgeInsets.only(
                        top: 0,
                        bottom: 0
                    ),
                    maxLines: 6,
                    hintText: 'Add Notes',
                    textStyle: TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.black,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButtonCustom(
                    height: 60,
                    text: "Save",
                    colorBG: ColorStyle.secondryColor,
                    colorText: ColorStyle.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      // Get.to(ClientList());
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

filter() {
  return Get.dialog(Material(
      color: Colors.transparent,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 18, top: 18, bottom: 18),
              margin: EdgeInsets.only(left: 150, right: 22, bottom: 580),
              width: MediaQuery.of(Get.context!).size.width,
              decoration: BoxDecoration(
                color: ColorStyle.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Text('Saved Address',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                    onTap: () {
                      Get.back();
                      Get.to(ClientList());
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Text('Address Book',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                    onTap: () {
                      Get.back();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Get.back();
        },
      )
  )
  );
}
