//~ This is a custom Wraper should be used to make a screen with
//~ a menu attached to it.
//& Made by PIG

import 'package:flutter/material.dart';
import 'package:pig/config/config.dart';

class PigDrawer extends StatefulWidget {
  ///[menu] is the widget passed as an argument
  final Widget? menu;

  ///[scaffold] is the main page from which we swipe left to open drawer
  final Widget scaffold;

  ///[controller] used to [open] or [close] and can also be used to
  /// check the [state] of the [drawer]
  final PigDrawerController controller;

  final bool? scrollable;

  ///[backgroundColor] of the menu
  final Color backgroundColor;

  const PigDrawer({
    Key? key,
    this.menu,
    required this.scaffold,
    required this.controller,
    this.backgroundColor = Colors.white,
    this.scrollable = true,
  }) : super(key: key);

  @override
  _PigDrawerState createState() => _PigDrawerState();
}

class _PigDrawerState extends State<PigDrawer> {
  final double _cornerRadius = 32.0;
  Widget _renderContent() {
    final slideAmount = rSWidth(275.0) * widget.controller.percentOpen;
    final cornerRadius = _cornerRadius * widget.controller.percentOpen;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0.0, 4.0),
              blurRadius: 40.0,
              spreadRadius: 10.0,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(cornerRadius)),
          child: GestureDetector(
            onTap: () {
              if (widget.scrollable!) widget.controller.close();
            },

            onHorizontalDragStart: (_) {
              if (widget.scrollable!) widget.controller.open();
            },

            ///[scaffold] passed will be pushed here
            child: widget.scaffold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /// this is the [Menu] view
        GestureDetector(
          onTap: () {
            if (widget.scrollable!) widget.controller.close();
          },
          onHorizontalDragStart: (_) {
            if (widget.scrollable!) widget.controller.close();
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: widget.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding(1),
                vertical: vPadding(2),
              ),

              ///[menu] passed will be pushed here
              child: widget.menu,
            ),
          ),
        ),
        _renderContent()
      ],
    );
  }
}

class PigDrawerController extends ChangeNotifier {
  /// [PigDrawerController] use this to control the drawer [open] and [close]
  final TickerProvider vsync;

  ///[duration] can be used to specify the time
  ///it takes to open or close the drawer
  final Duration duration;

  /// [_animationController] is used to animate the [size] and [position] of the
  /// [screen] which is wrapped
  final AnimationController _animationController;
  PigDrawerState state = PigDrawerState.closed;

  PigDrawerController(
      {required this.vsync, this.duration = const Duration(milliseconds: 250)})
      : _animationController =
            AnimationController(vsync: vsync, duration: duration) {
    _initController();
  }

  void _initController() {
    _animationController
      ..addListener(
        () {
          notifyListeners();
        },
      )
      ..addStatusListener(
        (AnimationStatus status) {
          switch (status) {
            case AnimationStatus.forward:
              state = PigDrawerState.opening;
              break;
            case AnimationStatus.reverse:
              state = PigDrawerState.closing;
              break;
            case AnimationStatus.completed:
              state = PigDrawerState.closed;
              break;
            case AnimationStatus.dismissed:
              state = PigDrawerState.closed;
              break;
            default:
              state = PigDrawerState.closed;
          }

          notifyListeners();
        },
      );
  }

  double get percentOpen => _animationController.value;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  ///[open] is used to open the
  void open() {
    _animationController.forward();
  }

  void close() {
    _animationController.reverse();
  }
}

enum PigDrawerState { open, closed, opening, closing }
