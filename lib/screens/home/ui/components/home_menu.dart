import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/config/config.dart';

///implement your [Menu] below
///[recommended] it is good to move [HomeMenu] to different [file]
class HomeMenu extends ConsumerWidget {
  const HomeMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// remove [Scaffold] use [CustomScaffold] instead
    return const Scaffold(
      body: Heading1('Home Menu'), // write your menu code here
    );
  }
}
