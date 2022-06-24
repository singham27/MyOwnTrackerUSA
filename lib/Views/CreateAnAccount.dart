import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Controllers/SignUpController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/Authentication.dart';
import 'package:business_trackers/Views/CreatePassword.dart';
import 'package:business_trackers/Views/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateAnAccount extends StatelessWidget {
  CreateAnAccount({Key? key}) : super(key: key);

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        appBar: AppBarStyle(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Create an account',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageStyle.logo,
                    height: 60,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text('Welcome to Business Tracker USA',
                        textAlign: TextAlign.left,
                        // maxLines: 3,
                        style: TextStylesProductSans.textStyles_14.apply(
                          color: ColorStyle.black,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('Email',
                  textAlign: TextAlign.center,
                  // maxLines: 3,
                  style: TextStylesProductSans.textStyles_14.apply(
                    color: ColorStyle.black,
                  )),
              SizedBox(
                height: 10,
              ),
              TextFieldOutline(
                controller: controller.emailaddressController.value,
                radiusBorder: 14,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
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
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Or Continue with',
                    // textAlign: TextAlign.center,
                    // maxLines: 3,
                    style: TextStylesProductSans.textStyles_14.apply(
                      color: ColorStyle.black,
                    )),
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageStyle.Google__G__Logo,
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Google',
                              textAlign: TextAlign.center,
                              // maxLines: 3,
                              style: TextStylesProductSans.textStyles_14.apply(
                                color: ColorStyle.black,
                              )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: ColorStyle.grey)),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageStyle.Apple_logo_black,
                            height: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Apple',
                              textAlign: TextAlign.center,
                              // maxLines: 3,
                              style: TextStylesProductSans.textStyles_14.apply(
                                color: ColorStyle.black,
                              )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: ColorStyle.grey)),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
              ElevatedButtonCustom(
                text: "Continue",
                colorBG: ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  controller.signUp();
                },
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Center(
                  child: Text('Already have an account with us? Login',
                      // textAlign: TextAlign.center,
                      // maxLines: 3,
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                ),
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('By clicking "Continue", you agree to our',
                    // textAlign: TextAlign.center,
                    // maxLines: 3,
                    style: TextStylesProductSans.textStyles_12.apply(
                      color: ColorStyle.black,
                    )),
              ),
              SizedBox(
                height: 2,
              ),
              Center(
                child: Text('Terms of Services and Privacy Policies',
                    // textAlign: TextAlign.center,
                    // maxLines: 3,
                    style: TextStylesProductSans.textStyles_12.apply(
                      color: ColorStyle.black,
                    )),
              )
            ],
          ),
        ));
  }
}
