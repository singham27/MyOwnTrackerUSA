import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/CreateAnAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Forgot password',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 60
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Please enter your email so we can send you a code to verify it.',
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
                ],
              ),

              ElevatedButtonCustom(
                text: "Continue",
                colorBG: ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {

                },
              ),
            ],
          ),
        ));
  }
}

// EstimatePaymentEstimate
