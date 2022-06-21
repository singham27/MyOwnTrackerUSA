import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            alignment: Alignment.center,
            child: InkWell(
              child: Column(
                children: [
                  Container(

                      child: Icon(Icons.person,size: 54,color: ColorStyle.white,),
                      decoration: BoxDecoration(
                        color: ColorStyle.secondryColor,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      height: 120,
                      width: 120
                  ),
                  SizedBox(width: 20,),
                  Text(
                      'Upload photo',

                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black,fontWeightDelta: 0)),
                ],
              ),
              onTap: (){},
            ),



          ),


                 SizedBox(height: 25,),
              TextFieldEditAccount(),
              SizedBox(height: 20,),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageStyle.Group3122,height: 36,),
                    Text(
                        'Log out',

                        style:  TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                    SizedBox(width: 200,),

                  ],),
                onTap: (){},
              ),
              SizedBox(height: 14,),
              Container(

                color: ColorStyle.grey,

                height: 1,
                // width: 120
              ),




              SizedBox(height: 100,),

              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(ChooseYourIndustry());
                },
              ),

            ],
          ),
        )
    );
  }
}
