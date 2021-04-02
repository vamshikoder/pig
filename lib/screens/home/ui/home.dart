import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/config/config.dart';
import 'package:pig/widgets/global_utility_widgets.dart';
import 'package:pig/widgets/pig_drawer.dart';
import 'package:pig/widgets/pig_search_bar.dart';

///Don't forget to import [pigdrawer.dart] and [config.dart]
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late PigDrawerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PigDrawerController(vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PigDrawer(
          controller: _controller, menu: HomeMenu(), scaffold: HomeScaffold()),
    );
  }
}

///[PigDrawer] which wraps around [Home] and [Menu]

///implement your [Home] below.
///[recommended] it is good to move [HomeScaffold] to different [file]
class HomeScaffold extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// remove [Scaffold] use [CustomScaffold] instead
    return const KeyboardDismissiableWrapper(
      child: CustomScaffold(
        body: Center(child: PigSearchBar()),
      ),
    );
  }
}

///implement your [Menu] below
///[recommended] it is good to move [HomeMenu] to different [file]
class HomeMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// remove [Scaffold] use [CustomScaffold] instead
    return const Scaffold(
      body: Heading1('Home Menu'), // write your menu code here
    );
  }
}
