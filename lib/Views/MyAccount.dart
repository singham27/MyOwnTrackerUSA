import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import '../Components/PickerCustom.dart';
import '../Controllers/MyAccountController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Utils/Constant.dart';
import 'dart:io';
import '../Views/Login.dart';



class MyAccount extends StatelessWidget {
  MyAccount({Key? key}) : super(key: key);

  final controller = Get.put(MyAccountController());

  logOut(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        'Log Out',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      onPressed: () {
        Get.back();
        Get.offAll(Login());

        final storage = GetStorage();
        storage.remove(kTOKEN);
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
        'Do you want to log out ?',
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
          title: 'My Account',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: MyAccountController(),
          initState: (state) {},
          builder: (auth) {
            return Obx(() => SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Column(
                            children: [
                              if (controller.photo.value.path.isEmpty)
                                Container(
                                    child: Icon(
                                      Icons.person,
                                      size: 54,
                                      color: ColorStyle.white,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorStyle.secondryColor,
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    height: 120,
                                    width: 120)
                              else
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: Image.file(
                                      File(controller.photo.value.path),
                                      fit: BoxFit.fill,
                                      height: 120,
                                      width: 120,
                                    )),
                              SizedBox(
                                width: 16,
                              ),
                              Text('Upload photo',
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
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldUnderlinePrefixText(
                        controller: controller.firstnameController.value,
                        prefixText: "First name",
                        hintText: "John",
                        textStyle: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldUnderlinePrefixText(
                        controller: controller.lastnameController.value,
                        prefixText: "Last name",
                        hintText: "Deo",
                        textStyle: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFieldUnderlinePrefixText(
                        controller: controller.emailController.value,
                        keyboardType: TextInputType.emailAddress,
                        prefixText: "Email",
                        hintText: "johndeo@gmail.com",
                        textStyle: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: ColorStyle.grey))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                ImageStyle.Group3122,
                                height: 36,
                              ),
                              Text('Log out',
                                  style: TextStylesProductSans.textStyles_16
                                      .apply(
                                          color: ColorStyle.black,
                                          fontWeightDelta: 0)),
                              SizedBox(
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          logOut(context);
                        },
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
                          controller.validation();
                        },
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}


