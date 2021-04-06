import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../widgets/global_utility_widgets.dart';

class Account extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return CustomScaffold(
      title: 'account', // remove this line if you don't need a title
      backArrowTap: () => Get.back(),

      /// similar to [body] in [Scaffold]
      body: const Text('Body Code'),
    );
  }
}
