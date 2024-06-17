import 'package:flutter/material.dart';
import 'package:responesive_ui_app/layout/responsive_layout.dart';
import 'package:responesive_ui_app/view/home/screen/desktop_scaffold.dart';
import 'package:responesive_ui_app/view/home/screen/mobile_scaffold.dart';
import 'package:responesive_ui_app/view/home/screen/tablet_scaffold.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weeken', // show when run as web
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayoutScreen(
          mobileScaffold: const MobileScaffold(),
          tabletScaffold: const TabletScaffold(),
          desktopScaffold: const DesktopScaffold()),
    );
  }
}
