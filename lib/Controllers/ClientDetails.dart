import 'package:business_trackers/Views/EditClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import '../Controllers/EditClientController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Models/ModelClient.dart';

class ClientDetails extends StatelessWidget {
  ModelClient modelClient;
  ClientDetails({Key? key,  required this.modelClient}) : super(key: key);

  final controller = Get.put(EditClientController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Client Details',
          leading: BackButton(
            color: ColorStyle.black,
          ),
          trailings: [
            InkWell(
              child:Image.asset(ImageStyle.editIcon,height: 20,),
              onTap: (){
                controller.modelClient.value = modelClient;
                Get.to(EditClient(title: 'Edit Client',));
              },
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  modelClient.name.toString(),
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      modelClient.email.toString(),
                      // 'johndeo@gmail.com',
                      style:  TextStylesProductSans.textStyles_15
                          .apply(color: ColorStyle.black,)),
                  Image.asset(ImageStyle.Group3117,height: 30,)
                ],
              ),
              SizedBox(height: 19,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      modelClient.mobileNumber.toString(),
                      // '1234567890',
                      style:  TextStylesProductSans.textStyles_15
                          .apply(color: ColorStyle.black,)),
                  Image.asset(ImageStyle.Group3118,height: 30,)
                ],
              ),
              SizedBox(height: 17,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      modelClient.homeNumber.toString(),
                      // '1234567890',
                      style:  TextStylesProductSans.textStyles_15
                          .apply(color: ColorStyle.black,)),
                  Image.asset(ImageStyle.Group3118,height: 30,)
                ],
              ),
              SizedBox(height: 27,),
              Container(
                height: 1,
                color: ColorStyle.hex('#BBB7C4'),
              ),
              SizedBox(height: 15,),
              Text(
                  modelClient.billing_address_1.toString(),
                  // 'Address',
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 16,),
              Text(
                  modelClient.service_address_1.toString(),
                  // '100 \nabc street \nabc city abc 123456',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, )),
              SizedBox(height: 27,),
              Container(
                height: 1,
                color: ColorStyle.hex('#BBB7C4'),
              ),
              SizedBox(height: 16,),
              Text(
                  'Notes',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(height: 16,),
              Text(

                  'Lorem ipsum dolor sit amet, consetetur '
                  'sadipscing elitr, sed diam nonumy eirmod'
              'tempor invidunt ut labore et dolore ',
                  // controller.estimate1[index],
                  style:  TextStylesProductSans.textStyles_15
                      .apply(color: ColorStyle.black,)),



            ],
          ),
        )
    );
  }
}
