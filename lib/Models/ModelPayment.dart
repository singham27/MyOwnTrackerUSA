class ModelPayment {
  double? totalAmount;
  double? paidAmount;
  String? paymentType;
  String? paymentDate;
  String? paymentMethod;
  String? id;
  String? createdTime;

  ModelPayment({
    this.totalAmount,
    this.paidAmount,
    this.paymentType,
    this.paymentDate,
    this.paymentMethod,
    this.id,
    this.createdTime,
  });

  factory ModelPayment.toModel(Map<String, dynamic> map) {
    return ModelPayment(
      totalAmount: double.parse(map['totalAmount'].toString()),
      paidAmount: double.parse(map['paidAmount'].toString()),
      paymentType: map['paymentType'],
      paymentDate: map['paymentDate'],
      paymentMethod: map['paymentMethod'],
      id: map['id'],
      createdTime: map['createdTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
      'paymentType': paymentType,
      'paymentDate': paymentDate,
      'paymentMethod': paymentMethod,
      'id': id,
      'createdTime': createdTime,
    };
  }

  List<Map<String, dynamic>> listModelToListMap(List<ModelPayment> listModel) {
    List<Map<String, dynamic>> array = [];

    for (ModelPayment modelItem in listModel) {
      array.add(modelItem.toMap());
    }

    return array;
  }
}
