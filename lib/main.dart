import 'package:flutter/material.dart';
import 'package:menu_demo/geofencing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GeofencingPage(title: 'MENU - Geofence Service'),
    );
  }
}
