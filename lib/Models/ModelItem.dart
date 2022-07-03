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
      'name': name,
      'quantity': quantity,
      'rate': rate,
      'taxName': taxName,
      'taxValue': taxValue,
      'description': description,
      'id': id,
      'createdTime': createdTime,
      'valueAmount': valueAmount,
    };
  }

}
