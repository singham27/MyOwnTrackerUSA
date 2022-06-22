import 'package:business_trackers/Components/AppBarStyle.dart';
import 'package:business_trackers/Components/ElevatedButtonCustom.dart';
import 'package:business_trackers/Styles/ColorStyle.dart';
import 'package:business_trackers/Styles/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LiveChat extends StatelessWidget {
  const LiveChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyless(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Live Chat',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 231,
                      height: 88,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 14),
                      child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et do.',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_10.apply(
                              color: ColorStyle.black, fontWeightDelta: 0)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorStyle.hex('#F6F5F9')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Mon, 12 Jun',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_10
                            .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 231,
                      height: 88,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 14),
                      child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et do.',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_10.apply(
                              color: ColorStyle.white, fontWeightDelta: 0)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorStyle.secondryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Mon, 12 Jun',
                        // controller.estimate1[index],
                        style: TextStylesProductSans.textStyles_10
                            .apply(color: ColorStyle.grey, fontWeightDelta: 0)),
                  ],
                ),
              ),
              SizedBox(
                height: 350,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write your message..'),
                      ),
                    ),
                    InkWell(
                      child: Text('Send',
                          // controller.estimate1[index],
                          style: TextStylesProductSans.textStyles_14.apply(
                              color: ColorStyle.grey, fontWeightDelta: 0)),
                      onTap: () {},
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorStyle.grey),
                    borderRadius: BorderRadius.circular(12)),
              )
            ],
          ),
        ));
  }
}
