import 'package:flutter/material.dart';
import 'package:pig/widgets/global_utility_widgets.dart';
import 'config/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIG',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpacer(factor: 3),
          heading('heading'),
          vSpacer(),
          heading1('heading1'),
          vSpacer(),
          heading2('heading2'),
          vSpacer(),
          subText('subtext'),
          vSpacer(),
          subTitle('subtitle'),
          vSpacer(),
          cubeContainer(
            const Center(
              child: Text('data'),
            ),
          ),
          vSpacer(),
          pigArrow(2),
        ],
      ),
    );
  }
}
