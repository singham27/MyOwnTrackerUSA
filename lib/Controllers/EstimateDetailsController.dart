

import 'package:get/get.dart';
import '../Models/ModelEstimate.dart';
import '../Controllers/MyCompanyController.dart';


class EstimateDetailsController extends GetxController {
  RxInt estimateStatus = 0.obs;

  final controllerMyCompany = Get.put(MyCompanyController());

  RxList<String> arrSend = [
    'Signature',
    'Print',
    'payment',
    'SMS',
    'Email',
    'Share',
  ].obs;

  onInit() {
    Future.delayed(Duration(microseconds: 100), () {
      controllerMyCompany.readCompany();
    });
  }

  double taxCalcuation(List<Item> items) {
    double taxTotal = 0.0;

    for (int i=0;  i<items.length; i++) {
      taxTotal += double.parse(items[i].taxValue.toString());
    }

    return taxTotal;
  }

  String taxPriceCaluculation(ModelEstimate estimate) {
    final tax = taxCalcuation(estimate.items!);
    final taxPrice = (estimate.subTotal!*tax)/100;
    return taxPrice.toStringAsFixed(2);
  }

}
