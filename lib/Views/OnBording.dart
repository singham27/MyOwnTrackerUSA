import 'dart:ui';

import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/CreateAnAccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class OnBording extends StatelessWidget {
   OnBording({Key? key}) : super(key: key);
  SwiperController _controller = SwiperController();
  int indexPage = 0;

  int totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.secondryColor,
      body: Swiper(

        autoplay: false,
        loop: false,
        itemCount: totalPages,
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(

            margin: EdgeInsets.only(bottom: 200,right: 300),
            builder: new DotSwiperPaginationBuilder(
              color: ColorStyle.grey,
              activeColor: ColorStyle.primaryColor,
            )),

        onIndexChanged: (index) {
          indexPage = index;
        },

        controller: _controller,
        itemBuilder: (BuildContext context, int index) {

          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 40,),
               Container(
                 padding: EdgeInsets.only(left: 20),
                 alignment: Alignment.centerLeft,
                 child:  Image.asset(
                     ImageStyle.Group19,
                     // width: 143,

                     height: 130
                 ),
               ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child:  Image.asset(
                      ImageStyle.Group20,
                      // width: 143,
                      height: 130
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                      ImageStyle.Group21,
                      // width: 143,
                      height: 130
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Invoices & Estimates',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style:  TextStylesProductSans.textStyles_24
                          .apply(color: ColorStyle.primaryColor,
                          fontWeightDelta: 2
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Made Simple',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style:  TextStylesProductSans.textStyles_24
                          .apply(color: ColorStyle.primaryColor, fontWeightDelta: 2)),
                ),
                SizedBox(height: 190,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child:  Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 178,
                        decoration: BoxDecoration(
                            // color: ColorStyle.primaryColor,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.black12)
                            ]),
                        child: Text(
                            'Skip',
                            textAlign: TextAlign.center,
                            // maxLines: 3,
                            style:  TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.primaryColor, fontWeightDelta: 2)),
                      ),
                      onTap: () {
                        indexPage = indexPage + 1;
                        if (indexPage == totalPages)
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => CreateAnAccount()),
                                (Route<dynamic> route) => false,
                          );
                        // Get.to(HomeScreen);
                        else
                          _controller.move(indexPage);
                      },

                    ),
                    SizedBox(width: 5,),
                    InkWell(
                      child:  Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 178,
                        decoration: BoxDecoration(
                            color: ColorStyle.primaryColor,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.black12)
                            ]),
                        child: Text(
                            'Next',
                            textAlign: TextAlign.center,
                            // maxLines: 3,
                            style:  TextStylesProductSans.textStyles_14
                                .apply(color: ColorStyle.secondryColor,
                              // fontWeightDelta: 2
                            )),
                      ),
                      onTap: () {
                        indexPage = indexPage + 1;
                        if (indexPage == totalPages)
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => CreateAnAccount()),
                                (Route<dynamic> route) => false,
                          );
                        // Get.to(HomeScreen);
                        else
                          _controller.move(indexPage);
                      },

                    )
                  ],
                ),



              ],
            )
          );
        },
      ),

    );
  }
}
