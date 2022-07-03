import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Components/TextFieldCustom.dart';
import '../Controllers/EmailMessageController.dart';

class EmailMessage extends StatelessWidget {
  EmailMessage({Key? key}) : super(key: key);

  final controller = Get.put(EmailMessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Email Message',
          leading: BackButton(
            color: ColorStyle.black,
            onPressed: () {
              Get.back();
              controller.refresh();
            },
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: GetBuilder(
          init: EmailMessageController(),
          initState: (state) {
            controller.onInit();
          },
          builder: (auth) {
            return Obx(()=>Container(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Estimate Email Message ',
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 3)),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldUnderline(
                        controller: controller.txtEstimateEmailMessage.value,
                        maxLines: 6,
                        padding: EdgeInsets.only(
                            bottom: 10
                        ),
                        hintText: 'e.g. We are excited about the possibility ...',
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black, fontWeightDelta: 0),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('Invoice Email Message ',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_16
                              .apply(color: ColorStyle.black, fontWeightDelta: 3)),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldUnderline(
                        controller: controller.txtInvoiceEmailMessage.value,
                        maxLines: 3,
                        hintText: 'Thanks for your business  ...',
                        padding: EdgeInsets.only(
                            bottom: 10
                        ),
                        textStyle: TextStylesProductSans.textStyles_14
                            .apply(color: ColorStyle.black, fontWeightDelta: 0),
                      ),
                    ],
                  ),

                  ElevatedButtonCustom(
                    height: 60,
                    text: "Save",
                    colorBG: ColorStyle.secondryColor,
                    colorText: ColorStyle.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      controller.validation();
                    },
                  ),
                ],
              ),
            ));
          },
        )
    );
  }
}
