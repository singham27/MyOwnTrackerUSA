// To parse this JSON data, do
//
//     final modelEstimate = modelEstimateFromJson(jsonString);

import 'dart:convert';

List<ModelEstimate> modelEstimateFromJson(String str) => List<ModelEstimate>.from(json.decode(str).map((x) => ModelEstimate.fromJson(x)));

String modelEstimateToJson(List<ModelEstimate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelEstimate {
  ModelEstimate({
    this.client,
    this.items,
    this.subTotal,
    this.tax,
    this.amountTotal,
    this.paymentSchedule,
    this.notes,
    this.contract,
    this.estimateDocId,
    this.date,
    this.po,
    this.states,
    this.id,
    this.createdTime,
  });

  Client? client;
  List<Item>? items;
  int? subTotal;
  int? tax;
  double? amountTotal;
  PaymentSchedule? paymentSchedule;
  String? notes;
  Contract? contract;
  String? estimateDocId;
  String? date;
  String? po;
  String? states;
  String? id;
  String? createdTime;

  factory ModelEstimate.fromJson(Map<String, dynamic> json) => ModelEstimate(
    client: Client.fromJson(json["client"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    subTotal: json["subTotal"],
    tax: json["tax"],
    amountTotal: json["amountTotal"].toDouble(),
    paymentSchedule: PaymentSchedule.fromJson(json["paymentSchedule"]),
    notes: json["notes"],
    contract: Contract.fromJson(json["contract"]),
    estimateDocId: json["estimateDocID"],
    date: json["date"],
    po: json["po"],
    states: json["states"],
    id: json["_id"],
    createdTime: json["createdTime"],
  );

  Map<String, dynamic> toJson() => {
    "client": client!.toJson(),
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "subTotal": subTotal,
    "tax": tax,
    "amountTotal": amountTotal,
    "paymentSchedule": paymentSchedule!.toJson(),
    "notes": notes,
    "contract": contract!.toJson(),
    "estimateDocID": estimateDocId,
    "date": date,
    "po": po,
    "states": states,
    "_id": id,
    'createdTime': createdTime,
  };
}

class Client {
  Client({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.homeNumber,
    this.billingAddress1,
    this.billingAddress2,
    this.billingCity,
    this.billingStateProvince,
    this.billingZipPostalCode,
    this.serviceAddress1,
    this.serviceAddress2,
    this.serviceCity,
    this.serviceStateProvince,
    this.serviceZipPostalCode,
  });

  String? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? homeNumber;
  String? billingAddress1;
  String? billingAddress2;
  String? billingCity;
  String? billingStateProvince;
  String? billingZipPostalCode;
  String? serviceAddress1;
  String? serviceAddress2;
  String? serviceCity;
  String? serviceStateProvince;
  String? serviceZipPostalCode;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    homeNumber: json["homeNumber"],
    billingAddress1: json["billing_address_1"],
    billingAddress2: json["billing_address_2"],
    billingCity: json["billing_city"],
    billingStateProvince: json["billing_state_Province"],
    billingZipPostalCode: json["billing_zip_Postal_Code"],
    serviceAddress1: json["service_address_1"],
    serviceAddress2: json["service_address_2"],
    serviceCity: json["service_city"],
    serviceStateProvince: json["service_state_Province"],
    serviceZipPostalCode: json["service_zip_Postal_Code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobileNumber": mobileNumber,
    "homeNumber": homeNumber,
    "billing_address_1": billingAddress1,
    "billing_address_2": billingAddress2,
    "billing_city": billingCity,
    "billing_state_Province": billingStateProvince,
    "billing_zip_Postal_Code": billingZipPostalCode,
    "service_address_1": serviceAddress1,
    "service_address_2": serviceAddress2,
    "service_city": serviceCity,
    "service_state_Province": serviceStateProvince,
    "service_zip_Postal_Code": serviceZipPostalCode,
  };
}

class Contract {
  Contract({
    this.name,
    this.days,
  });

  String? name;
  String? days;

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
    name: json["name"],
    days: json["days"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "days": days,
  };
}

class Item {
  Item({
    this.id,
    this.name,
    this.quantity,
    this.rate,
    this.taxName,
    this.taxValue,
    this.description,
    this.createdTime,
    this.valueAmount,
  });

  String? id;
  String? name;
  String? quantity;
  String? rate;
  String? taxName;
  String? taxValue;
  String? description;
  String? createdTime;
  String? valueAmount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    quantity: json["quantity"],
    rate: json["rate"],
    taxName: json["taxName"],
    taxValue: json["taxValue"],
    description: json["description"],
    createdTime: json["createdTime"],
    valueAmount: json["valueAmount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
    "rate": rate,
    "taxName": taxName,
    "taxValue": taxValue,
    "description": description,
    "createdTime": createdTime,
    "valueAmount": valueAmount,
  };
}

class PaymentSchedule {
  PaymentSchedule({
    this.paymentType,
    this.paymentList,
  });

  String? paymentType;
  List<PaymentList>? paymentList;

  factory PaymentSchedule.fromJson(Map<String, dynamic> json) => PaymentSchedule(
    paymentType: json["payment_Type"],
    paymentList: List<PaymentList>.from(json["payment_List"].map((x) => PaymentList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payment_Type": paymentType,
    "payment_List": List<dynamic>.from(paymentList!.map((x) => x.toJson())),
  };
}

class PaymentList {
  PaymentList({
    this.paymentName,
    this.paymentAmount,
  });

  String? paymentName;
  String? paymentAmount;

  factory PaymentList.fromJson(Map<String, dynamic> json) => PaymentList(
    paymentName: json["payment_name"],
    paymentAmount: json["payment_amount"],
  );

  Map<String, dynamic> toJson() => {
    "payment_name": paymentName,
    "payment_amount": paymentAmount,
  };
}
