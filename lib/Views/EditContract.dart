import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controllers/DocumentSettingsController.dart';

class EditCotract extends StatelessWidget {
  bool isShowDelete;
  EditCotract({Key? key, required this.isShowDelete}) : super(key: key);
  final controller = Get.put(DocumentSettingsController());

  delete() {
    Widget cancelButton = TextButton(
      child: Text(
        'Delete',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      onPressed: () {
        Get.back();
        controller.updateGenericContract();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        'Cancel',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        'Are you sure?',
        style: TextStylesProductSans.textStyles_16.apply(
            color: Colors.red,
            fontWeightDelta: 0
        ),
      ),
      content: Text(
        'Do you want to delete this Generic Contract ?',
        style: TextStylesProductSans.textStyles_16.apply(
            fontWeightDelta: 0
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
            if (isShowDelete)
            IconButton(
              icon: Icon(Icons.delete, color: ColorStyle.hex('#FF8989')),
              onPressed: () {
                delete();
              },
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextFieldUnderline(
                    controller: controller.genericController.value,
                    hintText: 'Generic Contract',
                    textStyle: TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.black, fontWeightDelta: 0),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                      'By signing this document, the customer agrees to the services and conditions outlined in this document.',
                      // controller.estimate1[index],
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                ],
              ),
              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG: ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  controller.validationContractName();
                },
              ),
            ],
          ),
        ));
  }
}
