// import 'package:flutter/material.dart';
// class AboutUs extends StatelessWidget {
//   const AboutUs({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBarStyless(
//           overlayStyle: SystemUiOverlayStyle.dark,
//           title: 'About',
//           leading: BackButton(
//             color: ColorStyle.black,
//           ),
//
//         ),
//         backgroundColor: ColorStyle.primaryColor,
//         body: SingleChildScrollView(
//           padding: EdgeInsets.only(left: 20,right: 20,),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 // alignment: Alignment.center,
//                 height: MediaQuery.of(context).size.height,
//                 // color: ColorStyle.blue,
//                 child: ListView.builder(
//                   // padding: EdgeInsets.only(bottom: 16),
//                     shrinkWrap: true,
//                     itemCount: controller.moreItem.length,
//                     // scrollDirection: Axis.horizontal,
//                     physics: BouncingScrollPhysics(),
//                     itemBuilder: (BuildContext context, int index) {
//
//
//                       return  InkWell(
//                         child:  Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 30,),
//                             Text(
//                               // 'www.abcd.com',
//                                 controller.moreItem[index],
//                                 style:  TextStylesProductSans.textStyles_16
//                                     .apply(color: ColorStyle.black, fontWeightDelta: 0)),
//                             SizedBox(height: 12,),
//                             Container(
//                               height: 1,
//                               // width: MediaQuery.of(context).size.width-90,
//                               alignment: Alignment.center,
//
//                               decoration: BoxDecoration(
//                                   color: ColorStyle.grey,
//                                   borderRadius: BorderRadius.circular(8)
//                               ),
//                             ),
//                           ],
//                         ),
//                         onTap: (){},
//                       );
//
//                     }),
//               ),
//
//
//             ],
//           ),
//         )
//     );
//   }
// }
