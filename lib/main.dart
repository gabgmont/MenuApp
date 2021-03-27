import 'package:flutter/material.dart';

import 'screens/menu.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuWidget(),
      theme: ThemeData(
        primaryColor: Colors.purple[600],
        accentColor: Colors.amberAccent[700],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.amberAccent[700],
            onPrimary: Colors.white,
          ),
        ),
      ),
    );
  }
}
