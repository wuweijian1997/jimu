import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jimu/common/index.dart';

class StartupScreenPage extends StatefulWidget {
  static const String rName = 'StartupScreenPage';

  @override
  _StartupScreenPageState createState() => _StartupScreenPageState();
}

class _StartupScreenPageState extends State<StartupScreenPage> {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
                child: Image.asset(
              Assets.icon_splash_content,
              width: 200.dp,
              height: 120.dp,
            )),
          ),
          Text(
            'FOCUS ON YOUTH SOCIAL NETWORK',
            style: Theme.of(context).textTheme.headline6.copyWith(color: const Color(0xff000000)),
          ),
          SizedBox(
            height: 10.dp,
          ),
          Text(
            'FIND|CONNECT|DATE|YOUTH CULTURE',
            style: Theme.of(context).textTheme.overline.copyWith(color: Colors.white.withOpacity(0.5)),
          ),
          SizedBox(
            height: 60.dp,
          )
        ],
      ),
    );
  }
}
