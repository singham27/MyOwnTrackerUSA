import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/ModeEditClient.dart';
import '../Utils/API.dart';

class EditClientController extends GetxController {


  Rx<TextEditingController> clientNameController = TextEditingController().obs;
  Rx<TextEditingController> emailAddressController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> homeNumberController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> addressSecController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> statePrivinceController = TextEditingController().obs;
  Rx<TextEditingController> zipPostelCodeController = TextEditingController().obs;
  Rx<TextEditingController> serviceAddressController = TextEditingController().obs;
  Rx<TextEditingController> serviceAddressSecController = TextEditingController().obs;
  Rx<TextEditingController> serviceCityController = TextEditingController().obs;
  Rx<TextEditingController> serviceStatePrivinceController = TextEditingController().obs;
  Rx<TextEditingController> serviceZipPostelCodeController = TextEditingController().obs;
  Rx<TextEditingController> addNotesController = TextEditingController().obs;

  reset() {
    Future.delayed(Duration(microseconds: 100),(){
      readClient();
    });


  }

  validation() {
    if (clientNameController.value.text.isEmpty) {
      'Enter client Name'.showError();
    }  else if (emailAddressController.value.text.isEmpty) {
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
      createClient();
    }
  }

  void createClient() async {
    Get.focusScope!.unfocus();
    final params =  {

      "name":  clientNameController.value.text,
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


    final response = await API.instance.post(endPoint: 'createClient',

        params: params

    );

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
      // Get.back();

    } else {
      response!['message'].toString().showError();
    }
  }

  void readClient() async {
    final response = await API.instance.get(
      endPoint: 'readClient',
    );

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Map<String, dynamic> data = Map<String, dynamic>.from(response['data']);

      Map<String, dynamic> basicInfo = Map<String, dynamic>.from(data['basicInfo']);
      Map<String, dynamic> billingInfo = Map<String, dynamic>.from(data['licence_Insurance']);
      Map<String, dynamic> serviceAddress = Map<String, dynamic>.from(data['website_SocialMedia']);

      final modelEditClient = ModelEditClient(
        name:       basicInfo['name'].toString(),
        email:   basicInfo['email'].toString(),
        mobileNumber:   basicInfo['mobileNumber'].toString(),
        homeNumber:   basicInfo['homeNumber'].toString(),
        billing_address_1:   billingInfo['billing_address_1'].toString(),
        billing_address_2:   basicInfo['billing_address_2'].toString(),
        billing_city:   basicInfo['billing_city'].toString(),
        billing_state_Province:   basicInfo['billing_state_Province'].toString(),
        billing_zip_Postal_Code:   basicInfo['billing_zip_Postal_Code'].toString(),

        service_address_1: serviceAddress['service_address_1'].toString(),
        service_address_2: serviceAddress['service_address_2'].toString(),
        service_city: serviceAddress['service_city'].toString(),
        service_state_Province: serviceAddress['service_state_Province'].toString(),
        service_zip_Postal_Code: serviceAddress['service_zip_Postal_Code'].toString(),
      );


      clientNameController.value.text = modelEditClient.name!;
      emailAddressController.value.text = modelEditClient.email!;
      mobileNumberController.value.text = modelEditClient.mobileNumber!;
      homeNumberController.value.text = modelEditClient.homeNumber!;
      addressController.value.text = modelEditClient.billing_address_1!;
      addressSecController.value.text = modelEditClient.billing_address_2!;
      // statePrivinceController.value.text = modelEditClient.state_Province!;
      // zipPostelCodeController.value.text = modelEditClient.zip_Postal_Code!;
      // bussinesController.value.text = modelEditClient.business!;


    } else {
      response!['message'].toString().showError();
    }
  }

}
