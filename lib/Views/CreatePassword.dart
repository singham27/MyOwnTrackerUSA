import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Controllers/SignUpController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/ChooseYourIndustry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:business_trackers/Views/TabbarScreen.dart';

class CreatePassword extends StatelessWidget {
  CreatePassword({Key? key}) : super(key: key);

  final controller = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Create password',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: Container(
          padding: EdgeInsets.only(left: 20,right: 20, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Password',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldPWDOutline(
                    controller: controller.passwordController.value,
                    radiusBorder: 14,
                    hintText: 'Enter your password',
                    padding: EdgeInsets.only(
                        left: 16, right: 16
                    ),
                    colorBoder: Colors.black,
                    textStyle: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                        fontWeightDelta: 0
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Confirrm Password',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldPWDOutline(
                    controller: controller.confirmpasswordController.value,
                    radiusBorder: 14,
                    hintText: 'Enter your password',
                    padding: EdgeInsets.only(
                        left: 16, right: 16
                    ),
                    colorBoder: Colors.black,
                    textStyle: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                        fontWeightDelta: 0
                    ),
                  ),
                ],
              ),
              ElevatedButtonCustom(
                text: "Continue",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
              controller.createpassword();
                },
              ),
            ],
          ),
        )
    );
  }
}
