import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Controllers/AboutController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/AboutUs.dart';
import 'package:business_trackers/Views/PrivacyPolicy.dart';
import 'package:business_trackers/Views/TermsOfService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
   About({Key? key}) : super(key: key);
  final controller = Get.put(AboutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'About',
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
              ListView.builder(
                // padding: EdgeInsets.only(bottom: 16),
                  shrinkWrap: true,
                  itemCount: controller.moreItem.length,
                  // scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {


                    return  InkWell(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Text(
                            // 'www.abcd.com',
                              controller.moreItem[index],
                              style:  TextStylesProductSans.textStyles_16
                                  .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                          SizedBox(height: 12,),
                          Container(
                            height: 1,
                            // width: MediaQuery.of(context).size.width-90,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                                color: ColorStyle.grey,
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ],
                      ),
                      onTap: (){
                        // Get.back();
                        // Get.back();
                        controller.intAppBar.value = index;
                        if (controller.intAppBar.value == 0)
                          Get.to( AboutUs());
                        else if (controller.intAppBar == 1)
                          Get.to( PrivacyPolicy());
                        else  if (controller.intAppBar == 2)
                          Get.to( TermsOfService());
                      },
                    );

                  })



            ],
          ),
        ),


    );
  }
}
