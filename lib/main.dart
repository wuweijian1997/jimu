import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jimu/common/index.dart';

void main() {
  init();
  runApp(MyApp());
}

///初始化
void init() {
  ///沉浸屏
  final SystemUiOverlayStyle style =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(style);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///隐藏状态栏
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'JiMu',
      navigatorKey: NavigatorUtil.navigatorKey,
      initialRoute: AppRoutes.INITIAL_ROUTE,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: AppRoutes.configRoutes,
    );
  }
}
