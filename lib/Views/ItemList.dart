import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditItem.dart';
import 'package:business_trackers/Views/PaymentSchedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Item List',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        floatingActionButton: ElevatedButtonCustom(
          width: 160,
          height: 50,
          text: "+ Add Item",
          colorBG: ColorStyle.secondryColor,
          colorText: ColorStyle.white,
          onTap: () {
            Get.to(EditItem());
          },
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: ColorStyle.secondryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Search Item'),
                    ),
                  ),
                ],
              ),

              decoration: BoxDecoration(
                  color: ColorStyle.blue,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 16,
                      bottom: 80
                  ),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 16),
                      alignment: Alignment.center,
                      // height: 2,
                      // width: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Solid',
                                  style: TextStylesProductSans.textStyles_16
                                      .apply(
                                      color: ColorStyle.black,
                                      fontWeightDelta: 0)),
                              Text('\$100.00',
                                  style: TextStylesProductSans.textStyles_16
                                      .apply(
                                      color: ColorStyle.black,
                                      fontWeightDelta: 0)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Lorem Ipsum',
                              style: TextStylesProductSans.textStyles_16
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: ColorStyle.blue,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  }),
            ),
          ],
        )
    );
  }
}
