

import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/ModelEstimate.dart';


class InvoicesController extends GetxController {

  RxList<ModelEstimate> arrInvoiceActive = <ModelEstimate>[].obs;
  RxList<ModelEstimate> arrInvoicePaid = <ModelEstimate>[].obs;

  RxInt intAppBar = 0.obs;

  RxList<String> invoice = [
    'Active',
    'Paid',
  ].obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      intAppBar.value = 0;
      readInvoice();
    });
  }

  readInvoice() async {
    try {
      final response = await API.instance.get(endPoint: 'readInvoice');
      print(response);

      if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
        final arrData = List<Map<String, dynamic>>.from(response['data']);

        arrInvoiceActive.clear();
        arrInvoicePaid.clear();

        for (Map<String, dynamic> map in arrData) {

          if (map['states'].toString().toLowerCase() == 'active') {
            arrInvoiceActive.add(ModelEstimate.fromJson(map));
          } else if (map['states'].toString().toLowerCase() == 'paid') {
            arrInvoicePaid.add(ModelEstimate.fromJson(map));
          }
        }
      } else {
        response!['message'].toString().showError();
      }
    } catch (error) {
      error.toString().showError();
    }
  }

}
