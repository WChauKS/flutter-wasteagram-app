import 'package:flutter/material.dart';

class FakeEndDrawerForTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw StateError('Testing Sentry');
    return Drawer(child: Text('Delete from release'));
  }
}