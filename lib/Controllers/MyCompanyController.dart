

import 'package:business_trackers/Utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../Models/ModelCompany.dart';
import '../Utils/API.dart';

class MyCompanyController extends GetxController {
  Rx<File> photo = File('').obs;
  Rx<File> docLicence = File('').obs;
  Rx<File> docInsurance = File('').obs;

  RxString logoURL = ''.obs;
  RxString docLicenceURL = ''.obs;
  RxString docInsuranceURL = ''.obs;

  RxString nameOutSide = ''.obs;
  RxString emailOutSide = ''.obs;

  Rx<TextEditingController> companyNameController = TextEditingController().obs;
  Rx<TextEditingController> companyEmailController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> phoneSecondController = TextEditingController().obs;
  Rx<TextEditingController> companyAddressController =
      TextEditingController().obs;
  Rx<TextEditingController> companyAddressSecondController =
      TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> postalCodeController = TextEditingController().obs;
  Rx<TextEditingController> businessController = TextEditingController().obs;

  Rx<TextEditingController> websiteURLController = TextEditingController().obs;
  Rx<TextEditingController> googleBusinessURLController =
      TextEditingController().obs;
  Rx<TextEditingController> facebookURLController = TextEditingController().obs;
  Rx<TextEditingController> InstagramURLController =
      TextEditingController().obs;

  reset() {
    Future.delayed(Duration(microseconds: 100), () {
      refresh();
      readCompany();
    });
  }

  refresh() {
    photo.value = File('');
    docLicence.value = File('');
    docInsurance.value = File('');

    logoURL.value = '';
    docLicenceURL.value = '';
    docInsuranceURL.value = '';

    companyNameController.value.text = '';
    companyEmailController.value.text = '';
    phoneController.value.text = '';
    phoneSecondController.value.text = '';
    companyAddressController.value.text = '';
    companyAddressSecondController.value.text = '';
    cityController.value.text = '';
    stateController.value.text = '';
    postalCodeController.value.text = '';
    businessController.value.text = '';
    websiteURLController.value.text = '';
    googleBusinessURLController.value.text = '';
    facebookURLController.value.text = '';
    InstagramURLController.value.text = '';

    nameOutSide.value = '';
    emailOutSide.value = '';
  }

  validation() {
    if (companyNameController.value.text.isEmpty) {
      'Enter your company name'.showError();
    } if (companyEmailController.value.text.isEmpty) {
      'Enter your company e-mail Id'.showError();
    } else if (!GetUtils.isEmail(companyEmailController.value.text)) {
      'Enter a valid e-mail Id'.showError();
    } else if (phoneController.value.text.isEmpty) {
      'Enter  phone'.showError();
    } else if (phoneSecondController.value.text.isEmpty) {
      'Enter  phone #2'.showError();
    } else if (companyAddressController.value.text.isEmpty) {
      'Enter  company address #1'.showError();
    } else if (companyAddressSecondController.value.text.isEmpty) {
      'Enter  company address #2'.showError();
    } else if (cityController.value.text.isEmpty) {
      'Enter  city'.showError();
    } else if (stateController.value.text.isEmpty) {
      'Enter  state'.showError();
    } else if (postalCodeController.value.text.isEmpty) {
      'Enter  zip/postal code'.showError();
    } else if (businessController.value.text.isEmpty) {
      'Enter  business'.showError();
    } else {
      createCompany();
    }
  }

