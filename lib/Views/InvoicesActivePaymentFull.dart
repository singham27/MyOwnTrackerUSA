import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class InvoicesActivePaymentFull extends StatelessWidget {
  const InvoicesActivePaymentFull({Key? key}) : super(key: key);

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
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left:20 ),
                height: 60,
                child:  Text(
                    '\$ 224.00 of \$224.00',
                    style:  TextStylesProductSans.textStyles_18
                        .apply(color: ColorStyle.white,)),
                decoration: BoxDecoration(
                  color: ColorStyle.secondryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Container(
                child: ListView.builder(
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
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButtonCustom(
                  text: "+  Add",
                  colorBG:ColorStyle.secondryColor,
                  colorText: ColorStyle.primaryColor,
                  width: 94,
                  onTap: () {
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
    );
  }
}
