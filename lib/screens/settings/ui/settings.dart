import 'package:flutter/material.dart';
import '../../../widgets/global_utility_widgets.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'settings', // remove this line if you don't need a title
      /// similar to [AppBar] in [Scaffold]
      head: [
        //your Widgets
      ],

      /// similar to [body] in [Scaffold]
      body: Text('Body Code'),
    );
  }
}
