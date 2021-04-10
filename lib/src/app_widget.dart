import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf_mutant/src/global/colors.dart';
import 'package:pdf_mutant/src/modules/first_page/first_page.dart';
import 'package:pdf_mutant/src/widgets/custom_snackbar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final screenshotController = ScreenshotController();

  File _imageFile;

  int count = 0;

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

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
    if (Platform.isAndroid || Platform.isIOS) {
      var status = await Permission.storage.request();

      if (status == PermissionStatus.granted) {
        await ImageGallerySaver.saveImage(
          await _imageFile.readAsBytes(),
          quality: 100,
          name: "fichaMutantAnoZero " +
              (Random().nextInt(900000) + 10000).toString(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnack(message: 'Salvo na galeria!'),
        );
      } else
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnack(
            message: 'Não foi possível salvar na galeria, permissão negada',
          ),
        );
    } else {
      Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await _generatePdf(format),
        name: 'fichaMutantAnoZero',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt),
        onPressed: () async {
          try {
            final image = await screenshotController.capture();

            setState(() => _imageFile = image);

            _printScreen(context);
          } catch (error) {
            print(error);
          }
        },
      ),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Screenshot(
          controller: screenshotController,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 600,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.darkBrown,
                        AppColors.orange.withRed(215),
                      ],
                      stops: [0.03, 1.2],
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: AppColors.textOrange,
                            size: 30.0,
                          ),
                          onPressed: _openDrawer,
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image(
                          height: 120,
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ],
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
