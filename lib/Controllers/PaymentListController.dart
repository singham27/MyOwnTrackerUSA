

import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/ModelPayment.dart';
import '../Models/ModelEstimate.dart';

class PaymentListController extends GetxController {
  ModelEstimate invoice = ModelEstimate();

  RxList<ModelPayment> arrModelPayment = <ModelPayment>[].obs;

  onInit() {
    Future.delayed(Duration(microseconds: 100), () {
      arrModelPayment.clear();
      listPayment();
    });
  }

  refresh() {
    invoice = ModelEstimate();
  }

  listPayment() async {
    final params = {
      'invoiceID': invoice.id.toString(),
    };

    final response = await API.instance.post(endPoint: 'listPayment', params: params);
    print(response);

    arrModelPayment.clear();
    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      final arrData = List<Map<String, dynamic>>.from(response['data']);

      for (Map<String, dynamic> map in arrData) {
        arrModelPayment.add(ModelPayment.toModel(map));
      }
    } else {
      response!['message'].toString().showError();
    }

    // refresh();
  }

}