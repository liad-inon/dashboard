import 'package:flutter/material.dart';

import 'mdi_controller.dart';

class MdiManager extends StatefulWidget {
  const MdiManager({Key? key, required this.mdiController}) : super(key: key);

  final MdiController mdiController;

  @override
  _MdiManagerState createState() => _MdiManagerState();
}

class _MdiManagerState extends State<MdiManager> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: widget.mdiController.windows.map((e) {
      return Positioned(
        left: e.x,
        top: e.y,
        key: e.key,
        child: e,
      );
    }).toList());
  }
}
