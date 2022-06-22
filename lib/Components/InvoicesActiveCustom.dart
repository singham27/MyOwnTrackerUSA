import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/InvoicesActiveController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

class InvoicesActiveCustom extends StatelessWidget {
   InvoicesActiveCustom({Key? key}) : super(key: key);

  final controller = Get.put(InvoicesActiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.primaryColor,
      body: ListView.builder(
          itemCount: controller.active.length,
          padding: EdgeInsets.only(bottom: 16),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(left:10,top: 15,bottom: 15),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                              'John Deo',
                              style:  TextStylesProductSans.textStyles_16
                                  .apply(color: ColorStyle.black,)),
                          SizedBox(
                            width: 147,),
                          Text(
                              '\$100.00',
                              style:  TextStylesProductSans.textStyles_16
                                  .apply(color: ColorStyle.black,)),
                        ],
                      ),
                      SizedBox(
                        height: 10,),
                      Row(
                        children: [
                          Text(
                              'June 12 • #12345',
                              style:  TextStylesProductSans.textStyles_16
                                  .apply(color: ColorStyle.black,)),
                          SizedBox(
                            width: 50,),
                          Container(
                            child: Row(
                              children: [
                                InkWell(child:Image.asset(ImageStyle.Path475,height: 20,),onTap: (){},),
                                SizedBox(
                                  width: 15,),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                                    alignment: Alignment.center,
                                    child: Text(
                                        controller.active[index],
                                        style:  TextStylesProductSans.textStyles_12
                                            .apply(color: (controller.intAppBar.value == index)
                                            ? ColorStyle.white
                                            : ColorStyle.white, )
                                    ),
                                    decoration: BoxDecoration(
                                        color: ColorStyle.grays,
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                  ),
                                  onTap: (){},)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: ColorStyle.blue,
                  borderRadius: BorderRadius.circular(20)
              ),
            );

          }),
    );
  }
}
