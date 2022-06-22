import 'package:business_trackers/Controllers/MoreScreenController.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/About.dart';
import 'package:business_trackers/Views/DocumentSettings.dart';
import 'package:business_trackers/Views/EmailMessage.dart';
import 'package:business_trackers/Views/ItemList.dart';
import 'package:business_trackers/Views/LiveChat.dart';
import 'package:business_trackers/Views/MyAccount.dart';
import 'package:business_trackers/Views/MyCompany.dart';
import 'package:business_trackers/Views/TaxesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);
  final controller = Get.put(MoreScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('More',
                style: TextStylesProductSans.textStyles_30
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            SizedBox(
              height: 16,
            ),
            InkWell(
              child: Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Container(
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: ColorStyle.secondryColor,
                        ),
                        decoration: BoxDecoration(
                          color: ColorStyle.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        width: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Account',
                            style: TextStylesProductSans.textStyles_16.apply(
                                color: ColorStyle.white, fontWeightDelta: 4)),
                        SizedBox(
                          height: 6,
                        ),
                        Text('johndeo@gmail.com',
                            style: TextStylesProductSans.textStyles_14.apply(
                                color: ColorStyle.white, fontWeightDelta: 4)),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: ColorStyle.secondryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onTap: () {
                Get.to(MyAccount());
              },
            ),
            ListView.builder(
                padding: EdgeInsets.only(bottom: 10),
                shrinkWrap: true,
                itemCount: controller.images1.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // margin: EdgeInsets.only(top: 6),
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 20),
                    child: InkWell(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                // child: Icon(Icons.person,size: 30,color: ColorStyle.secondryColor,),
                                child: Image.asset(
                                  controller.images1[index],
                                  height: 50,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorStyle.hex('#F2EBFF'),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // height: 50,
                                // width: 50
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // 'My Account',
                                      controller.moreItem[index],
                                      style: TextStylesProductSans
                                          .textStyles_16
                                          .apply(
                                          color: ColorStyle.black,
                                          fontWeightDelta: 0)),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    // 'johndeo@gmail.com',
                                      controller.moreItem1[index],
                                      style: TextStylesProductSans
                                          .textStyles_14
                                          .apply(
                                          color: ColorStyle.grey
                                              .withOpacity(.3),
                                          fontWeightDelta: 0)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorStyle.grey,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 1,
                            // width: 50
                          ),
                        ],
                      ),
                      onTap: () {
                        // Get.back();
                        controller.intAppBar.value = index;
                        if (controller.intAppBar.value == 0)
                          Get.to(MyCompany());
                        else if (controller.intAppBar == 1)
                          Get.to(TaxesScreen());
                        else if (controller.intAppBar == 2)
                          Get.to(ItemList());
                        else if (controller.intAppBar == 3)
                          Get.to(DocumentSettings());
                        else if (controller.intAppBar == 4)
                          Get.to(EmailMessage());
                        else if (controller.intAppBar == 5)
                          Get.to(LiveChat());
                        else if (controller.intAppBar == 6) Get.to(About());
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
