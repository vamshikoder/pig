import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/global_utility_widgets.dart';

class Signin extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return const CustomScaffold(
      title: 'settings', // remove this line if you don't need a title
      /// similar to [body] in [Scaffold]
      body: Text('Body Code'),
    );
  }
}
