import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditCotract extends StatelessWidget {
  const EditCotract({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Edit Cotract',
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [
            InkWell(
              child: Icon(Icons.delete,color: ColorStyle.hex('#FF8989')),
              onTap: (){
                filter(context);

              },
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextField (
                decoration: InputDecoration(
                    hintText: 'Generic Contract'
                ),
              ),
              SizedBox(height: 22,),
              Text(
                  'By signing this document, the customer agrees to the services and conditions outlined in this document.',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.black, fontWeightDelta: 0)),
              SizedBox(height: 350,),
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
filter(context) {
  // final controller = Get.put(HomeScreenController());

  return Get.dialog(
      Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 18,right: 18,top: 22,bottom: 22),
                margin: EdgeInsets.only(left: 50, right: 50,top: 80),
                // height: 100,
                width: MediaQuery.of(Get.context!).size.width,
                decoration: BoxDecoration(
                  color: ColorStyle.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                        'Are you sure you want to remove generic contract?',
                        textAlign: TextAlign.center,
                        // controller.estimate1[index],
                        style:  TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.black, fontWeightDelta: 0)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonCustom(
                      height: 50,
                      text: "Remove",
                      colorBG:ColorStyle.secondryColor,
                      colorText: ColorStyle.primaryColor,
                      width: MediaQuery.of(context).size.width,
                      onTap: () {
                        Get.back();

                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButtonCustom(
                      height: 50,
                      text: "Cancel",
                      colorBG:ColorStyle.primaryColor,
                      colorText: ColorStyle.black,
                      width: MediaQuery.of(context).size.width,
                      onTap: () {
                        Get.back();

                      },
                    ),



                  ],
                ),
              ),
            ],
          )
      ));
}