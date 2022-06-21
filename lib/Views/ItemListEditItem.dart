import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/AppBarStyle.dart';

class ItemListEditItem extends StatelessWidget {
   ItemListEditItem({Key? key}) : super(key: key);
   bool isSwitched = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ColorStyle.secondryColor;
    }
    return ColorStyle.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Edit Item',
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [


            InkWell(
              child: Image.asset(ImageStyle.delete,height: 30,),
              onTap: (){


              },
            ),
          ],
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              TextField (
                decoration: InputDecoration(
                  // border: InputBorder.none,

                    hintText: 'Solid'
                ),
              ),
              SizedBox(height: 34,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Quantity',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      '1',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),

                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 34,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Rate',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  Text(
                      '100',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),

                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 20,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(child: Container(
                    padding: EdgeInsets.only(left: 4,right: 4,top: 4,bottom: 4),
                    // height: 1,
                    alignment: Alignment.center,
                    child: Icon(Icons.check,    color: ColorStyle.primaryColor,),
                    decoration: BoxDecoration(
                        color: ColorStyle.secondryColor,
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),onTap: (){
                    // filter(context);
                  },),
                  // Checkbox(
                  //
                  //   checkColor: Colors.white,
                  //   fillColor: MaterialStateProperty.resolveWith(getColor),
                  //   value: isChecked,
                  //   onChanged: (bool? value) {
                  //
                  //       isChecked = value!;
                  //
                  //   },
                  // ),
                  SizedBox(width: 20,),
                  Text(
                      'Save to items list for future use',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),

                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 14,),
              Text(
                  'Taxes',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'GST (12%)',
                      // controller.estimate1[index],
                      style:  TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                  // InkWell(child:  Image.asset(ImageStyle.Group17,height: 20,),onTap: (){},)
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {

                      isSwitched = value;
                      print(isSwitched);

                    },
                    activeTrackColor:ColorStyle.secondryColor.withOpacity(.3),
                    activeColor: ColorStyle.secondryColor,
                  ),
                ],
              ),
              // SizedBox(height: 14,),
              InkWell(child: Text(
                  '+ ADD NEW TAX',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.secondryColor, fontWeightDelta: 0)),onTap: (){
                // filters(context);
              },),
              SizedBox(height: 20,),
              Container(
                height: 1,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: ColorStyle.grey,
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(height: 20,),
              Text(
                  'Description',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 3)
              ),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: 'Lorem Ipsum'
                ),
              ),
              SizedBox(height: 140,),
              ElevatedButtonCustom(
                height: 60,
                text: "Save",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(ItemList());

                },
              ),

            ],
          ),
        )
    );
  }
}
