import 'package:clothed/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = "Test";

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState),
        ],
      ),
    );
  }
}

