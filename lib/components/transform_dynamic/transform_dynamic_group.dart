import 'dart:math';

import 'package:flutter/material.dart';

import 'transform_dynamic.dart';

class TransformDynamicGroup {
  TransformDynamicGroup(this._onUpdate);
  List<TransformDynamic> children = List.empty(growable: true);
  final VoidCallback _onUpdate;

  void add(TransformDynamic transformDynamic) {
    //Set initial position
    var rng = Random();
    transformDynamic.x = rng.nextDouble() * 500;
    transformDynamic.y = rng.nextDouble() * 500;

    //Add Window to List
    children.add(transformDynamic);

    // Update Widgets after adding the new App
    _onUpdate();
  }

  void onDragged(TransformDynamic transformDynamic, double dx, double dy) {
    transformDynamic.x += dx;
    transformDynamic.y += dy;

    children.remove(transformDynamic);
    children.add(transformDynamic);

    _onUpdate();
  }

  void remove(TransformDynamic transformDynamic) {
    children.remove(transformDynamic);
    _onUpdate();
  }
}
