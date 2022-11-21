import 'dart:math';

import 'package:flutter/material.dart';

import 'resizable_window.dart';

class MdiController {
  MdiController(this._onUpdate);

  List<ResizableWindow> _windows = List.empty(growable: true);

  VoidCallback _onUpdate;

  List<ResizableWindow> get windows => _windows;

  void addWindow({
    required Widget body,
    required String title,
    required double defaultWidth,
    required double defaultHeight,
    required bool sizable,
    required bool haveCloseButton,
  }) {
    _createNewWindowedApp(
      body: body,
      title: title,
      defaultHeight: defaultHeight,
      defaultWidth: defaultWidth,
      sizable: sizable,
      haveCloseButton: haveCloseButton,
    );
  }

  void _createNewWindowedApp({
    required Widget body,
    required String title,
    required double defaultWidth,
    required double defaultHeight,
    required bool sizable,
    required bool haveCloseButton,
  }) {
    ResizableWindow resizableWindow = ResizableWindow(
      body: body,
      title: title,
      defaultHeight: defaultHeight,
      defaultWidth: defaultWidth,
      sizable: sizable,
      haveCloseButton: haveCloseButton,
    );

    //Set initial position
    var rng = new Random();
    resizableWindow.x = rng.nextDouble() * 500;
    resizableWindow.y = rng.nextDouble() * 500;

    resizableWindow.onWindowDragged = (dx, dy) {
      resizableWindow.x += dx;
      resizableWindow.y += dy;

      _windows.remove(resizableWindow);
      _windows.add(resizableWindow);

      _onUpdate();
    };

    resizableWindow.onCloseButtonClicked = () {
      _windows.remove(resizableWindow);
      _onUpdate();
    };

    //Add Window to List
    _windows.add(resizableWindow);

    // Update Widgets after adding the new App
    _onUpdate();
  }
}
