// import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf_mutant/app/modules/firstPage/first_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final screenshotController = ScreenshotController();

  File _imageFile;

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final doc = pw.Document();

    final image = pw.MemoryImage(_imageFile.readAsBytesSync());

    doc.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(5.0),
        pageFormat: format,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.AspectRatio(
              aspectRatio: 2 / 3,
              child: pw.Image(
                image,
              ),
            ),
          );
        },
      ),
    );

    return doc.save();
  }

  void _printScreen(context) async {
    if (Platform.isIOS)
      Printing.sharePdf(
          bytes: await _generatePdf(PdfPageFormat.a5),
          filename: 'fichaMutantAnoZero.pdf');
    else if (Platform.isAndroid) {
      var status = await Permission.storage.request();

      print(status);

      if (status == PermissionStatus.granted) {
        await ImageGallerySaver.saveImage(await _imageFile.readAsBytes(),
            quality: 80, name: "fichaMutantAnoZero");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: const EdgeInsets.all(8.0),
            content: Text('Imagem salva na galeria!'),
          ),
        );
      } else
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: const EdgeInsets.all(8.0),
            content:
                Text('Não foi possível salvar na galeria, permissão negada'),
          ),
        );
    } else
      Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await _generatePdf(format),
        name: 'fichaMutantAnoZero',
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt),
        onPressed: () {
          screenshotController
              .capture()
              .then((File image) {
                //Capture Done
                setState(() {
                  _imageFile = image;
                });
              })
              .then((value) => _printScreen(context))
              .catchError((onError) {
                print(onError);
              });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Screenshot(
            controller: screenshotController,
            child: Column(
              children: [
                Container(
                  color: Colors.white10,
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    width: 600,
                  ),
                ),
                FirstPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
