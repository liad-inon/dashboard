import 'package:dashboard/components/mdi_controller.dart';
import 'package:flutter/material.dart';
import '../components/mdi_manager.dart';
import '../components/resizable_window.dart';

class DebugView extends StatefulWidget {
  const DebugView({super.key});

  @override
  State<DebugView> createState() => _DebugViewState();
}

class _DebugViewState extends State<DebugView> {
  late MdiController mdiController;

  @override
  void initState() {
    super.initState();

    mdiController = MdiController(() {
      setState(() {});
    });
    mdiController.addWindow(
      body: Text('test'),
      title: 'Test',
      defaultHeight: 100,
      defaultWidth: 100,
      sizable: false,
      haveCloseButton: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MdiManager(mdiController: mdiController);
  }
}
