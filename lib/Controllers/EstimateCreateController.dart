
import 'package:business_trackers/Models/ModelItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/ModelClient.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import 'dart:convert';
import '../Models/ModelEstimate.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'EstimateDetailsController.dart';


class EstimateCreateController extends GetxController {
  String estimateID = '';
  ModelEstimate? estimate;

  RxBool isSwitchOn = false.obs;

  Rx<ModelClient>  selectedClient = ModelClient().obs;
  RxList<ModelItem> arrSelectedItem = <ModelItem>[].obs;
  RxMap<String, dynamic> paymentSchedule = <String, dynamic>{}.obs;
  RxMap<String, dynamic> genericContract = <String, dynamic>{}.obs;
  Rx<Uint8List> imageDataSignature = Uint8List.fromList(''.codeUnits).obs;
  RxMap<String, dynamic> signature = <String, dynamic>{}.obs;

  RxString date = 'Pick a date'.obs;
  Rx<TextEditingController> txtNotes = TextEditingController().obs;
  Rx<TextEditingController> docID = TextEditingController().obs;
  Rx<TextEditingController> txtPO = TextEditingController().obs;

  final controller = Get.put(EstimateDetailsController());

  double subTotal() {
    double amount = 0.0;
    for (int i = 0; i<arrSelectedItem.length; i++) {
      final priceItem = double.parse(arrSelectedItem[i].quantity.toString())*double.parse(arrSelectedItem[i].rate.toString());
      amount += priceItem;
    }

    return amount;
  }

  taxTotal() {
    double tax = 0.0;
    for (int i = 0; i<arrSelectedItem.length; i++) {
      tax += double.parse(arrSelectedItem[i].taxValue.toString());
    }

    return tax;
  }

  tax() {
    double tax = 0.0;
    for (int i = 0; i<arrSelectedItem.length; i++) {
      tax += double.parse(arrSelectedItem[i].taxValue.toString());
    }

    final taxPrice = (subTotal()*tax)/100;

    return taxPrice;
  }

  totalAmount() {
    return subTotal()+tax();
  }

  reset() {

  }

  refresh() {
    selectedClient.value = ModelClient();
    arrSelectedItem.value = [];
    paymentSchedule.value = {};
    txtNotes.value.text = '';
    genericContract.value = {};
    docID.value.text = '';
    date.value = 'Pick a date';
    txtPO.value.text = '';
  }

  validation(String title) {
    if (selectedClient.value.name == null) {
      'Add a client'.showError();
    } else if (arrSelectedItem.value.isEmpty) {
      'Add a line item'.showError();
    } else if (paymentSchedule.value.isEmpty) {
      'Schedule a payment'.showError();
    } else if (txtNotes.value.text.isEmpty) {
      'Please enter some notes'.showError();
    } else if (genericContract.value.toString().isEmpty) {
      'Select a generic contract'.showError();
    } else if (docID.value.text.isEmpty) {
      'Enter estimate value'.showError();
    } else if (date == 'Pick a date') {
      'Select a date'.showError();
    } else if (txtPO.value.text.isEmpty) {
      'Please enter PO value'.showError();
    } else {
      if (title.toLowerCase().contains('edit')) {
        if (title.toLowerCase().contains('estimate')) {
          updateEstimate('updateEstimate');
        } else {
          updateEstimate('updateInvoice');
        }
      } else {
        if (title.toLowerCase().contains('estimate')) {
          createEstimate('createEstimate');
        } else {
          createEstimate('createInvoice');
        }
      }
    }
  }

  createEstimate(String endPoint) async {
    Get.focusScope!.unfocus();

    final params = {
      'signature': jsonEncode(signature.value),
      'client': jsonEncode(selectedClient.value.toMap()),
      'items': jsonEncode(ModelItem().listModelToListMap(arrSelectedItem.value)),
      'paymentSchedule': jsonEncode(paymentSchedule.value),
      'contract': jsonEncode(genericContract.value),
      'subTotal': subTotal().toString(),
      'tax': tax().toString(),
      'amountTotal': totalAmount().toString(),
      'notes': txtNotes.value.text,
      'docID': docID.value.text,
      'date': date.value,
      'po': txtPO.value.text,
      'states': endPoint.toLowerCase().contains('estimate') ? 'Pending' : 'Active',
      'states_name': 'Draft',
    };

    final response = await API.instance.post(endPoint: endPoint, params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
      refresh();
    } else {
      response!['message'].toString().showError();
    }
  }

  updateEstimate(String endPoint) async {
    Get.focusScope!.unfocus();

    final params = {
      'estimateID': estimateID,
      'signature': jsonEncode(signature.value),
      'client': jsonEncode(selectedClient.value.toMap()),
      'items': jsonEncode(ModelItem().listModelToListMap(arrSelectedItem.value)),
      'paymentSchedule': jsonEncode(paymentSchedule.value),
      'contract': jsonEncode(genericContract.value),
      'subTotal': subTotal().toString(),
      'tax': tax().toString(),
      'amountTotal': totalAmount().toString(),
      'notes': txtNotes.value.text,
      'docID': docID.value.text,
      'date': date.value,
      'po': txtPO.value.text,
      'states': estimate!.states.toString(),
      'states_name': estimate!.states_name.toString(),
    };

    print(params);

    final response = await API.instance.post(endPoint: endPoint, params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      Get.back();
      Get.back(result: true);
      response['message'].toString().showSuccess();
      refresh();
    } else {
      response!['message'].toString().showError();
    }
  }

  uploadImage() async {
    final response = await API.instance.postImageData(imageDataSignature.value);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      debugPrint(response['data'].toString());

      final DateFormat format = DateFormat('dd/MM/yyyy');
      final dateToday = format.format(DateTime.now());

      signature.value = {
        'image': response['data'].toString(),
        'name': controller.controllerMyCompany.nameOutSide.value,
        'date': dateToday
      };
    } else {
      response!['message'].toString().showError();
    }
  }

}
