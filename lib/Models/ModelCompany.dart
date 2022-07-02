import 'package:flutter/material.dart';

class ModelCompany {

  String? name = '';
  String? phone_1 = '';
  String? phone_2 = '';
  String? address_1 = '';
  String? address_2 = '';
  String? city = '';
  String? state_Province = '';
  String? zip_Postal_Code = '';
  String? business = '';
  String? licenceDoc = '';
  String? insuranceDoc = '';
  String? websiteURL = '';
  String? googleBusinessURL = '';
  String? facebookURL = '';
  String? InstagramURL = '';


  ModelCompany({
    this.name,
    this.phone_1,
    this.phone_2,
    this.address_1,
    this.address_2,
    this.city,
    this.state_Province,
    this.zip_Postal_Code,
    this.business,
    this.licenceDoc,
    this.insuranceDoc,
    this.websiteURL,
    this.googleBusinessURL,
    this.facebookURL,
    this.InstagramURL,
  });
}