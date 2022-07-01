import 'package:business_trackers/Styles/ImageStyle.dart';
import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../Models/ModelCompany.dart';
import '../Utils/API.dart';

class MyCompanyController extends GetxController {
  Rx<File> photo = File('').obs;
  Rx<File> docLicence = File('').obs;
  Rx<File> docInsurance = File('').obs;


  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> phoneSecController = TextEditingController().obs;
  Rx<TextEditingController> companyAddressController = TextEditingController().obs;
  Rx<TextEditingController> companyAddressSecController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> statePrivinceController = TextEditingController().obs;
  Rx<TextEditingController> zipPostelCodeController = TextEditingController().obs;
  Rx<TextEditingController> bussinesController = TextEditingController().obs;
  Rx<TextEditingController> websiteUrlController = TextEditingController().obs;
  Rx<TextEditingController> googleBussinesController = TextEditingController().obs;
  Rx<TextEditingController> facebookUrlController = TextEditingController().obs;
  Rx<TextEditingController> instagramUrlController = TextEditingController().obs;





  reset() {
    Future.delayed(Duration(microseconds: 100),(){
      readCompany();
    });


  }

  validation() {
    if (companyNameController.value.text.isEmpty) {
      'Enter Company Name'.showError();
    }  else if (phoneController.value.text.isEmpty) {
      'Enter your phone # 1 '.showError();
    } else if (phoneSecController.value.text.isEmpty) {
      'Enter your phone # 2'.showError();
    } else if (companyAddressController.value.text.isEmpty) {
      'Enter your company address # 1 '.showError();
    } else if (companyAddressSecController.value.text.isEmpty) {
      'Enter your company address # 2 '.showError();
    } else if (cityController.value.text.isEmpty) {
      'Enter your city '.showError();
    } else if (statePrivinceController.value.text.isEmpty) {
      'Enter your state/privince'.showError();
    } else if (zipPostelCodeController.value.text.isEmpty) {
      'Enter your Zip Postel Code '.showError();
    } else if (bussinesController.value.text.isEmpty) {
      'Enter your bussines name'.showError();
    } else {
      createCompany();
    }
  }

  void createCompany() async {
    Get.focusScope!.unfocus();
    final params =  {

      'logo': ' ',
      'licenceDoc': ' ',
      'InsuranceDoc': ' ',

      'name': companyNameController.value.text,
      'phone_1': phoneController.value.text,
      'phone_2': phoneSecController.value.text,
      'address_1': companyAddressController.value.text,
      'address_2': companyAddressSecController.value.text,
      'city': cityController.value.text,
      'state_Province': statePrivinceController.value.text,
      'zip_Postal_Code': zipPostelCodeController.value.text,
      'business': bussinesController.value.text,

      'websiteURL':websiteUrlController.value.text,
      'googleBusinessURL': googleBussinesController.value.text,
      'facebookURL': facebookUrlController.value.text,
      'InstagramURL': instagramUrlController.value.text,
    };


    final response = await API.instance.post(endPoint: 'createCompany',

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

  void readCompany() async {
    final response = await API.instance.get(
      endPoint: 'readCompany',
    );

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Map<String, dynamic> data = Map<String, dynamic>.from(response['data']);

      Map<String, dynamic> basicInfo = Map<String, dynamic>.from(data['basicInfo']);
      Map<String, dynamic> licence_Insurance = Map<String, dynamic>.from(data['licence_Insurance']);
      Map<String, dynamic> website_SocialMedia = Map<String, dynamic>.from(data['website_SocialMedia']);

      final modelCompany = ModelCompany(
        name:       basicInfo['name'].toString(),
        phone_1:   basicInfo['phone_1'].toString(),
          phone_2:   basicInfo['phone_2'].toString(),
          address_1:   basicInfo['address_1'].toString(),
          address_2:   basicInfo['address_2'].toString(),
          city:   basicInfo['city'].toString(),
          state_Province:   basicInfo['state_Province'].toString(),
          zip_Postal_Code:   basicInfo['zip_Postal_Code'].toString(),
          business:   basicInfo['business'].toString(),

        licenceDoc: licence_Insurance['licenceDoc'].toString(),
          websiteURL: website_SocialMedia['websiteURL'].toString(),
        googleBusinessURL: website_SocialMedia['googleBusinessURL'].toString(),
        facebookURL: website_SocialMedia['facebookURL'].toString(),
        InstagramURL: website_SocialMedia['websiteURL'].toString(),
      );


      companyNameController.value.text = modelCompany.name!;
      phoneController.value.text = modelCompany.phone_1!;
      phoneSecController.value.text = modelCompany.phone_2!;
      companyAddressController.value.text = modelCompany.address_1!;
      companyAddressSecController.value.text = modelCompany.address_2!;
      cityController.value.text = modelCompany.city!;
      statePrivinceController.value.text = modelCompany.state_Province!;
      zipPostelCodeController.value.text = modelCompany.zip_Postal_Code!;
      bussinesController.value.text = modelCompany.business!;


    } else {
      response!['message'].toString().showError();
    }
  }

}

