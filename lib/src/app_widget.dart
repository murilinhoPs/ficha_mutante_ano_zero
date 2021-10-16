import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/first_page.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final screenshotController = ScreenshotController();

  late Uint8List _imageFile;

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final doc = pw.Document();

    final image = pw.MemoryImage(_imageFile);

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

      if (status == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnack(
            message: 'Não foi possível salvar na galeria, permissão negada',
          ),
        );
        return;
      }

      await ImageGallerySaver.saveImage(
        _imageFile,
        quality: 100,
        name: "fichaMutantAnoZero " +
            (Random().nextInt(900000) + 10000).toString(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnack(message: 'Salvo na galeria!'),
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
      onDrawerChanged: (value) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.darkBrown,
                AppColors.orange.withRed(215),
              ],
              stops: [0.03, 1.2],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Outras sessões da ficha',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: _closeDrawer,
                  child: const Text('Close Drawer'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: FloatingActionButton(
          child: Icon(Icons.save_alt),
          onPressed: () async {
            // LocalStorageWrapper.deleteAll();
            try {
              final image = await screenshotController.capture();

              setState(() => _imageFile = image!);

              _printScreen(context);
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                CustomSnack(
                  message: 'Não foi possível salvar na galeria.',
                ),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        scrollDirection: Axis.vertical,
        child: Screenshot(
          controller: screenshotController,
          child: Container(
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
            child: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 12.0,
                        ),
                        alignment: Alignment.center,
                        child: Image(
                          height: 120,
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: AppColors.textOrange,
                            size: 40.0,
                          ),
                          onPressed: _openDrawer,
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ),
                    ],
                  ),
                  FirstPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
