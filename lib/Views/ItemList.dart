import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/PaymentSchedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Item List',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16,),
                alignment: Alignment.centerLeft,
                // height: 2,
                // width: 20,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.search,color: ColorStyle.secondryColor,),
                    SizedBox(width: 10,),
                    Expanded(child: TextField (
                      decoration: InputDecoration(
                          border: InputBorder.none,

                          hintText: 'Search Item'
                      ),
                    ),),
                  ],
                ),

                decoration: BoxDecoration(
                    color: ColorStyle.blue,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              // SizedBox(height: 15,),
              Container(
                // alignment: Alignment.center,
                height: MediaQuery.of(context).size.height-500,
                // color: ColorStyle.grey,
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 16,top: 16),
                    shrinkWrap: true,
                    itemCount: 2,
                    // scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {


                      return Container(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                        alignment: Alignment.center,
                        // height: 2,
                        // width: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Solid',

                                    style:  TextStylesProductSans.textStyles_16
                                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                                Text(
                                    '\$100.00',

                                    style:  TextStylesProductSans.textStyles_16
                                        .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text(
                                'Lorem Ipsum',

                                style:  TextStylesProductSans.textStyles_16
                                    .apply(color: ColorStyle.black, fontWeightDelta: 0)),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: ColorStyle.blue,
                            borderRadius: BorderRadius.circular(20)
                        ),
                      );

                    }),
              ),
              SizedBox(height: 228,),
             Container(
               alignment: Alignment.centerRight,
               child:  ElevatedButtonCustom(
                 height: 50,
                 text: "+ Add Item",
                 colorBG:ColorStyle.secondryColor,
                 colorText: ColorStyle.white,
                 width: MediaQuery.of(context).size.width-240,
                 onTap: () {
                   Get.to(PaymentSchedule());

                 },
               ),
             )



            ],
          ),
        )
    );
  }
}
