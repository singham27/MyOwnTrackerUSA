

import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import '../Models/ModelEstimate.dart';


class EstimateController extends GetxController {
  RxInt intAppBar = 0.obs;

  RxList<ModelEstimate> arrEstimatePending = <ModelEstimate>[].obs;
  RxList<ModelEstimate> arrEstimateApproved = <ModelEstimate>[].obs;
  RxList<ModelEstimate> arrEstimateDeclined = <ModelEstimate>[].obs;

  RxList<String> estimate = [
    'Pending',
    'Approved',
    'Declined',
  ].obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      intAppBar.value = 0;
      readEstimate();
    });
  }

  readEstimate() async {
    try {
      final response = await API.instance.get(endPoint: 'readEstimate');

      if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
        final arrData = List<Map<String, dynamic>>.from(response['data']);

        arrEstimatePending.clear();
        arrEstimateApproved.clear();
        arrEstimateDeclined.clear();

        for (Map<String, dynamic> map in arrData) {
          if (map['states'].toString().toLowerCase() == 'pending') {
            arrEstimatePending.add(ModelEstimate.fromJson(map));
          } else if (map['states'].toString().toLowerCase() == 'approved') {
            arrEstimateApproved.add(ModelEstimate.fromJson(map));
          } else if (map['states'].toString().toLowerCase() == 'declined') {
            arrEstimateDeclined.add(ModelEstimate.fromJson(map));
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
