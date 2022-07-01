import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/EditCotractController.dart';

class EditCotract extends StatelessWidget {
   EditCotract({Key? key}) : super(key: key);

  final controller = Get.put(EditCotractController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Edit Contract',
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [
            IconButton(
              icon: Icon(Icons.delete,color: ColorStyle.hex('#FF8989')),
              onPressed: () {

              },
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 80
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextFieldUnderline(
                    controller: controller.genericContractController.value,
                    hintText: 'Generic Contract',
                    textStyle: TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.black, fontWeightDelta: 0),
                  ),
                  SizedBox(height: 22,),
                  Text(
                      'By signing this document, the customer agrees to the services and conditions outlined in this document.',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  controller.validation();
                  // Get.to(ChooseYourIndustry());
                },
              ),
            ],
          ),
        )
    );
  }
}
