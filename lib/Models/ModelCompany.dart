import 'package:flutter/material.dart';
class ModelCompany {
  String? logo;
  String? licenceDoc;
  String? insuranceDoc = '';

  String? name = '';
  String? phone_1 = '';
  String? phone_2 = '';
  String? email = '';
  String? address_1 = '';
  String? address_2 = '';
  String? city = '';
  String? state_Province = '';
  String? zip_Postal_Code = '';
  String? business = '';
  String? websiteURL = '';
  String? googleBusinessURL = '';
  String? facebookURL = '';
  String? InstagramURL = '';


  ModelCompany({
    this.logo,
    this.licenceDoc,
    this.insuranceDoc,

    this.name,
    this.phone_1,
    this.phone_2,
    this.email,
    this.address_1,
    this.address_2,
    this.city,
    this.state_Province,
    this.zip_Postal_Code,
    this.business,

    this.websiteURL,
    this.googleBusinessURL,
    this.facebookURL,
    this.InstagramURL,
  });
}