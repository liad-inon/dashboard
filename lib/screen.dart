import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dashboard/Constants.dart';
import 'package:dashboard/views/debug_view.dart';
import 'package:flutter/material.dart';

WindowButtonColors windowButtonColors =
    WindowButtonColors(iconNormal: primaryColor);

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Widget selectedView = const DebugView();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _windowsTitleBar(),
          Expanded(
            child: Row(
              children: [
                _navBar([
                  _navButton(
                    view: const DebugView(),
                    icon: Icons.bug_report_rounded,
                  )
                ]),
                Expanded(
                  child: Container(
                    color: const Color(0xff2d2d2d),
                    child: SizedBox(child: selectedView),
                  ),
                )
              ],
            ),
          ),
        ],
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

  Widget _navBar(List<Widget> navButtons) => Container(
        width: 51,
        color: const Color(0xff333333),
        child: Column(
          children: navButtons,
        ),
      );

  Widget _navButton({required Widget view, required IconData icon}) => InkWell(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6, top: 6),
            child: Icon(
              icon,
              color: (selectedView.runtimeType == view.runtimeType)
                  ? Colors.white
                  : primaryColor,
              size: 35,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            selectedView = view;
          });
        },
      );
}
