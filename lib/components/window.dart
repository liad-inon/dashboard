import 'package:dashboard/components/transform_dynamic/transform_dynamic.dart';
import 'package:dashboard/components/transform_dynamic/transform_dynamic_group.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class Window extends TransformDynamic {
  Window({
    required Widget child,
    required String title,
    List<Widget>? titleBarActions,
    required TransformDynamicGroup controller,
  }) : super(
          group: controller,
          body: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(defaultBoarderRadius),
                bottomRight: Radius.circular(defaultBoarderRadius)),
            child: Container(
              color: onBackroundColor,
              child: child,
            ),
          ),
          titleBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(defaultBoarderRadius),
                topRight: Radius.circular(defaultBoarderRadius)),
            child: Container(
              width: double.maxFinite,
              height: 30,
              color: const Color(0xff111111),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: controller.remove(this),
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xfff48771),
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
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
