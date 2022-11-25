import 'package:dashboard/components/transform_dynamic/transform_dynamic.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class Window extends TransformDynamic {
  Window()
      : super(
          body: Container(color: Colors.blue, child: Text('title')),
          titleBar: Container(color: Colors.white, child: Text('title')),
          minHeight: 100,
          minWidth: 100,
          defaultHeight: 500,
          defaultWidth: 500,
          resizable: true,
          draggable: true,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBoarderRadius)),
            boxShadow: [
              BoxShadow(
                color: Color(0x54000000),
                spreadRadius: 1,
                blurRadius: 3,
              ),
            ],
          ),
        );
}
