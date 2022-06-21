import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditClient extends StatelessWidget {
  const EditClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyless(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Edit Client',
        leading: BackButton(
          color: ColorStyle.black,
        ),
        trailings: [
          InkWell(
            child: Text(
                'My Client',

                style:  TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),
            onTap: (){
              myClient();

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
            Text(
                'Basic Info',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            TextFieldEditClient(),
            Text(
                'Billing Address',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            SizedBox(height: 12,),
            Text(
                'Address where the bill be sent',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_12
                    .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
            TextFieldEditClients(),
            SizedBox(height: 22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Billing address is different than',
                    // controller.estimate1[index],
                    style:  TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                InkWell(child:  Image.asset(ImageStyle.Group17,height: 20,),onTap: (){},)
              ],
            ),
            Text(
                'service address',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.black, fontWeightDelta: 0)),
            SizedBox(height: 15,),
            Container(
              height: 1,
              alignment: Alignment.center,

              decoration: BoxDecoration(
                  color: ColorStyle.grey,
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            SizedBox(height: 22,),
            Text(
                'Service Address',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            SizedBox(height: 10,),
            Text(
                'Address where the work will be done',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_12
                    .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
            TextFieldEditClients(),
            SizedBox(height: 38,),
            Container(
              height: 1,
              alignment: Alignment.center,

              decoration: BoxDecoration(
                  color: ColorStyle.grey,
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            SizedBox(height: 30,),
            Text(
                'Private Notest',
                // controller.estimate1[index],
                style:  TextStylesProductSans.textStyles_16
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            TextField (
              decoration: InputDecoration(
                border: InputBorder.none,

                  hintText: 'Add Notes'
              ),
            ),
            SizedBox(height: 100,),
            ElevatedButtonCustom(
              height: 60,
              text: "Save",
              colorBG:ColorStyle.grays,
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
 myClient(){
  Container(
    child: Column(
      children: [
        Text(
            'Saved Address',
            // controller.estimate1[index],
            style:  TextStylesProductSans.textStyles_16
                .apply(color: ColorStyle.black, fontWeightDelta: 0)),
        Text(
            'Address Book',
            // controller.estimate1[index],
            style:  TextStylesProductSans.textStyles_16
                .apply(color: ColorStyle.black, fontWeightDelta: 0)),
      ],
    ),
    height: 30,
    width: 100,
    color: ColorStyle.white,

  );
 }