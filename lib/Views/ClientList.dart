import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ClientList extends StatelessWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Client List',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 16, right: 16
              ),
              padding: EdgeInsets.only(
                left: 16,
              ),
              alignment: Alignment.centerLeft,
              // height: 2,
              // width: 20,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                          border: InputBorder.none,
                          hintText: 'Search client'),
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
                      left: 16, right: 16,
                      bottom: 16, top: 16),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
                      alignment: Alignment.centerLeft,
                      // height: 2,
                      // width: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ABC Company Pvt. Ltd.',
                              // controller.estimate1[index],
                              style: TextStylesProductSans.textStyles_14
                                  .apply(
                                  color: ColorStyle.black,
                                  fontWeightDelta: 0)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('johndeo@gmail.com',
                              // controller.estimate1[index],
                              style: TextStylesProductSans.textStyles_14
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
        ));
  }
}
