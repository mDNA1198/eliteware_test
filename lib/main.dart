import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';
import 'app/app_constants/api_constants.dart';
import 'data/networking/dio_factory.dart';
import 'data/networking/dio_factory_params.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  _initLogger();
  await _initDio();

  final logger = Logger('main');

  try {
    await SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  } catch (error) {
    logger.severe(
      'SystemChrome.setPreferredOrientations [DeviceOrientation.portraitUp]',
      error,
    );
  }

  runApp(App());
}

void _initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
        (event) {
      log(
        event.message,
        time: event.time,
        sequenceNumber: event.sequenceNumber,
        level: event.level.value,
        name: event.loggerName,
        zone: event.zone,
        error: event.error,
        stackTrace: event.stackTrace,
      );
    },
  );
}

Future<void> _initDio() async {
  DioFactory.setParams(
    params: const DioFactoryParams(
      APIConstants.baseUrl,
      selfSignedCert: false,
      enableLogs: true,
    ),
  );
}