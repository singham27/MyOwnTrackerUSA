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
import 'package:business_trackers/Views/TaxList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);
  final controller = Get.put(MoreScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorStyle.white,
        leadingWidth: 160,
        leading: Row(
          children: [
            SizedBox(
              width: 14,
            ),
            Text('More',
                style: TextStylesProductSans.textStyles_22
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: GetBuilder(
          init: MoreScreenController(),
          initState: (state) {
            controller.reset();
          },
          builder: (auth) {
            return Obx(()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    padding:
                    EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            controller.controllerMyAccount.profilePicture.value,
                            height: 64,
                            width: 64,
                            fit: BoxFit.fill,
                            errorBuilder: ( context, exception, stackTrace) {
                              return Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: ColorStyle.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: ColorStyle.secondryColor,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
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
                            Text(
                                controller.controllerMyAccount.emailOutSide.value,
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
                SizedBox(height: 16,),
                ListView.builder(
                    padding: EdgeInsets.only(bottom: 10),
                    shrinkWrap: true,
                    itemCount: controller.images1.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        child: InkWell(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
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
                                  Expanded(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // 'My Account',
                                          controller.moreItem[index],
                                          style: TextStylesProductSans.textStyles_16
                                              .apply(
                                              color: ColorStyle.black,
                                              fontWeightDelta: 0)),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        // 'johndeo@gmail.com',
                                          controller.moreItem1[index],
                                          style: TextStylesProductSans.textStyles_14
                                              .apply(
                                              color: ColorStyle.grey
                                                  .withOpacity(.3),
                                              fontWeightDelta: 0)),
                                    ],
                                  ),)
                                ],
                              ),
                              SizedBox(
                                height: 6,
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
                            if (index == 0)
                              Get.to(MyCompany());
                            else if (index == 1)
                              Get.to(TaxList());
                            else if (index == 2)
                              Get.to(ItemList());
                            else if (index == 3)
                              Get.to(DocumentSettings());
                            else if (index == 4)
                              Get.to(EmailMessage());
                            else if (index == 5)
                              Get.to(About());
                            //   Get.to(LiveChat());
                            // else if (controller.intAppBar == 6)
                            //   Get.to(About());
                          },
                        ),
                      );
                    }),
              ],
            ));
          },
        ),
      ),
    );
  }
}
