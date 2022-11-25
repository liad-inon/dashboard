import 'dart:math';

import 'package:flutter/material.dart';

import 'transform_dynamic.dart';

class TransformDynamicController {
  TransformDynamicController(this._onUpdate);

  List<TransformDynamic> _windows = List.empty(growable: true);

  VoidCallback _onUpdate;

  List<TransformDynamic> get windows => _windows;

  void add(TransformDynamic transformDynamic) {
    //Set initial position
    var rng = new Random();
    transformDynamic.x = rng.nextDouble() * 500;
    transformDynamic.y = rng.nextDouble() * 500;

    transformDynamic.onWindowDragged = (dx, dy) {
      transformDynamic.x += dx;
      transformDynamic.y += dy;

      _windows.remove(transformDynamic);
      _windows.add(transformDynamic);

      _onUpdate();
    };

    transformDynamic.onCloseButtonClicked = () {
      _windows.remove(transformDynamic);
      _onUpdate();
    };

    //Add Window to List
    _windows.add(transformDynamic);

    // Update Widgets after adding the new App
    _onUpdate();
  }
}
