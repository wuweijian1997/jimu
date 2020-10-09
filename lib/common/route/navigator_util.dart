import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';
import 'package:jimu/pages/index.dart';

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(opacity: animation, child: child);
}

class NavigatorUtil {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static get context => navigatorKey.currentContext;

  static NavigatorState get currentState => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    Log.info('routeName: ${setting.name}', StackTrace.current);
    if (setting.name == PasswordLoginPage.rName) {
      return CupertinoPageRoute(builder: (ctx) {
        final phoneModel = setting.arguments as PhoneModel;
        return PasswordLoginPage(phoneModel: phoneModel,);
      });
    }
    return null;
  }

  static pushNamedAndRemoveUntil(String newRouteName, {arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        newRouteName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static transitionsPushAndRemoveUntil(String routeName,
      {Duration duration = const Duration(milliseconds: 300),
      RouteTransitionsBuilder routeTransitionsBuilder =
          _defaultTransitionsBuilder}) {
    return Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            transitionDuration: duration,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return routeTransitionsBuilder(
                  context,
                  animation,
                  secondaryAnimation,
                  AppRoutes.configRoutes[routeName].call(context));
            }),
        (Route<dynamic> route) => false);
  }

  static pushName(String routeName,
      {WidgetBuilder builder, Object arguments, bool fullscreenDialog = false}) {
    return Navigator.of(context).push(CupertinoPageRoute(
      builder: builder ?? AppRoutes.configRoutes[routeName],
      settings: RouteSettings(name: routeName, arguments: arguments),
      fullscreenDialog: fullscreenDialog,
    ));
  }

  static transitionsPush(String routeName,
      {Duration duration,
      RouteTransitionsBuilder routeTransitionsBuilder =
          _defaultTransitionsBuilder}) {
    return Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: duration,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return routeTransitionsBuilder(context, animation, secondaryAnimation,
              AppRoutes.configRoutes[routeName].call(context));
        }));
  }

}
