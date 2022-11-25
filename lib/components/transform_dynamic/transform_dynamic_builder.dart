import 'package:dashboard/components/transform_dynamic/transform_dynamic.dart';
import 'package:flutter/material.dart';

import 'transform_dynamic_controller.dart';

class TransformDynamicBuilder extends StatefulWidget {
  const TransformDynamicBuilder({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<TransformDynamic> children;

  @override
  _TransformDynamicBuilderState createState() =>
      _TransformDynamicBuilderState();
}

class _TransformDynamicBuilderState extends State<TransformDynamicBuilder> {
  late TransformDynamicController controller;

  @override
  void initState() {
    super.initState();

    controller = TransformDynamicController(() {
      setState(() {});
    });

    for (TransformDynamic child in widget.children) {
      controller.add(child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: controller.windows.map((e) {
      return Positioned(
        left: e.x,
        top: e.y,
        key: e.key,
        child: e,
      );
    }).toList());
  }
}
