import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/ItemListController.dart';
import 'package:business_trackers/Controllers/EditItemController.dart';
import 'package:business_trackers/Models/ModelItem.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Styles/ImageStyle.dart';

class ItemList extends StatelessWidget {
  bool isFromEstimate;
  ItemList({Key? key, this.isFromEstimate = false}) : super(key: key);

  final controller = Get.put(ItemListController());
  final controllerEditItem = Get.put(EditItemController());

  List<ModelItem> arrSelectedItems = [];

  delete() {
    Widget cancelButton = TextButton(
      child: Text(
        'Delete',
        style: TextStylesProductSans.textStyles_16.apply(fontWeightDelta: 0),
      ),
      onPressed: () {
        Get.back();
        controller.deleteList();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        'Cancel',
        style: TextStylesProductSans.textStyles_16.apply(fontWeightDelta: 0),
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
        'Do you want to delete ?',
        style: TextStylesProductSans.textStyles_16.apply(fontWeightDelta: 0),
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
      backgroundColor: ColorStyle.primaryColor,
      appBar: AppBarStyless(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Item List',
        leading: BackButton(
          color: ColorStyle.black,
        ),
        trailings: [
          Row(
            children: [
              if (isFromEstimate)
                IconButton(
                  icon: Icon(
                    Icons.check_circle_sharp,
                    color: ColorStyle.secondryColor,
                    size: 30,
                  ),
                  onPressed: () {

                    arrSelectedItems.clear();
                    for (int i = 0; i<controller.arrSelectedItem.length; i++) {
                      if (controller.arrSelectedItem[i]) {
                        arrSelectedItems.add(controller.arrModelItemList[i]);
                      }
                    }

                    Get.back(result: arrSelectedItems);
                  },
                ),
            ],
          )
        ],
      ),
      floatingActionButton: ElevatedButtonCustom(
        width: 160,
        height: 50,
        text: "+ Add Item",
        colorBG: ColorStyle.secondryColor,
        colorText: ColorStyle.white,
        onTap: () {
          controllerEditItem.modelItemList.value = ModelItem();
          Get.to(EditItem(
            title: 'Add Item',
          ));
        },
      ),
      body: GetBuilder(
        init: ItemListController(),
        initState: (state) {
          if (isFromEstimate) {
            if (controller.arrSelectedItem.length == 0) {
              controller.reset();
            }
          } else {
            controller.reset();
          }
        },
        builder: (auth) {
          return Obx(() => Column(
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
                                border: InputBorder.none,
                                hintText: 'Search Item'),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorStyle.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 16, bottom: 80),
                        shrinkWrap: true,
                        itemCount: controller.arrSelectedItem.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 16,);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(
                              padding: EdgeInsets.only(
                                // left: 16,
                                right: 16,
                                top: 10,
                                bottom: 10,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: ColorStyle.blue,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (isFromEstimate)
                                    InkWell(
                                      child: Container(
                                        child: Icon(
                                          Icons.check_circle_sharp,
                                          color: controller.arrSelectedItem[index] ? ColorStyle.secondryColor : ColorStyle.grey.withOpacity(0.6),
                                          size: 28,
                                        ),
                                        padding: EdgeInsets.only(
                                          left: 6,
                                          right: 10,
                                          bottom: 6
                                        ),
                                      ),
                                      onTap: () {

                                        for (int i = 0; i <controller.arrSelectedItem.length; i++) {
                                         if (index == i) {
                                           controller.arrSelectedItem[i] = !controller.arrSelectedItem[i];
                                         }
                                        }
                                      },
                                    )
                                  else
                                    SizedBox(width: 16,),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          controller
                                              .arrModelItemList[index].name
                                              .toString(),
                                          style: TextStylesProductSans
                                              .textStyles_16
                                              .apply(
                                                  color: ColorStyle.black,
                                                  fontWeightDelta: 0)),
                                      SizedBox(height: 6),
                                      Text(
                                          controller.arrModelItemList[index]
                                              .description
                                              .toString(),
                                          style: TextStylesProductSans
                                              .textStyles_16
                                              .apply(
                                                  color: ColorStyle.black,
                                                  fontWeightDelta: 0)),
                                    ],
                                  )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '\$' +
                                              controller.arrModelItemList[index]
                                                  .valueAmount
                                                  .toString(),
                                          style: TextStylesProductSans
                                              .textStyles_15
                                              .apply(
                                                  color: ColorStyle.black,
                                                  fontWeightDelta: 0)),
                                      Row(
                                        children: [
                                          InkWell(
                                            splashColor: Colors.red,
                                            child: Image.asset(
                                              ImageStyle.editIcon,
                                              height: 22,
                                              width: 22,
                                            ),
                                            onTap: () {
                                              controllerEditItem
                                                      .modelItemList.value =
                                                  controller
                                                      .arrModelItemList[index];
                                              Get.to(EditItem(
                                                title: 'Edit Item',
                                              ));
                                            },
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            splashColor: Colors.red,
                                            child: Image.asset(
                                              ImageStyle.delete,
                                              height: 36,
                                            ),
                                            onTap: () {
                                              controller.itemID.value =
                                                  controller
                                                      .arrModelItemList[index]
                                                      .id!;
                                              delete();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {

                            },
                          );
                        }),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
