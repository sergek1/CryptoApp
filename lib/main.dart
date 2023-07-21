import 'dart:math';

import 'package:dio/dio.dart';
import 'package:first_project/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'crypto_coins_list_app.dart';

void main() {
  GetIt.I.registerSingleton(CryptoCoinsRepository(dio: Dio()));
  // GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
  //     () => CryptoCoinsRepository(dio: Dio()));

  runApp(const MyApp());
}
