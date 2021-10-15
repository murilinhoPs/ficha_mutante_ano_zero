import 'package:flutter/material.dart';
import 'package:ficha_mutante_ano_zero/src/app_module.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_impl.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';

void main() {
  LocalStorageWrapper.initLocalStorage(LocalStorageImpl());

  runApp(AppModule());
}
