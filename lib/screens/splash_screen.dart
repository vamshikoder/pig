import 'package:flutter/material.dart';

import '../config/config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            CircularProgressIndicator(
              backgroundColor: primaryColor,
              strokeWidth: 5.0,
              valueColor:
                  AlwaysStoppedAnimation<Color>(primaryColor.withAlpha(55)),
            )
          ],
        ),
      ),
    );
  }
}
