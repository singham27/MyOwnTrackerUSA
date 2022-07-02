


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
}
