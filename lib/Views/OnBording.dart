import 'dart:ui';

import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:business_trackers/Views/CreateAnAccount.dart';
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

				// control: SwiperControl(
				//   padding: EdgeInsets.only(left: 16, right: 16),
				//   // size: 50,
				//   color: Colors.red,
				//   disableColor: Colors.grey,
				//   iconPrevious: Icons.arrow_back_ios,
				//   iconNext: Icons.arrow_forward_ios,
				// ),

				controller: _controller,
				itemBuilder: (BuildContext context, int index) {
					// return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
					return Container(
							height: MediaQuery.of(context).size.height,
							width: MediaQuery.of(context).size.width,
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									SizedBox(height: 40,),

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
									SizedBox(height: 30,),
									Container(
										padding: EdgeInsets.only(left: 20),
										alignment: Alignment.centerLeft,
										child: Text(
												'Invoices & Estimates',
												// textAlign: TextAlign.center,
												// maxLines: 3,
												style:  TextStylesProductSans.textStyles_24
														.apply(color: ColorStyle.primaryColor, fontWeightDelta: 2)),
									),
									Container(
										padding: EdgeInsets.only(left: 20),
										alignment: Alignment.centerLeft,
										child:Text(
												'Made Simple',
												// textAlign: TextAlign.center,
												// maxLines: 3,
												style:  TextStylesProductSans.textStyles_24
														.apply(color: ColorStyle.primaryColor, fontWeightDelta: 2)),
									),
									SizedBox(height: 200,),




								],
							)
					);
				},
			),
			floatingActionButton: Container(
				// color: ColorStyle.grey,
					padding: EdgeInsets.only(left: 35,),

					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							InkWell(
								child: Container(
									alignment: Alignment.center,
									height: 50,
									width: MediaQuery.of(context).size.width-210,
									decoration: BoxDecoration(
											color: Colors.transparent,
											borderRadius: BorderRadius.circular(14),
											boxShadow: [
												BoxShadow(
														offset: Offset(0, 0),
														blurRadius: 3,
														spreadRadius: 3,
														color: Colors.black12)
											]),
									child:Text(
											'Skip',
											// textAlign: TextAlign.center,
											// maxLines: 3,
											style:  TextStylesProductSans.textStyles_14
													.apply(color: ColorStyle.primaryColor, )),
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
							InkWell(
								child: Container(
									alignment: Alignment.center,
									height: 50,
									width: MediaQuery.of(context).size.width-210,
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
									child:Text(
											'Next',
											// textAlign: TextAlign.center,
											// maxLines: 3,
											style:  TextStylesProductSans.textStyles_14
													.apply(color: ColorStyle.secondryColor, )),
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
						],)
			),
		);
	}
}