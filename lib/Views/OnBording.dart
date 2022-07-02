import 'dart:ui';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/SizeStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';


class OnBording extends StatelessWidget {
  OnBording({Key? key}) : super(key: key);
  SwiperController _controller = SwiperController();
  int indexPage = 0;

  // int totalPages = 3;

  final arrOnBoardingImage = [
    ImageStyle.onboarding_1,
    ImageStyle.onboarding_2,
    ImageStyle.onboarding_3,
  ];

  final arrOnBoardingTitle = [
    'Invoices & Estimates Made Simple',
    'Make a professional win more jobs',
    'Easy payment Built right in',
  ];

  final arrOnBoardingSubTitle = [
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.secondryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        child: Column(
          children: [
            Expanded(
                child: Swiper(
                  autoplay: false,
                  loop: false,
                  itemCount: arrOnBoardingImage.length,
                  scrollDirection: Axis.horizontal,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        left: 20,
                        bottom: 40,
                        // right: 270,
                      ),
                      builder: new DotSwiperPaginationBuilder(
                        color: ColorStyle.grey,
                        activeColor: ColorStyle.primaryColor,
                      )),

                  onIndexChanged: (index) {
                    indexPage = index;
                  },

                  // control: SwiperControl(
                  //   padding: EdgeInsets.only(left: 16, right: 16),
                  //   // size: 50,
                  //   color: Colors.red,
                  //   disableColor: Colors.grey,
                  //   iconPrevious: Icons.arrow_back_ios,
                  //   iconNext: Icons.arrow_forward_ios,
                  // ),

                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              arrOnBoardingImage[index],
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width - 60,
                              height: MediaQuery.of(context).size.width - 60,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              arrOnBoardingTitle[index],
                              style: TextStylesProductSans.textStyles_24.apply(
                                  color: ColorStyle.primaryColor,
                                  fontWeightDelta: 2)),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                              arrOnBoardingSubTitle[index],
                              maxLines: 3,
                              style: TextStylesProductSans.textStyles_16.apply(
                                color: ColorStyle.primaryColor,
                              ))
                        ],
                      ),
                    );
                  },
                )),
            Container(
              height: 54,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text('Skip',
                              style: TextStylesProductSans.textStyles_14.apply(
                                color: ColorStyle.primaryColor,
                              )),
                        ),
                        onTap: () {
                          Get.offAll(Login());
                        },
                      )),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
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
                        child: Text('Next',
                            style: TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.secondryColor,
                            )),
                      ),
                      onTap: () {
                        indexPage = indexPage + 1;
                        if (indexPage == arrOnBoardingImage.length)
                          Get.offAll(Login());
                        else
                          _controller.move(indexPage);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

