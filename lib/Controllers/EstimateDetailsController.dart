import 'package:business_trackers/Models/ModelItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../Models/ModelEstimate.dart';
import '../Controllers/MyCompanyController.dart';
import '../Utils/API.dart';
import '../Utils/Global.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../Models/ModelEstimate.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class EstimateDetailsController extends GetxController {
  RxInt estimateStatus = 0.obs;

  final controllerMyCompany = Get.put(MyCompanyController());

  Rx<Uint8List> imageDataSignature = Uint8List.fromList(''.codeUnits).obs;
  RxMap<String, dynamic> signature = <String, dynamic>{}.obs;

  RxString imagePicture = ''.obs;

  Rx<ModelEstimate> modelEstimate = ModelEstimate().obs;

  RxList<String> arrSendEstimate = [
    'Signature',
    'Invoice',
    'Print Or Save PDF',
    // 'SMS',
    // 'Email',
    'Share',
  ].obs;

  RxList<String> arrSendInvoice = [
    'Signature',
    'Payment',
    'Print Or Save PDF',
    // 'SMS',
    // 'Email',
    'Share',
  ].obs;

  onInit() {
    Future.delayed(Duration(microseconds: 100), () {
      controllerMyCompany.readCompany();
    });
  }

  double taxCalcuation(List<ModelItem> items) {
    double taxTotal = 0.0;

    for (int i = 0; i < items.length; i++) {
      taxTotal += double.parse(items[i].taxValue.toString());
    }

    return taxTotal;
  }

  String taxPriceCaluculation(ModelEstimate estimate) {
    final tax = taxCalcuation(estimate.items!);
    final taxPrice = (estimate.subTotal! * tax) / 100;
    return taxPrice.toStringAsFixed(2);
  }

  deleteEstimate(String id, bool isInvoice) async {
    final params = isInvoice
        ? {
            'invoiceID': id,
          }
        : {
            'estimateID': id,
          };

    final endPoint = isInvoice ? 'deleteInvoice' : 'deleteEstimate';

    final response =
        await API.instance.post(endPoint: endPoint, params: params);

    print(response);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

  updateEstimateStates(String estimateID, String states) async {
    final params = {
      'estimateID': estimateID,
      'states': states,
    };

    final response = await API.instance
        .post(endPoint: 'updateEstimateStates', params: params);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      // Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

  updateEstimateStatesName(ModelEstimate estimate) async {
    final params = {
      'estimateID': estimate.id,
      'states_name': 'Invoice',
    };

    final response = await API.instance
        .post(endPoint: 'updateEstimateStatesName', params: params);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      invoiceFromEstimate(estimate);
    } else {
      response!['message'].toString().showError();
    }
  }

  invoiceFromEstimate(ModelEstimate estimate) async {
    final params = {
      'signature': jsonEncode(estimate.signature!.toJson()),
      'client': jsonEncode(estimate.client!.toMap()),
      'items': jsonEncode(ModelItem().listModelToListMap(estimate.items!)),
      'paymentSchedule': jsonEncode(estimate.paymentSchedule!.toJson()),
      'contract': jsonEncode(estimate.contract!.toJson()),
      'subTotal': estimate.tax.toString(),
      'tax': estimate.tax.toString(),
      'amountTotal': estimate.amountTotal.toString(),
      'notes': estimate.notes.toString(),
      'docID': estimate.docID.toString(),
      'date': estimate.date.toString(),
      'po': estimate.po.toString(),
      'states': 'Active',
      'states_name': 'Draft',
    };

    final response =
        await API.instance.post(endPoint: 'createInvoice', params: params);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      Get.back(result: true);
      response['message'].toString().showSuccess();
    } else {
      response!['message'].toString().showError();
    }
  }

  uploadImage(String name, String endPoint) async {
    final response = await API.instance.postImageData(imageDataSignature.value);

    if (response != null &&
        response.isNotEmpty &&
        response['status'].toString() == '200') {
      debugPrint(response['data'].toString());

      final DateFormat format = DateFormat('dd/MM/yyyy');
      final dateToday = format.format(DateTime.now());

      signature.value = {
        'image': response['data'].toString(),
        'name': name,
        'date': dateToday
      };

      updateEstimateSignature(endPoint);
    } else {
      response!['message'].toString().showError();
    }
  }

  updateEstimateSignature(String endPoint) async {
    Get.focusScope!.unfocus();

    final params = endPoint.toLowerCase().contains('invoice')
        ? {
            'invoiceID': modelEstimate.value.id,
            'signature': jsonEncode(signature.value),
          } : {
            'estimateID': modelEstimate.value.id,
            'signature': jsonEncode(signature.value),
          };

    print(params);

    final response =
        await API.instance.post(endPoint: endPoint, params: params);

    if (response != null && response.isNotEmpty && response['status'].toString() == '200') {
      response['message'].toString().showSuccess();

      final dictData = Map<String, dynamic>.from(response['data']);
      modelEstimate.value = ModelEstimate.fromJson(dictData);
    } else {
      response!['message'].toString().showError();
    }
  }


  final doc = pw.Document();

  convertInPDF(GlobalKey _printKey) async {
    final image = await WidgetWraper.fromKey(
      key: _printKey,
      pixelRatio: 2.0,
    );

    return doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Expanded(
              child: pw.Image(image),
            ),
          );
        }));
  }

  printScreen(GlobalKey _printKey) async {
    convertInPDF(_printKey);
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }

  sharePDF(GlobalKey _printKey, String pdfName) async {
    convertInPDF(_printKey);
    await Printing.sharePdf(bytes: await doc.save(), filename: '${pdfName}.pdf');
  }
}
