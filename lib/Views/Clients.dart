import 'package:business_trackers/Views/ClientDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Controllers/ClientsController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/EditClient.dart';

class Clients extends StatelessWidget {
   Clients({Key? key}) : super(key: key);
  final controller = Get.put(ClientsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorStyle.white,
        leadingWidth: 150,
        leading: Row(
          children: [
            SizedBox(
              width: 14,
            ),
            Text('Clients',
                style: TextStylesProductSans.textStyles_24
                    .apply(color: ColorStyle.black, fontWeightDelta: 4)),
          ],
        ),
        actions: [
          Row(
            children: [
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      color: ColorStyle.secondryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Icon(
                    Icons.search,
                    color: ColorStyle.secondryColor,
                    size: 30,
                  ),
                ),
                onTap: () {

                },
              ),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
        floatingActionButton: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          alignment: Alignment.bottomRight,
          child: ElevatedButtonCustom(
            text: "+  Add",
            colorBG:ColorStyle.secondryColor,
            colorText: ColorStyle.primaryColor,
            width: 95,
            onTap: () {
              Get.to(EditClient( title: 'Add Client',));
            },
          ),
        ),
        body: GetBuilder(
          init: ClientsController(),
          initState: (state) {
            controller.reset();
          },
          builder: (auth) {
            return Obx(() =>  ListView.builder(
                itemCount: controller.arrModelClient.length,
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 80
                ),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child:  Container(
                      padding: EdgeInsets.only(left:15,top: 20,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 'ABC Company Pvt. Ltd.',
                              controller.arrModelClient[index].name!,
                              style:  TextStylesProductSans.textStyles_15
                                  .apply(color: ColorStyle.black,)),
                          SizedBox(
                            height: 10,),
                          Text(
                            // 'johndeo@gmail.com',

                              controller.arrModelClient[index].email!,
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
                      Get.to(ClientDetails(
                        modelClient: controller.arrModelClient[index],
                      ))!.then((value) {
                        if (value.toString() == 'true') {
                          controller.reset();
                        }
                      });
                    },
                  );
                }),);
          },
        ));



  }
}
