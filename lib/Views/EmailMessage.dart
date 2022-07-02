import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailMessage extends StatelessWidget {
  const EmailMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Email Message',
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
                  'Estimate Email Message ',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)
              ),
              SizedBox(height: 20,),
              Text(
                  'We are excited about the possibility of working with you.',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.black, fontWeightDelta: 0)
              ),
              SizedBox(height: 14,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 40,),
              Text(
                  'Invoice Email Message ',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)
              ),
              SizedBox(height: 20,),
              Text(
                  'Thanks for your business!',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.black, fontWeightDelta: 0)
              ),
              SizedBox(height: 14,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),


              // SizedBox(height: 14,),

              SizedBox(height: 340,),
              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(ItemList());

                },
              ),

            ],
          ),
        )
    );
  }
}
