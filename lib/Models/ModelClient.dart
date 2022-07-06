


class ModelClient {
  String? id = '';
  String? name = '';
  String? email = '';
  String? mobileNumber = '';
  String? homeNumber = '';

  String? billing_address_1 = '';
  String? billing_address_2 = '';
  String? billing_city = '';
  String? billing_state_Province = '';
  String? billing_zip_Postal_Code = '';

  String? service_address_1 = '';
  String? service_address_2 = '';
  String? service_city = '';
  String? service_state_Province = '';
  String? service_zip_Postal_Code = '';

  String? notes = '';

  ModelClient(
      {this.id,
      this.name,
      this.email,
      this.mobileNumber,
      this.homeNumber,
      this.billing_address_1,
      this.billing_address_2,
      this.billing_city,
      this.billing_state_Province,
      this.billing_zip_Postal_Code,
      this.service_address_1,
      this.service_address_2,
      this.service_city,
      this.service_state_Province,
      this.service_zip_Postal_Code,
      this.notes});

  ModelClient toModel(Map<String, dynamic> map) {
    return ModelClient(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        mobileNumber: map['mobileNumber'],
        homeNumber: map['homeNumber'],
        billing_address_1: map['billing_address_1'],
        billing_address_2: map['billing_address_2'],
        billing_city: map['billing_city'],
        billing_state_Province: map['billing_state_Province'],
        billing_zip_Postal_Code: map['billing_zip_Postal_Code'],
        service_address_1: map['service_address_1'],
        service_address_2: map['service_address_2'],
        service_city: map['service_city'],
        service_state_Province: map['service_state_Province'],
        service_zip_Postal_Code: map['service_zip_Postal_Code'],
        notes: map['notes'],
    );
  }

    factory ModelClient.fromJson(Map<String, dynamic> json) => ModelClient(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    homeNumber: json["homeNumber"],
    billing_address_1: json["billing_address_1"],
    billing_address_2: json["billing_address_2"],
    billing_city: json["billing_city"],
    billing_state_Province: json["billing_state_Province"],
    billing_zip_Postal_Code: json["billing_zip_Postal_Code"],
    service_address_1: json["service_address_1"],
      service_address_2: json["service_address_2"],
    service_city: json["service_city"],
    service_state_Province: json["service_state_Province"],
    service_zip_Postal_Code: json["service_zip_Postal_Code"],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'homeNumber': homeNumber,

      'billing_address_1': billing_address_1,
      'billing_address_2': billing_address_2,
      'billing_city': billing_city,
      'billing_state_Province': billing_state_Province,
      'billing_zip_Postal_Code': billing_zip_Postal_Code,

      'service_address_1': service_address_1,
      'service_address_2': service_address_2,
      'service_city': service_city,
      'service_state_Province': service_state_Province,
      'service_zip_Postal_Code': service_zip_Postal_Code,
    };
  }
}
