//~ This file contains all the reusable Wigets that
//~ are specifically made for PIG saves time and
//& Made by PIG

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

import '../config/config.dart';

import '../providers/user_state_provider.dart';

class PigCube extends StatelessWidget {
  /// [PigCube] is a basic [Container] with pre configured
  /// [Size] and [decoration]

  final double? height;
  final double? width;

  /// [color] specify the color of the [Container]
  final Color color;

  ///[onTap] specify the action that you want to perform.
  final VoidCallback? onTap;

  /// [child] is the contents in the [PigCube]
  final Widget child;

  const PigCube({
    Key? key,
    required this.child,
    this.color = white,
    this.onTap,
    this.height = 125.0,
    this.width = 125.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: rSHeight(height!),
        width: rSWidth(width!),
        decoration: BoxDecoration(
          color: color,
          borderRadius: lightBorderRadius,
          boxShadow: lightBoxShadow,
        ),
        child: child,
      ),
    );
  }
}

class PigArrow extends StatelessWidget {
  ///[PigArrow] is a [icons] configured so that it can
  ///be used everywhere while changing [turns] parameter that changes [angle]
  ///of the icon

  ///[turns] is used to change the angle takes [double]
  final double turns;

  const PigArrow({Key? key, required this.turns}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: turns.toInt(),
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: primaryColor,
        size: 15,
      ),
    );
  }
}

class PigPaddingContainer extends StatelessWidget {
  ///[PigPaddingContainer] is a custom container for [PIG]
  ///with preconfigured [padding] for [PIG]

  ///[Pcontainer] takes [child] parameter to which
  ///needs [padding] to be applied
  final Widget child;
  final SizeFactor? sizeFactor;
  final bool? verticalPadding;

  const PigPaddingContainer(
      {Key? key,
      required this.child,
      this.sizeFactor,
      this.verticalPadding = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _factor;
    switch (sizeFactor) {
      case SizeFactor.full:
        _factor = 1;
        break;
      case SizeFactor.half:
        _factor = 0.5;
        break;
      case SizeFactor.quater:
        _factor = 0.25;
        break;
      case SizeFactor.none:
        _factor = 0.0;
        break;
      default:
        _factor = 0.5;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding(_factor),
        vertical: verticalPadding! ? vPadding(_factor) : 0.0,
      ),
      child: child,
    );
  }
}

class PigSheet extends riverpod.ConsumerWidget {
  ///[PigSheet] creates a container with preconfigured [Theme] and [Size] settings
  ///can be configured as needed using the below [parameters]

  /// provide the [PigSheet] with the [title] which can used to specify the [contents] below the [sheet]
  final String? title;

  /// [height] determines the length of the [sheet].
  final double height;

  ///[child] this where all the [Widgets] under the [PigSheet] should be written
  final Widget child;
  final List<Widget>? icons;
  final VoidCallback? iconTap;

  const PigSheet({
    Key? key,
    this.title,
    required this.child,
    required this.height,
    this.icons,
    @Deprecated("use icons to send multiple iconbuttons instead") this.iconTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, riverpod.ScopedReader watch) {
    //! This defines the [user] details like isManager or not do not remove or changed.
    final userState = watch(userStateProvider.state);
    final String _title = title ?? "";
    final List<Widget> _icons = icons ?? [Container()];
    return Container(
      width: screenWidth,
      height: height,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: lightBorderRadius,
        boxShadow: boxShadow,
      ),
      child: PigPaddingContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_title.isBlank!) const VSpacer(sizeFactor: SizeFactor.half),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Heading2(_title, color: black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _icons,
                )
              ],
            ),
            if (userState.isAuthorized)
              Container()
            else
              const VSpacer(sizeFactor: SizeFactor.quater),
            child,
          ],
        ),
      ),
    );
  }
}

// class ArrowButton {
//   final VoidCallback backArrowTap;

// }

class PigCustomScaffold extends StatelessWidget {
  ///[PigCustomScaffold] Should be used as the [body] of [Scaffold]
  ///this provides custom features which [AppBar] cannot provide.
  ///the App

  /// [head] acts like [AppBar] in [Scaffold] use this to add more elements to the top
  final List<Widget>? head;

  ///[title] describes the page that the user is in.
  final String? title;

  ///[body] is something similar to [body] in [Scaffold]
  final Widget body;

  ///this is a void function which tells what to do when the [backArrow] is [tapped]
  ///this can be used to tell the app to go back to the [previous screen]
  final VoidCallback? backArrowTap;

  const PigCustomScaffold({
    Key? key,
    this.head,
    required this.body,
    this.title,
    // this.extendedHead,
    this.backArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _title = title ?? '';
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: white,
        title: Heading(_title),
        titleSpacing: backArrowTap == null ? hPadding(-0.8) : hPadding(-0.4),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (backArrowTap != null)
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: hPadding(0.25)),
                    child: InkWell(
                      focusColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () {
                        backArrowTap!();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
        actions: head,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [body],
      ),
    );
  }
}

class PigKeyboardDismissiableWrapper extends StatelessWidget {
  /// if there is any [TextFeild] then wrap the entire [screen] with this [Widget]
  final Widget child;

  const PigKeyboardDismissiableWrapper({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: child,
    );
  }
}
