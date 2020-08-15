import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentry/sentry.dart';
import 'app.dart';

// sentry code is modified from the lecture on Analytics and Crash Reporting

Future<String> loadDSN() async {
  String DSN = await rootBundle.loadString('assets/sentry_dsn.txt');
  return DSN;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  
  String DSN = await loadDSN();
  final SentryClient sentry = SentryClient(dsn: DSN);

  FlutterError.onError = (FlutterErrorDetails details) {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  runZoned( () {
    runApp(WasteagramApp(sentry: sentry));
  }, onError: (error, stackTrace) {
    WasteagramApp.reportError(sentry, error, stackTrace);
  });
}