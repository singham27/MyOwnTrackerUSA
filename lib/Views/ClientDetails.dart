import 'package:business_trackers/Views/EditClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/AppBarStyle.dart';
import '../Controllers/EditClientController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Models/ModelClient.dart';

class ClientDetails extends StatelessWidget {
  ModelClient modelClient;

  ClientDetails({Key? key, required this.modelClient}) : super(key: key);

  final controller = Get.put(EditClientController());

  delete() {
    Widget cancelButton = TextButton(
      child: Text(
        'Delete',
        style: TextStylesProductSans.textStyles_14.apply(fontWeightDelta: 0),
      ),
      onPressed: () {
        Get.back();
        controller.deleteClient(modelClient.id.toString());
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        'Cancel',
        style: TextStylesProductSans.textStyles_14.apply(fontWeightDelta: 0),
      ),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        'Are you sure?',
        style: TextStylesProductSans.textStyles_16
            .apply(color: Colors.red, fontWeightDelta: 0),
      ),
      content: Text(
        'Do you want to delete this client details ?',
        style: TextStylesProductSans.textStyles_14.apply(fontWeightDelta: 0),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Client Details',
          leading: BackButton(
            color: ColorStyle.black,
            onPressed: () {
              Get.back();
            },
          ),
          trailings: [
            InkWell(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  ImageStyle.editIcon,
                  height: 18,
                ),
              ),
              onTap: () {
                controller.modelClient.value = modelClient;
                Get.to(EditClient(
                  title: 'Edit Client',
                ));
              },
            ),
            SizedBox(
              width: 6,
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(2),
                child: Image.asset(
                  ImageStyle.delete,
                  height: 32,
                ),
              ),
              onTap: () {
                delete();
              },
            ),
            SizedBox(
              width: 6,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(modelClient.name.toString(),
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(modelClient.email.toString(),
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                  Image.asset(
                    ImageStyle.Group3117,
                    height: 30,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(modelClient.mobileNumber.toString(),
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                  Image.asset(
                    ImageStyle.Group3118,
                    height: 30,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(modelClient.homeNumber.toString(),
                      style: TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.black,
                      )),
                  Image.asset(
                    ImageStyle.Group3118,
                    height: 30,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: ColorStyle.hex('#BBB7C4'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Billing Address',
                  // 'Address',
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(
                height: 10,
              ),
              Text(
                  modelClient.billing_address_1.toString()
                      +'\n'+ modelClient.billing_address_2.toString()
                      +'\n'+ modelClient.billing_city.toString()
                      +'\n'+ modelClient.billing_state_Province.toString()
                      +'\n'+ modelClient.billing_zip_Postal_Code.toString(),
                  style: TextStylesProductSans.textStyles_14.apply(
                    color: ColorStyle.black,
                  )
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                color: ColorStyle.hex('#BBB7C4'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'Service Address',
                  // 'Address',
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(
                height: 10,
              ),
              Text(
                  modelClient.service_address_1.toString()
                      +'\n'+ modelClient.service_address_2.toString()
                      +'\n'+ modelClient.service_city.toString()
                      +'\n'+ modelClient.service_state_Province.toString()
                      +'\n'+ modelClient.service_zip_Postal_Code.toString(),
                  style: TextStylesProductSans.textStyles_14.apply(
                    color: ColorStyle.black,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: ColorStyle.hex('#BBB7C4'),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Notes',
                  style: TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, fontWeightDelta: 4)),
              SizedBox(
                height: 10,
              ),
              Text(
                modelClient.notes.toString(),
                  style: TextStylesProductSans.textStyles_14.apply(
                    color: ColorStyle.black,
                  )
              ),
            ],
          ),
        ));
  }
}
