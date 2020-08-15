// import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';
import 'screens/detail_screen.dart';
import 'screens/list_screen.dart';
import 'screens/new_post_screen.dart';

// sentry code is modified from the lecture on Analytics and Crash Reporting

class WasteagramApp extends StatelessWidget {
  final SentryClient sentry;
  WasteagramApp({this.sentry});

  static Future<void> reportError(SentryClient sentry, dynamic error, dynamic stackTrace) async {
    // if (Foundation.kDebugMode) {
    //   print(stackTrace);
    //   return;
    // }
    final SentryResponse response = await sentry.captureException(
      exception: error,
      stackTrace: stackTrace
    );
    if (response.isSuccessful) {
      print('Sentry ID: ${response.eventId}');
    } else {
      print('Failed to report to Sentry: ${response.error}');
    }
  }

  static final routes = {
    PostListScreen.routeName: (context) => PostListScreen(),
    DetailScreen.routeName: (context) => DetailScreen(),
    NewPostScreen.routeName: (context) => NewPostScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      routes: WasteagramApp.routes
    );
  }
}