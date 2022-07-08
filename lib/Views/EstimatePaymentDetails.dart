// import 'package:flutter/material.dart';
// import 'package:business_trackers/Components/ProgressBarCustom.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../Components/AppBarStyle.dart';
// import '../Components/ElevatedButtonCustom.dart';
// import '../Styles/ColorStyle.dart';
// import '../Styles/TextStyles.dart';
// import '../Views/PaymentAdd.dart';
//
// class EstimatePaymentDetails extends StatelessWidget {
//   const EstimatePaymentDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBarStyles(
//           overlayStyle: SystemUiOverlayStyle.dark,
//           title: 'Payments',
//           leading: BackButton(
//             color: ColorStyle.black,
//           ),
//         ),
//         backgroundColor: ColorStyle.primaryColor,
//         body: SingleChildScrollView(
//           padding: EdgeInsets.only(
//             left: 20,
//             right: 20,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Paid',
//                       textAlign: TextAlign.center,
//                       // maxLines: 3,
//                       style: TextStylesProductSans.textStyles_16.apply(
//                         color: ColorStyle.black,
//                       )),
//                   Text('Due \$224.00',
//                       textAlign: TextAlign.center,
//                       // maxLines: 3,
//                       style: TextStylesProductSans.textStyles_14.apply(
//                         color: ColorStyle.black,
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ProgressBarCustom(),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 child: ListView.builder(
//                   itemCount: 4,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   // scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, i) {
//                     return Container(
//                       margin: EdgeInsets.only(top: 15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('\$50.00',
//                               textAlign: TextAlign.center,
//                               // maxLines: 3,
//                               style: TextStylesProductSans.textStyles_16.apply(
//                                 color: ColorStyle.black,
//                               )),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text('Friday, 17 June • Cash',
//                               textAlign: TextAlign.center,
//                               // maxLines: 3,
//                               style: TextStylesProductSans.textStyles_16.apply(
//                                 color: ColorStyle.black,
//                               )),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             height: 1,
//                             color: ColorStyle.grey,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 90,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: ColorStyle.white)),
//                   ),
//                   Container(
//                     width: 90,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: ColorStyle.secondryColor,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: InkWell(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.add,
//                             color: ColorStyle.white,
//                           ),
//                           Text('Add',
//                               textAlign: TextAlign.center,
//                               style: TextStylesProductSans.textStyles_15.apply(
//                                 color: ColorStyle.white,
//                               )),
//                         ],
//                       ),
//                       onTap: () {
//                         Get.to(PaymentAdd());
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ));
//   }
// }
