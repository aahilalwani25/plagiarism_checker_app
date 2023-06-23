import 'package:open_file/open_file.dart';
import 'package:plagiarism_checker_app/Models/content.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';


class PdfController{

  Content content;
  PdfController({required this.content});

  Future<void> openFile() async{
    final pdfFile= await _generatePdf();
    OpenFile.open(pdfFile.path);
  }

  Future<File> _generatePdf() async {
    Document pdf = Document();

    pdf.addPage(MultiPage(
        footer: (context) => Column(children: [
              Divider(),
              Center(child: Text('Copyright (c) Aahil Alwani')),
              Positioned(right: 50, child: Text('Page 1 of 1'))
            ]),
        build: (context) => [
              _buildBarcode(),
              Header(text: "PLAGIARISM CHECKER"),
              Text("Developed by Aahil Alwani"),
              Divider(),
              _buildTable(content),
              Padding(padding: const EdgeInsets.all(8.0)),
              Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text('Word Count: ${content.wordsCount}'))
            ]));

    final savePdfBytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/doc_1');
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
    final data = content.plagiarised!['values'].map((words) {
      return [words.toString()];
    });
    return Table.fromTextArray(
        headers: ['Website', 'List of words'],
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        data: data,
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.center,
          1: Alignment.centerLeft,
        });
  }
}