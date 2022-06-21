import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewTax extends StatelessWidget {
  const AddNewTax({Key? key}) : super(key: key);

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
        padding: EdgeInsets.only(left: 16,right: 16,),
        child: Column(


          children: [
             Container(
               padding: EdgeInsets.only(left: 16,right: 16,top: 20,bottom: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     children: [
                       Text(
                           'GST',
                           // controller.estimate1[index],
                           style:  TextStylesProductSans.textStyles_16
                               .apply(color: ColorStyle.black, fontWeightDelta: 2)),
                       SizedBox(height: 10,),
                       Text(
                           '12%',
                           // controller.estimate1[index],
                           style:  TextStylesProductSans.textStyles_16
                               .apply(color: ColorStyle.black, fontWeightDelta: 2)),
                     ],
                   ),
                   InkWell(
                     child: Image.asset(ImageStyle.delete,height: 30,),
                     onTap: (){},
                   )

                 ],
               ),
               decoration: BoxDecoration(
                 color: ColorStyle.blue,
                 borderRadius: BorderRadius.circular(12),

               ),
             ),
            SizedBox(height: 500,),
            Container(
              alignment: Alignment.centerRight,
              child:  ElevatedButtonCustom(
                height: 50,
                text: " +  Add",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width-280,
                onTap: () {
                  // Get.to(AddNewTax());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
