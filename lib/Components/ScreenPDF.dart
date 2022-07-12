// https://stackoverflow.com/questions/64725938/how-to-convert-a-whole-flutter-screen-to-pdf

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../Utils/Global.dart';
import 'package:flutter/material.dart';


/*
class ScreenPDF {
  Future<File> createPDF() {
    final Document pdf = Document();
    pdf.addPage(
      //Your PDF design here with the widget system of the plugin
        MultiPage(
          pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
          crossAxisAlignment: CrossAxisAlignment.start,
          theme: Theme(
            tableHeader: TextStyle(fontSize: 8.0),
            tableCell: TextStyle(fontSize: 8.0),
          ),
          header: (Context context) {
            if (context.pageNumber == 1) {
              return null;
            }
            return Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
                padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
                decoration: const BoxDecoration(
                    border:
                    BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
                child: Text('VCR',
                    style: Theme
                        .of(context)
                        .defaultTextStyle
                        .copyWith(color: PdfColors.grey)));
          },
        );


        output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    file.writeAsBytesSync(pdf.save());
    return file;
  }
}


 */