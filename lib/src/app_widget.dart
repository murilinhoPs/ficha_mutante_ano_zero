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
  final screenshotController = ScreenshotController();

  late Uint8List _imageFile;

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
      body: _buildScaffoldBody(),
      bottomNavigationBar: _gradientContainer(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            currentIndex: 0,
            showUnselectedLabels: false,
            unselectedItemColor: AppColors.lightGrey.withOpacity(0.5),
            selectedItemColor: AppColors.orange2,
            backgroundColor: Colors.transparent,
            onTap: null,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.article_outlined,
                ),
                label: 'Ficha',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_pin_rounded,
                ),
                label: 'Personagem',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.groups,
                ),
                label: 'Party',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
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
    );
  }

  Widget _buildScaffoldBody() {
    return _gradientContainer(
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: Screenshot(
            controller: screenshotController,
            child: _gradientContainer(
              child: Column(
                children: [
                  _buildAppBar(),
                  FirstPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gradientContainer({
    required Widget child,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
  }) {
    return Container(
      width: 600,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkBrown,
            AppColors.orange.withRed(215),
          ],
          stops: [0.02, 1.2],
          begin: begin,
          end: end,
        ),
      ),
      child: child,
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
        bottom: 16.0,
      ),
      alignment: Alignment.center,
      child: Image(
        height: 120,
        image: AssetImage('assets/logo.png'),
      ),
    );
  }
}
