import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../widgets/global_utility_widgets.dart';

class Settings extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return PigCustomScaffold(
      title: 'settings', // remove this line if you don't need a title
      /// similar to [body] in [Scaffold]
      backArrowTap: () {
        Get.back();
      },
      body: const Text('Body Code'),
    );
  }
}
