import 'package:dashboard/components/transform_dynamic/transform_dynamic.dart';
import 'package:flutter/material.dart';

import 'transform_dynamic_group.dart';

class TransformDynamicBuilder extends StatefulWidget {
  const TransformDynamicBuilder({Key? key, required this.group})
      : super(key: key);

  final TransformDynamicGroup group;

  @override
  _TransformDynamicBuilderState createState() =>
      _TransformDynamicBuilderState();
}

class _TransformDynamicBuilderState extends State<TransformDynamicBuilder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: widget.group.children.map((e) {
      return Positioned(
        left: e.x,
        top: e.y,
        key: e.key,
        child: e,
      );
    }).toList());
  }
}
