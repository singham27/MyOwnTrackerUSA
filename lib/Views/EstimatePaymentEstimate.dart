import 'package:business_trackers/Components/ProgressBar.dart';
import 'package:business_trackers/Controllers/EstimatePaymentEstimateController.dart';
import 'package:business_trackers/Views/EstimatePaymentDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Components/ElevatedButtonCustom.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';



class EstimatePaymentEstimate extends StatelessWidget {
   EstimatePaymentEstimate({Key? key}) : super(key: key);

  final controller = Get.put(EstimatePaymentEstimateController());
   RxInt intAppBar = 0.obs;

   buttons(String text, Function() onTap) {
     return InkWell(
       child: Container(
         child: Text(
             text,
             textAlign: TextAlign.center,
             // maxLines: 3,
             style:  TextStylesProductSans.textStyles_14
                 .apply(color: ColorStyle.black)
         ),
         padding: EdgeInsets.only(
             left: 25, right: 25,
             top: 10, bottom: 10
         ),
         decoration: BoxDecoration(
           // color: ColorStyle.primaryColor,
             borderRadius: BorderRadius.circular(10),
             border: Border.all(
                 color:ColorStyle.black

             )
         ),
       ),
       onTap: (){

       },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyles(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Payments',
          leading: BackButton(
            color: ColorStyle.black,
          ),
        ),
        backgroundColor: ColorStyle.primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Paid',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style:  TextStylesProductSans.textStyles_16
                          .apply(color: ColorStyle.black, )),
                  Text(
                      'Due \$224.00',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style:  TextStylesProductSans.textStyles_14
                          .apply(color: ColorStyle.black, )

                  ),
                ],
              ),
              SizedBox(height: 20,),
              ProgressBar(),
              SizedBox(height: 15,),
              Text(
                  'Payment',
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black, )),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 100,
                      alignment: Alignment.center,
                      child:TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "0.00",
                        ),
                      )
                  ),
                  Container(
          height: 70,
          child:  ListView.builder(
            itemCount: controller.payment.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return InkWell(
                child:  Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 60,
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      child:Text(
                          controller.payment[i],
                          textAlign: TextAlign.center,
                          style:  TextStylesProductSans.textStyles_16
                              .apply(color: (controller.intAppBar.value == i) ? ColorStyle.white :  ColorStyle.black)),
                      decoration: BoxDecoration(
                          color: (controller.intAppBar.value == i) ? ColorStyle.secondryColor :  Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: (controller.intAppBar.value == i) ? Colors.transparent :  Colors.grey
                          )
                      ),
                    ),
                  ],
                ),
                  onTap:  () {
                  controller.intAppBar.value = i;
                  },
              );
            },
          ),
        ),

                ],
              ),
              SizedBox(height: 26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      ' Payment Date',
                      textAlign: TextAlign.center,
                      style:  TextStylesProductSans.textStyles_15
                          .apply(color: ColorStyle.black, )),
                  Text(
                      'Friday, 17 June 2022',
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      style:  TextStylesProductSans.textStyles_13
                          .apply(color: ColorStyle.grey, )),
                ],
              ),
              SizedBox(height: 19,),
              Container(
                height: 1,
                color: ColorStyle.grey,
              ),
              SizedBox(height: 25,),
              Text(
                  'Payment Method',
                  style:  TextStylesProductSans.textStyles_16
                      .apply(color: ColorStyle.black,

                  )),
              SizedBox(height: 20,),
              Wrap(
                  runSpacing: 20,
                  spacing: 12.0,
                  children: <Widget>[
                  buttons('Cash', () => {
              }),

                    buttons('Check', () => {
                    }),
                    buttons('Credit', () => {
                    }),
                    buttons('Bank Transfer', () => {
                    }),


          ]
              ),




              SizedBox(height: 150,),
              ElevatedButtonCustom(
                text: "Save",
                colorBG:ColorStyle.secondryColor,
                colorText: ColorStyle.primaryColor,
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  Get.to(EstimatePaymentDetails());
                },
              ),
              SizedBox(height: 20,),


            ],
          ),
        )
    );
  }
}
