import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/pig_drawer.dart';

import '../providers/notifications_state_provider.dart';

import './components/home_menu.dart';
import './components/home_scaffold.dart';

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
    return BuildHome(controller: _controller);
  }
}

class BuildHome extends ConsumerWidget {
  const BuildHome({
    Key? key,
    required PigDrawerController controller,
  })   : _controller = controller,
        super(key: key);

  final PigDrawerController _controller;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final showNotificationState = watch(showNotificationStateProvider.state);
    final showPostNotificationState =
        watch(showPostNotificationStateProvider.state);
    return Material(
      child: PigDrawer(
        controller: _controller,
        menu: const HomeMenu(key: ValueKey("homeMenu")),
        scaffold: const HomeScaffold(key: ValueKey("homeScaffold")),
        scrollable: !(showNotificationState | showPostNotificationState),
      ),
    );
  }
}

///[PigDrawer] which wraps around [Home] and [Menu]
