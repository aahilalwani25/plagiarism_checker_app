import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:plagiarism_checker_app/Models/content.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfController {
  
  Content content;
  PdfController({required this.content});

  Future<void> openFile() async {
    final pdfFile = await _generatePdf();
    OpenFile.open(pdfFile.path);
  }

  Future<File> _generatePdf() async {
    //final font = Font.ttf(await rootBundle.load("assets/fonts/OpenSans-Regular.ttf"));
    final font = await PdfGoogleFonts.nunitoExtraLight();
    Document pdf = Document();
    
    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.a4,
        footer: (context) => Column(children: [
              Divider(),
              Center(
                  child: Text('Copyright (c) Aahil Alwani',
                      style: TextStyle(font: font)
                      )),
              Positioned(right: 50, child: Text('Page 1 of 1'))
            ]),
        build: (context) => [
              _buildBarcode(),
              Header(
                  text: "PLAGIARISM CHECKER",
                  textStyle: TextStyle(font: font)),
              Text("Developed by Aahil Alwani",
                  style: TextStyle(font: font)),
              Divider(),
              _buildTable(content),
              Padding(padding: const EdgeInsets.all(8.0)),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text('Word Count: ${content.wordsCount}',
                    style: TextStyle(font: font)),
              )
            ]));

    final savePdfBytes = await pdf.save();
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(savePdfBytes);
    return file;
  }

  Widget _buildBarcode() {
    return Container(
        width: 50,
        height: 50,
        child: BarcodeWidget(
            data: content.wordsCount.toString(), barcode: Barcode.qrCode()));
  }

  Widget _buildTable(Content content) {
    final data = content.plagiarised!['values'] as List<dynamic>;

    final updatedData = data.map((words) {
      return [words];
    }).toList();
    return TableHelper.fromTextArray(
        headers: ['Website', 'List of words'],
        //headerStyle: TextStyle(fontWeight: FontWeight.bold),
        data: updatedData,
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.center,
          1: Alignment.centerLeft,
        });
  }
}
