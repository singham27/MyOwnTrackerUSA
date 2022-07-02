import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/ModelClient.dart';
import '../Utils/API.dart';

class EditClientController extends GetxController {
  Rx<TextEditingController> clientNameController = TextEditingController().obs;
  Rx<TextEditingController> emailAddressController =
      TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> homeNumberController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> addressSecController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> statePrivinceController =
      TextEditingController().obs;
  Rx<TextEditingController> zipPostelCodeController =
      TextEditingController().obs;
  Rx<TextEditingController> serviceAddressController =
      TextEditingController().obs;
  Rx<TextEditingController> serviceAddressSecController =
      TextEditingController().obs;
  Rx<TextEditingController> serviceCityController = TextEditingController().obs;
  Rx<TextEditingController> serviceStatePrivinceController =
      TextEditingController().obs;
  Rx<TextEditingController> serviceZipPostelCodeController =
      TextEditingController().obs;
  Rx<TextEditingController> addNotesController = TextEditingController().obs;

  Rx<ModelClient> modelClient = ModelClient(
    name: ''
  ).obs;

  init() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (modelClient.value.name!.isNotEmpty) {
        setValue();
      }
    });
  }

  setValue() {
    clientNameController.value.text = modelClient.value.name.toString();
    emailAddressController.value.text =modelClient.value.email.toString();
    mobileNumberController.value.text = modelClient.value.mobileNumber.toString();
    homeNumberController.value.text = modelClient.value.homeNumber.toString();

    addressController.value.text = modelClient.value.billing_address_1.toString();
    addressSecController.value.text = modelClient.value.billing_address_2.toString();
    statePrivinceController.value.text = modelClient.value.billing_state_Province.toString();
    zipPostelCodeController.value.text = modelClient.value.billing_zip_Postal_Code.toString();
    cityController.value.text = modelClient.value.billing_city.toString();

    serviceAddressController.value.text = modelClient.value.service_address_1.toString();
    serviceAddressSecController.value.text = modelClient.value.service_address_2.toString();
    serviceCityController.value.text =  modelClient.value.service_city.toString();
    serviceStatePrivinceController.value.text = modelClient.value.service_state_Province.toString();
    serviceZipPostelCodeController.value.text = modelClient.value.service_state_Province.toString();
  }

  refresh() {
    modelClient.value = ModelClient(name: '');

    clientNameController.value.text = '';
    emailAddressController.value.text = '';
    mobileNumberController.value.text = '';
    homeNumberController.value.text = '';
    addressController.value.text = '';
    addressSecController.value.text = '';
    statePrivinceController.value.text = '';
    zipPostelCodeController.value.text = '';
    cityController.value.text = '';
    serviceAddressController.value.text = '';
    serviceAddressSecController.value.text = '';
    serviceCityController.value.text = '';
    serviceStatePrivinceController.value.text = '';
    serviceZipPostelCodeController.value.text = '';
  }

  validation() {
    if (clientNameController.value.text.isEmpty) {
      'Enter client Name'.showError();
    } else if (emailAddressController.value.text.isEmpty) {
      'Enter your email address '.showError();
    } else if (mobileNumberController.value.text.isEmpty) {
      'Enter your mobile number '.showError();
    } else if (homeNumberController.value.text.isEmpty) {
      'Enter your home number'.showError();
    } else if (addressController.value.text.isEmpty) {
      'Enter your billing address #1 '.showError();
    } else if (addressSecController.value.text.isEmpty) {
      'Enter your billing address #2'.showError();
    } else if (cityController.value.text.isEmpty) {
      'Enter your billing city '.showError();
    } else if (statePrivinceController.value.text.isEmpty) {
      'Enter your billing state/privince '.showError();
    } else if (zipPostelCodeController.value.text.isEmpty) {
      'Enter your billing zip postel code '.showError();
    } else if (serviceAddressController.value.text.isEmpty) {
      'Enter your service address #1'.showError();
    } else if (serviceAddressSecController.value.text.isEmpty) {
      'Enter your service address #2'.showError();
    } else if (serviceCityController.value.text.isEmpty) {
      'Enter your service city '.showError();
    } else if (serviceStatePrivinceController.value.text.isEmpty) {
      'Enter your service state/privince '.showError();
    } else if (serviceZipPostelCodeController.value.text.isEmpty) {
      'Enter your service zip postel code '.showError();
    } else if (addNotesController.value.text.isEmpty) {
      'Enter your add notes'.showError();
    } else {
      if (modelClient.value.name!.isEmpty) {
        createClient();
      } else {

      }
    }
  }

  void createClient() async {
    Get.focusScope!.unfocus();
    final params = {
      "name": clientNameController.value.text,
      "email": emailAddressController.value.text,
      "mobileNumber": mobileNumberController.value.text,
      "homeNumber": homeNumberController.value.text,
      "billing_address_1": addressController.value.text,
      "billing_address_2": addressSecController.value.text,
      "billing_state_Province": statePrivinceController.value.text,
      "billing_zip_Postal_Code": zipPostelCodeController.value.text,
      "billing_city": cityController.value.text,
      "service_address_1": serviceAddressController.value.text,
      "service_address_2": serviceAddressSecController.value.text,
      "service_city": serviceCityController.value.text,
      "service_state_Province": serviceStatePrivinceController.value.text,
      "service_zip_Postal_Code": serviceZipPostelCodeController.value.text,
    };

    final response =
        await API.instance.post(endPoint: 'createClient', params: params);

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Get.back();
      response['message'].toString().showSuccess();
      refresh();
    } else {
      response!['message'].toString().showError();
    }
  }
}
