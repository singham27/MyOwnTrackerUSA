import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/PaymentAdd.dart';


class PaymentList extends StatelessWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Payments',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        floatingActionButton: ElevatedButtonCustom(
          text: "+  Add",
          colorBG:ColorStyle.secondryColor,
          colorText: ColorStyle.primaryColor,
          width: 94,
          onTap: () {
            Get.to(PaymentAdd());
          },
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Paid',
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black,)),
                  Text(
                      '\$456.00',
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black,)),
                ],),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:20 ),
                height: 60,
                decoration: BoxDecoration(
                  color: ColorStyle.secondryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:  Text(
                    '\$ 224.00 of \$224.00',
                    style:  TextStylesProductSans.textStyles_18
                        .apply(color: ColorStyle.white,)),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount:3,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '\$224.00',
                            style:  TextStylesProductSans.textStyles_15
                                .apply(color: ColorStyle.black,)),
                        SizedBox(height: 10,),
                        Text(
                            'Friday, 17 June • Cash',
                            style:  TextStylesProductSans.textStyles_13
                                .apply(color: ColorStyle.black,)),
                        SizedBox(height: 15,),
                        Container(
                            height: 1,
                            color: ColorStyle.grey
                        ),
                        SizedBox(height: 15,),
                      ],
                    );

                  }),
            ],
          ),
        )
    );
  }
}


