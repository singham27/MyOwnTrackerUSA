import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/Authentication.dart';
import 'package:business_trackers/Views/TabbarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/ChooseYourIndustry.dart';

class ChooseYourIndustry extends StatelessWidget {
  ChooseYourIndustry({Key? key}) : super(key: key);

  final controller = Get.put(ChooseYourIndustryController());

  buttons(String text, Function() onTap) {
    return InkWell(
      child: Container(
        child: Text(text,
            textAlign: TextAlign.center,
            // maxLines: 3,
            style: TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.black)),
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        decoration: BoxDecoration(
            // color: ColorStyle.primaryColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ColorStyle.black)),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Choose your industry',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                runSpacing: 8.0,
                spacing: 12.0,
                children: <Widget>[
                  buttons('Carpentry', () => {}),
                  buttons('Decking', () => {}),
                  buttons('Drywall', () => {}),
                  buttons('Electrical', () => {}),
                  buttons('Fencing', () => {}),
                  buttons('Flooring', () => {}),
                  buttons('General Contracting', () => {}),
                  buttons('HVAC', () => {}),
                  buttons('Handyman', () => {}),
                  buttons('Home Builder', () => {}),
                  buttons('Insulation', () => {}),
                  buttons('Landscapiing', () => {}),
                  buttons('Masonry', () => {}),
                  buttons('Painting', () => {}),
                  buttons('Plastering', () => {}),
                  buttons('Renovations', () => {}),
                  buttons('Roofing', () => {}),
                  buttons('Tiling', () => {}),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButtonCustom(
                text: "Submit",
                colorBG: ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  Get.to(TabbarScreen());
                },
              ),
            ],
          ),
        ));
  }
}
