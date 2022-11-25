import 'dart:async';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dashboard/screen.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

void main() {
  runApp(const App());

  doWhenWindowReady(() {
    appWindow.maximize();
    appWindow.show();
  });
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scouting Analytics',
      theme: _theme(),
      home: const Screen(),
    );
  }

  ThemeData _theme() => ThemeData(
        fontFamily: defaultFont,
      );
}
