class ModelItem {
  String? name;
  String? quantity;
  String? rate;
  String? taxName;
  String? taxValue;
  String? description;
  String? id;
  String? createdTime;
  String? valueAmount;

  ModelItem({
    this.name,
    this.quantity,
    this.rate,
    this.taxName,
    this.taxValue,
    this.valueAmount,
    this.description,
    this.id,
    this.createdTime,
  });

    factory ModelItem.fromJson(Map<String, dynamic> json) => ModelItem(
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

  ModelItem toModel(Map<String, dynamic> map) {
    return ModelItem(
        name: map[name].toString(),
        quantity: map[quantity].toString(),
        rate: map[rate].toString(),
        taxName: map[taxName].toString(),
        taxValue: map[taxValue].toString(),
        valueAmount: map[valueAmount].toString(),
        description: map[description].toString(),
        id: map[id].toString(),
        createdTime: map[createdTime].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'rate': rate,
      'taxName': taxName,
      'taxValue': taxValue,
      'description': description,
      'createdTime': createdTime,
      'valueAmount': valueAmount,
    };
  }

  List<Map<String, dynamic>> listModelToListMap(List<ModelItem> listModel) {
    List<Map<String, dynamic>> array = [];

    for (ModelItem modelItem in listModel) {
      array.add(modelItem.toMap());
    }

    print(array);
    return array;
  }

}

