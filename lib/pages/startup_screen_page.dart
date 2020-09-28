import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';
import 'package:jimu/pages/index.dart';

///启动页
class StartupScreenPage extends StatefulWidget {
  static const String rName = 'StartupScreenPage';

  @override
  _StartupScreenPageState createState() => _StartupScreenPageState();
}

class _StartupScreenPageState extends State<StartupScreenPage> {
  @override
  void initState() {
    super.initState();
    this.init();
  }

  ///初始化操作,检查登录信息或更新信息等.
  void init() async {
    String token = await StorageUtil.get(StorageKeys.TOKEN);
    if(token == null || token.isEmpty) {
      delayed(() {
        NavigatorUtil.transitionsPushAndRemoveUntil(LoginPage.rName);
      });
    }
  }

  delayed(VoidCallback callback) {
    Future.delayed(Duration(milliseconds: 1000), () => callback?.call());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                  child: Image.asset(
                Assets.icon_splash_content,
                height: 70,
              )),
            ),
            Text(
              'FOCUS ON YOUTH SOCIAL NETWORK',
              style: Theme.of(context).textTheme.headline6.copyWith(color: const Color(0xff000000)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'FIND|CONNECT|DATE|YOUTH CULTURE',
              style: Theme.of(context).textTheme.overline.copyWith(color: Colors.white.withOpacity(0.8)),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
