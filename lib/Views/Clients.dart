import 'package:business_trackers/Models/ModelClient.dart';
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
  bool isFromEstimate;
  Clients({Key? key, this.isFromEstimate = false}) : super(key: key);
  final controller = Get.put(ClientsController());

  ModelClient modelClientSelected = ModelClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorStyle.white,
        title: Text('Clients',
            style: TextStylesProductSans.textStyles_24
                .apply(color: ColorStyle.black, fontWeightDelta: 4)),
        centerTitle: false,
        leadingWidth: isFromEstimate ? 60 : 10,
        leading: Row(
          children: [
            SizedBox(width: 10,),
            isFromEstimate ? BackButton(color: Colors.black,) : SizedBox()
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: ColorStyle.secondryColor,
                  size: 30,
                ),
                onPressed: () {

                },
              ),
              if (isFromEstimate)
              IconButton(
                icon: Icon(
                  Icons.check_circle_sharp,
                  color: ColorStyle.secondryColor,
                  size: 30,
                ),
                onPressed: () {
                  Get.back(result: modelClientSelected);
                },
              ),
              SizedBox(width: 16,),
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
                itemCount: controller.arrSelectedIndex.length,
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
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: ColorStyle.blue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.arrModelClient[index].name!,
                                    style:  TextStylesProductSans.textStyles_15
                                        .apply(color: ColorStyle.black,)),
                                SizedBox(
                                  height: 10,),
                                Text(
                                    controller.arrModelClient[index].email!,
                                    style:  TextStylesProductSans.textStyles_14
                                        .apply(color: ColorStyle.black,)),
                              ],
                            ),
                          ),
                          if (isFromEstimate)
                          IconButton(
                            icon: Icon(
                              Icons.check_circle_sharp,
                              color: controller.arrSelectedIndex[index] ? ColorStyle.secondryColor : ColorStyle.grey.withOpacity(0.6),
                              size: 28,
                            ),
                            onPressed: () {
                              for (int i = 0; i<controller.arrSelectedIndex.length; i++) {
                                if (index == i) {
                                  controller.arrSelectedIndex[i] = true;
                                  modelClientSelected = controller.arrModelClient[i];
                                } else {
                                  controller.arrSelectedIndex[i] = false;
                                }
                              }
                            },
                          )
                        ],
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
