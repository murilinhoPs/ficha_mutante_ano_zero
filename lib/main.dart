import 'package:flutter/material.dart';
import 'package:pdf_mutant/src/app_module.dart';
import 'package:pdf_mutant/src/global/services/local_storage/local_storage_impl.dart';
import 'package:pdf_mutant/src/global/services/local_storage/local_storage_wrapper.dart';

void main() {
  LocalStorageWrapper.initLocalStorage(LocalStorageImpl());

  runApp(AppModule());
}
