
import 'package:business_trackers/Models/ModelItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/ModelClient.dart';
import '../Utils/Global.dart';



class EstimateCreateController extends GetxController {
  RxInt intAppBar = 0.obs;

  Rx<ModelClient>  selectedClient = ModelClient().obs;
  RxList<ModelItem> arrSelectedItem = <ModelItem>[].obs;
  RxMap<String, dynamic> paymentSchedule = <String, dynamic>{}.obs;
  RxMap<String, dynamic> genericContract = <String, dynamic>{}.obs;
  RxString date = 'Pick a date'.obs;

  Rx<TextEditingController> txtNotes = TextEditingController().obs;
  Rx<TextEditingController> txtEstimate = TextEditingController().obs;
  Rx<TextEditingController> txtPO = TextEditingController().obs;

  RxList<String> estimate = [
    'Contact',
    'PRO',
    'Generic Contract ',
  ].obs;

  reset() {
    intAppBar.value = 0;
  }

  refresh() {
    selectedClient.value = ModelClient();
    arrSelectedItem.value = [];
    paymentSchedule.value = {};
    txtNotes.value.text = '';
    genericContract.value = {};
    txtEstimate.value.text = '';
    date.value = 'Pick a date';
    txtPO.value.text = '';
  }

  validation() {
    print(paymentSchedule.value.isEmpty);

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
    } else if (txtEstimate.value.text.isEmpty) {
      'Enter estimate value'.showError();
    } else if (date == 'Pick a date') {
      'Select a date'.showError();
    } else if (txtPO.value.text.isEmpty) {
      'Please enter PO value'.showError();
    } else {

    }
  }
}
