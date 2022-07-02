import 'package:business_trackers/Controllers/EditClientController.dart';
import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Models/ModelClient.dart';
import '../Utils/API.dart';

class ClientsController extends GetxController {
  final controller = Get.put(EditClientController());
  RxBool testing = false.obs;
  RxList<ModelClient> arrModelClient = <ModelClient>[].obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      readClient();
    });
  }

  void readClient() async {
    final response = await API.instance.get(
      endPoint: 'readClient',
    );

    // debugPrint(response.toString());

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      List<Map<String, dynamic>> listData =
          List<Map<String, dynamic>>.from(response['data']);

      print(listData);


      arrModelClient.clear();

      for (Map mapData in listData) {
        Map<String, dynamic> basicInfo =
            Map<String, dynamic>.from(mapData['basicInfo']);
        Map<String, dynamic> billingInfo =
            Map<String, dynamic>.from(mapData['billingInfo']);
        Map<String, dynamic> serviceAddress =
            Map<String, dynamic>.from(mapData['serviceAddress']);

        print(basicInfo);
        print(billingInfo);
        print(serviceAddress);


        final modelClient = ModelClient(
          name: basicInfo['name'].toString(),
          email: basicInfo['email'].toString(),
          mobileNumber: basicInfo['mobileNumber'].toString(),
          homeNumber: basicInfo['homeNumber'].toString(),
          billing_address_1: billingInfo['billing_address_1'].toString(),
          billing_address_2: basicInfo['billing_address_2'].toString(),
          billing_city: basicInfo['billing_city'].toString(),
          billing_state_Province:
              basicInfo['billing_state_Province'].toString(),
          billing_zip_Postal_Code:
              basicInfo['billing_zip_Postal_Code'].toString(),
          service_address_1: serviceAddress['service_address_1'].toString(),
          service_address_2: serviceAddress['service_address_2'].toString(),
          service_city: serviceAddress['service_city'].toString(),
          service_state_Province:
              serviceAddress['service_state_Province'].toString(),
          service_zip_Postal_Code:
              serviceAddress['service_zip_Postal_Code'].toString(),
        );

        arrModelClient.add(modelClient);

        // break;
      }
    } else {
      response!['message'].toString().showError();
    }
  }

}
