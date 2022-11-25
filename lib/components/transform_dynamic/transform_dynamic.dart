import 'package:dashboard/Constants.dart';
import 'package:flutter/material.dart';

class TransformDynamic extends StatefulWidget {
  TransformDynamic({
    required this.body,
    required this.titleBar,
    required this.defaultWidth,
    required this.defaultHeight,
    required this.minWidth,
    required this.minHeight,
    required this.resizable,
    required this.draggable,
    this.decoration,
    this.resizeDetectorsColor,
  }) : super(key: UniqueKey()) {
    currentHeight = defaultHeight;
    currentWidth = defaultWidth;
  }

  final Widget body;
  final Widget titleBar;
  final bool resizable;
  final bool draggable;
  final BoxDecoration? decoration;
  final Color? resizeDetectorsColor;
  late double minWidth;
  late double minHeight;
  late double currentHeight, defaultHeight = defaultHeight;
  late double currentWidth, defaultWidth = defaultWidth;

  late double x;
  late double y;
  late Function(double, double) onWindowDragged;
  late Function() onCloseButtonClicked;

  @override
  _TransformDynamicState createState() => _TransformDynamicState();
}

class _TransformDynamicState extends State<TransformDynamic> {
  late double preWidth;
  late double preHight;

  @override
  void initState() {
    preWidth = widget.defaultWidth;
    preHight = widget.defaultHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      height: widget.currentHeight,
      width: widget.currentWidth,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (widget.draggable)
                  ? _dragButton(widget.titleBar)
                  : widget.titleBar,
              widget.body,
            ],
          ),
          (widget.resizable) ? _resizeDetectors() : Container()
        ],
      ),
    );
  }

  Widget _dragButton(Widget child) => GestureDetector(
        onPanUpdate: (tapInfo) {
          widget.onWindowDragged(tapInfo.delta.dx, tapInfo.delta.dy);
        },
        child: child,
      );

  Widget _resizeDetectors() => Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: _onHorizontalDragRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    width: 4,
                  ),
                ),
              )),
          Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: GestureDetector(
                onHorizontalDragUpdate: _onHorizontalDragLeft,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    width: 4,
                  ),
                ),
              )),
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragUpdate: _onHorizontalDragTop,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpDown,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    height: 4,
                  ),
                ),
              )),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragUpdate: _onHorizontalDragBottom,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpDown,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    height: 4,
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onPanUpdate: _onHorizontalDragBottomRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpLeftDownRight,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    height: 6,
                    width: 6,
                  ),
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: GestureDetector(
                onPanUpdate: _onHorizontalDragBottomLeft,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpRightDownLeft,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    height: 6,
                    width: 6,
                  ),
                ),
              )),
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onPanUpdate: _onHorizontalDragTopRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpRightDownLeft,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    height: 6,
                    width: 6,
                  ),
                ),
              )),
          Positioned(
              left: 0,
              top: 0,
              child: GestureDetector(
                onPanUpdate: _onHorizontalDragTopLeft,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeUpLeftDownRight,
                  opaque: true,
                  child: Container(
                    color: widget.resizeDetectorsColor,
                    height: 6,
                    width: 6,
                  ),
                ),
              )),
        ],
      );

  void _onHorizontalDragLeft(DragUpdateDetails details) {
    setState(() {
      if ((widget.currentWidth - details.delta.dx) > widget.minWidth) {
        widget.onWindowDragged(details.delta.dx, 0);
        widget.currentWidth -= details.delta.dx;
      }
    });
  }

  void _onHorizontalDragRight(DragUpdateDetails details) {
    setState(() {
      widget.currentWidth += details.delta.dx;
      if (widget.currentWidth < widget.minWidth) {
        widget.currentWidth = widget.minWidth;
      }
    });
  }

  void _onHorizontalDragBottom(DragUpdateDetails details) {
    setState(() {
      widget.currentHeight += details.delta.dy;
      if (widget.currentHeight < widget.minHeight) {
        widget.currentHeight = widget.minHeight;
      }
    });
  }

  void _onHorizontalDragTop(DragUpdateDetails details) {
    setState(() {
      if ((widget.currentHeight - details.delta.dy) > widget.minHeight) {
        widget.currentHeight -= details.delta.dy;
        widget.onWindowDragged(0, details.delta.dy);
      }
    });
  }

  void _onHorizontalDragBottomRight(DragUpdateDetails details) {
    _onHorizontalDragRight(details);
    _onHorizontalDragBottom(details);
  }

  void _onHorizontalDragBottomLeft(DragUpdateDetails details) {
    _onHorizontalDragLeft(details);
    _onHorizontalDragBottom(details);
  }

  void _onHorizontalDragTopRight(DragUpdateDetails details) {
    _onHorizontalDragRight(details);
    _onHorizontalDragTop(details);
  }

  void _onHorizontalDragTopLeft(DragUpdateDetails details) {
    _onHorizontalDragLeft(details);
    _onHorizontalDragTop(details);
  }
}
