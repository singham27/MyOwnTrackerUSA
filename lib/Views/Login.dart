import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/CreateAnAccount.dart';
import '../Views/ForgotPassword.dart';
import '../Views/TabbarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Login',
          // leading: BackButton(
          //   color: ColorStyle.black,
          // ),
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
              Text('Welcome back, we missed you!',
                  textAlign: TextAlign.center,
                  // maxLines: 3,
                  style: TextStylesProductSans.textStyles_14.apply(
                    color: ColorStyle.black,
                  )),
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
                height: 20,
              ),
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
                height: 40,
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Forgot Password?',
                      // textAlign: TextAlign.center,
                      // maxLines: 3,
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                ),
                onTap: () {
                  Get.to(ForgotPassword());
                },
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
                  Get.offAll(TabbarScreen());
                },
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Center(
                  child: Text('Having trouble logging in? Sign up',
                      // textAlign: TextAlign.center,
                      // maxLines: 3,
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                ),
                onTap: () {
                  Get.to(CreateAnAccount());
                },
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
