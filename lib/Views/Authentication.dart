import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/ChooseYourIndustry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Authentication',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Text(
                  'Please enter the six-digit code we are sent on',
                  // textAlign: TextAlign.center,
                  // maxLines: 3,
                  style:  TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.black, )),
              SizedBox(height: 20,),
              Text(
                  'johndeo@gmail.com',
                  // textAlign: TextAlign.center,
                  // maxLines: 3,
                  style:  TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.black, )),
              SizedBox(height: 20,),
              Text(
                  'Email',
                  textAlign: TextAlign.center,
                  // maxLines: 3,
                  style:  TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.black, )),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: TextField (
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,

                      hintText: 'Enter Your email',
                      hintStyle: TextStyle(
                      fontSize: 14
                  )
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: ColorStyle.grey
                    )
                ),
              ),
              SizedBox(height: 300,),

              ElevatedButtonCustom(
                text: "Continue",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(ChooseYourIndustry());
                },
              ),
              SizedBox(height: 30,),
              InkWell(
                child:     Center(
                  child:   Text(
                      'Already have an account with us? Login',
                      // textAlign: TextAlign.center,
                      // maxLines: 3,
                      style:  TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.black, )),
                ),
                onTap: (){},
              ),
              SizedBox(height: 50,),
              Center(
                child:   Text(
                    'By clicking "Continue", you agree to our',
                    // textAlign: TextAlign.center,
                    // maxLines: 3,
                    style:  TextStylesProductSans.textStyles_12
                        .apply(color: ColorStyle.black, )),
              ),
              SizedBox(height: 2,),
              Center(
                child:   Text(
                    'Terms of Services and Privacy Policies',
                    // textAlign: TextAlign.center,
                    // maxLines: 3,
                    style:  TextStylesProductSans.textStyles_12
                        .apply(color: ColorStyle.black, )),
              )
            ],
          ),
        )
    );
  }
}