  uploadImage(File file, int fileCount) async {
    Get.focusScope!.unfocus();

    final response = await API.instance.postImage(endPoint: 'uploadImage', params: {}, fileParams: 'image', file: file);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      debugPrint(response['data'].toString());
      if (fileCount == 1) {
        logoURL.value = response['data'].toString();
      } else if (fileCount == 2) {
        docLicenceURL.value = response['data'].toString();
      } else if (fileCount == 3) {
        docInsuranceURL.value = response['data'].toString();
      }
    } else {
      response!['message'].toString().showError();
    }
  }

  void createCompany() async {
    Get.focusScope!.unfocus();
    final params = {
      'logo': logoURL.value,
      'licenceDoc': docLicenceURL.value,
      'insuranceDoc': docInsuranceURL.value,

      'name': companyNameController.value.text,
      'email': companyEmailController.value.text,
      'phone_1': phoneController.value.text,
      'phone_2': phoneSecondController.value.text,
      'address_1': companyAddressController.value.text,
      'address_2': companyAddressSecondController.value.text,
      'city': cityController.value.text,
      'state_Province': stateController.value.text,
      'zip_Postal_Code': postalCodeController.value.text,
      'business': businessController.value.text,

      'websiteURL': websiteURLController.value.text,
      'googleBusinessURL': googleBusinessURLController.value.text,
      'facebookURL': facebookURLController.value.text,
      'InstagramURL': InstagramURLController.value.text,
    };

    debugPrint(params.toString());

    final response = await API.instance.post(endPoint: 'createCompany', params: params);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

  void readCompany() async {
    final response = await API.instance.get(endPoint: 'readCompany');
    debugPrint(response.toString());
    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Map<String, dynamic> data = Map<String, dynamic>.from(response['data']);

      Map<String, dynamic> basicInfo =
          Map<String, dynamic>.from(data['basicInfo']);
      Map<String, dynamic> licence_Insurance =
          Map<String, dynamic>.from(data['licence_Insurance']);
      Map<String, dynamic> website_SocialMedia =
          Map<String, dynamic>.from(data['website_SocialMedia']);

      final modelCompany = ModelCompany(
        logo: basicInfo['logo'].toString(),
        licenceDoc: licence_Insurance['licenceDoc'].toString(),
        insuranceDoc: licence_Insurance['insuranceDoc'].toString(),

        name: basicInfo['name'].toString(),
        email: basicInfo['email'].toString(),

        phone_1: basicInfo['phone_1'].toString(),
        phone_2: basicInfo['phone_2'].toString(),

        address_1: basicInfo['address_1'].toString(),
        address_2: basicInfo['address_2'].toString(),
        city: basicInfo['city'].toString(),
        state_Province: basicInfo['state_Province'].toString(),
        zip_Postal_Code: basicInfo['zip_Postal_Code'].toString(),
        business: basicInfo['business'].toString(),

        websiteURL: website_SocialMedia['websiteURL'].toString(),
        googleBusinessURL: website_SocialMedia['googleBusinessURL'].toString(),
        facebookURL: website_SocialMedia['facebookURL'].toString(),
        InstagramURL: website_SocialMedia['InstagramURL'].toString(),
      );

      companyNameController.value.text = modelCompany.name!;
      companyEmailController.value.text = modelCompany.email!;
      phoneController.value.text = modelCompany.phone_1!;
      phoneSecondController.value.text = modelCompany.phone_2!;
      companyAddressController.value.text = modelCompany.address_1!;
      companyAddressSecondController.value.text = modelCompany.address_2!;
      cityController.value.text = modelCompany.city!;
      stateController.value.text = modelCompany.state_Province!;
      postalCodeController.value.text = modelCompany.zip_Postal_Code!;
      businessController.value.text = modelCompany.business!;

      websiteURLController.value.text = modelCompany.websiteURL!;
      googleBusinessURLController.value.text = modelCompany.googleBusinessURL!;
      facebookURLController.value.text = modelCompany.facebookURL!;
      InstagramURLController.value.text = modelCompany.InstagramURL!;

      logoURL.value = modelCompany.logo!;
      docLicenceURL.value = modelCompany.licenceDoc!;
      docInsuranceURL.value = modelCompany.insuranceDoc!;

      nameOutSide.value = modelCompany.name!;
      emailOutSide.value = modelCompany.email!;
    } else {
      response!['message'].toString().showError();
    }
  }
}
