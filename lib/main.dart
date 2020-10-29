import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

final _theme = ThemeData.dark().copyWith(
  accentColor: Colors.green,
  backgroundColor: Colors.blue,
  scaffoldBackgroundColor: Colors.red,
);

@immutable
class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'Dart DevTools',
          theme: _theme,
          onGenerateRoute: (settings) => MaterialPageRoute(
              settings: settings, builder: (_) => MyInitializer()),
        );
      },
    );
  }
}

class MyInitializer extends StatefulWidget {
  @override
  _MyInitializerState createState() => _MyInitializerState();
}

class _MyInitializerState extends State<MyInitializer> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) => _isLoaded
      ? const Text('LOADED SCREEN')
      : const Scaffold(body: Center(child: CircularProgressIndicator()));

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500)).then(
      (_) {
        _isLoaded = true;
        setState(() {});
      },
    );
  }
}
