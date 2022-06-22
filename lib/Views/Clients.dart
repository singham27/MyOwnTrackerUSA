import 'package:business_trackers/Views/ClientDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/ElevatedButtonCustom.dart';
import '../Components/InvoicesPaidCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

class Clients extends StatelessWidget {
  const Clients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Clients',
                      style:  TextStylesProductSans.textStyles_30
                          .apply(color: ColorStyle.black, fontWeightDelta: 5)),
                  InkWell(child:  Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: 38,
                    child:  Icon(Icons.search,color: ColorStyle.secondryColor,),
                    decoration: BoxDecoration(
                        color: ColorStyle.secondryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                    onTap: (){},
                  ),
                ],
              ),
              SizedBox(
                height: 20,),
           Container(
            height: 460,
            child: ListView.builder(
                itemCount: 4,
                padding: EdgeInsets.only(bottom: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child:  Container(
                      padding: EdgeInsets.only(left:15,top: 20,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'ABC Company Pvt. Ltd.',
                              style:  TextStylesProductSans.textStyles_15
                                  .apply(color: ColorStyle.black,)),
                          SizedBox(
                            height: 10,),
                          Text(
                              'johndeo@gmail.com',
                              style:  TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.black,)),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: ColorStyle.blue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    onTap: () {
                      Get.to(ClientDetails());
                    },
                  );

                }),
          ),
              SizedBox(
                height: 50,),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButtonCustom(
                  text: "+  Add",
                  colorBG:ColorStyle.secondryColor,
                  colorText: ColorStyle.primaryColor,
                  width: 95,
                  onTap: () {
                    // Get.to(.NewEstimate());
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
