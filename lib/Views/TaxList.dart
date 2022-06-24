import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:business_trackers/Components/TextFieldCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Components/AddTaxes.dart';

class TaxList extends StatelessWidget {
  TaxList({Key? key}) : super(key: key);

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
      floatingActionButton: ElevatedButtonCustom(
        height: 50,
        text: " +  Add",
        colorBG: ColorStyle.secondryColor,
        colorText: ColorStyle.primaryColor,
        width: 120,
        onTap: () {
          AddTaxes.addTaxes(context);
        },
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: ListView.separated(
            padding: EdgeInsets.only(bottom: 80),
            itemCount: 10,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: ColorStyle.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('GST',
                            style: TextStylesProductSans.textStyles_16.apply(
                                color: ColorStyle.black, fontWeightDelta: 2)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('12%',
                            style: TextStylesProductSans.textStyles_16.apply(
                                color: ColorStyle.black, fontWeightDelta: 2)),
                      ],
                    ),
                    IconButton(
                      icon: Image.asset(
                        ImageStyle.delete,
                        height: 50,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
