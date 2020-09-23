import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartupScreenPage extends StatefulWidget {
  static const String rName = 'StartupScreenPage';

  @override
  _StartupScreenPageState createState() => _StartupScreenPageState();
}

class _StartupScreenPageState extends State<StartupScreenPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container();
  }
}
