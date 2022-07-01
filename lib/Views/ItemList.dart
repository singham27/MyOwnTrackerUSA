import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Controllers/ItemListController.dart';
import 'package:business_trackers/Controllers/EditItemController.dart';
import 'package:business_trackers/Models/ModelItemList.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/EditItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Styles/ImageStyle.dart';

class ItemList extends StatelessWidget {
   ItemList({Key? key}) : super(key: key);

   final controller = Get.put(ItemListController());
   final controllerEditItem = Get.put(EditItemController());

   delete() {
     Widget cancelButton = TextButton(
       child: Text(
         'Delete',
         style: TextStylesProductSans.textStyles_16.apply(
             fontWeightDelta: 0
         ),
       ),
       onPressed: () {
         Get.back();
         controller.deleteList();
       },
     );
     Widget continueButton = TextButton(
       child: Text(
         'Cancel',
         style: TextStylesProductSans.textStyles_16.apply(
             fontWeightDelta: 0
         ),
       ),
       onPressed: () {
         Get.back();
       },
     );

     AlertDialog alert = AlertDialog(
       title: Text(
         'Are you sure?',
         style: TextStylesProductSans.textStyles_16.apply(
             color: Colors.red,
             fontWeightDelta: 0
         ),
       ),
       content: Text(
         'Do you want to delete ?',
         style: TextStylesProductSans.textStyles_16.apply(
             fontWeightDelta: 0
         ),
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
        ),
        floatingActionButton: ElevatedButtonCustom(
          width: 160,
          height: 50,
          text: "+ Add Item",
          colorBG: ColorStyle.secondryColor,
          colorText: ColorStyle.white,
          onTap: () {
            controllerEditItem.modelItemList.value = ModelItemList();
            Get.to(EditItem(title: 'Add Item',));
          },
        ),
        body:  GetBuilder(
          init: ItemListController(),
          initState: (state) {
            controller.reset();
          },
          builder: (auth) {
            return Obx(() =>   Column(
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
                              border: InputBorder.none, hintText: 'Search Item'),
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
                          left: 20,
                          right: 20,
                          top: 16,
                          bottom: 80
                      ),
                      shrinkWrap: true,
                      itemCount: controller.arrModelItemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 16),
                            alignment: Alignment.center,
                            // height: 2,
                            // width: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        controller.arrModelItemList[index].name.toString(),
                                        style: TextStylesProductSans.textStyles_16
                                            .apply(
                                            color: ColorStyle.black,
                                            fontWeightDelta: 0)),
                                    Text(
                                        '\$'+controller.arrModelItemList[index].valueAmount.toString(),
                                        style: TextStylesProductSans.textStyles_16
                                            .apply(
                                            color: ColorStyle.black,
                                            fontWeightDelta: 0)),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          controller.arrModelItemList[index].description.toString(),
                                          style: TextStylesProductSans.textStyles_16
                                              .apply(
                                              color: ColorStyle.black,
                                              fontWeightDelta: 0)),
                                    ),
                                    IconButton(
                                      icon: Image.asset(
                                        ImageStyle.delete,
                                        height: 50,
                                      ),
                                      splashColor: Colors.red,
                                      onPressed: () {
                                        controller.itemID.value = controller.arrModelItemList[index].id!;
                                        delete();
                                      },
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: ColorStyle.blue,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onTap: () {
                            controllerEditItem.modelItemList.value = controller.arrModelItemList[index];
                            Get.to(EditItem(title: 'Edit Item',));
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
