import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dashboard/Constants.dart';
import 'package:dashboard/components/transform_dynamic/transform_dynamic.dart';
import 'package:dashboard/components/window.dart';
import 'package:flutter/material.dart';
import 'components/transform_dynamic/transform_dynamic_builder.dart';
import 'models/api.dart';

WindowButtonColors windowButtonColors =
    WindowButtonColors(iconNormal: primaryColor);

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _windowsTitleBar(),
            Expanded(
              child: TransformDynamicBuilder(
                children: [Window(child: Container(), title: 'test')],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _windowsTitleBar() => WindowTitleBarBox(
        child: Container(
          width: double.maxFinite,
          color: const Color(0xff3c3c3c),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Glue Gun & Gliter dashboard',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              MinimizeWindowButton(colors: windowButtonColors),
              MaximizeWindowButton(colors: windowButtonColors),
              CloseWindowButton(colors: windowButtonColors),
            ],
          ),
        ),
      );
}
