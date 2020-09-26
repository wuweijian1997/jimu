import 'package:flutter/material.dart';
import 'package:jimu/common/index.dart';

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

  static pushNamedAndRemoveUntil(String newRouteName, {arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        newRouteName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static pushAndRemoveUntilTransitions(String routeName,
      {Duration duration = const Duration(milliseconds: 1000),
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

  static pushName(String routeName, {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static pushTransitions(String routeName,
      {Duration duration = const Duration(milliseconds: 1000),
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
