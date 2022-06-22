import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/AddNewTax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class TaxesScreen extends StatelessWidget {
  const TaxesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyless(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Taxes',
        leading: BackButton(
          color: ColorStyle.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 38,right: 38,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
              Image.asset(ImageStyle.Group3141,height: 100,),
            Text(
                'No Taxes',

                style:  TextStylesProductSans.textStyles_24
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
            Text(
                'There are no taxes currently in your list. Tap +add to create a new tax!',
                          textAlign: TextAlign.center,
                style:  TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.black, fontWeightDelta: 0)),
          SizedBox(height: 240,),
           Container(
             alignment: Alignment.centerRight,
             child:  ElevatedButtonCustom(
               height: 50,
               text: " +  Add",
               colorBG:ColorStyle.secondryColor,
               colorText: ColorStyle.primaryColor,
               width: MediaQuery.of(context).size.width-260,
               onTap: () {
                 Get.to(AddNewTax());
               },
             ),
           )
          ],
        ),
      ),
    );
  }
}
