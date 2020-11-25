// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:newsapp/views/home/home_view.dart';
import 'package:newsapp/views/webView/webView.dart';

abstract class Routes {
  static const homeView = '/';
  static const webView = '/web-view';
  static const all = {
    homeView,
    webView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.webView:
        if (hasInvalidArgs<WebViewArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<WebViewArguments>(args);
        }
        final typedArgs = args as WebViewArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => WebView(typedArgs.url, typedArgs.appbarTitle),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//WebView arguments holder class
class WebViewArguments {
  final String url;
  final String appbarTitle;
  WebViewArguments({@required this.url, @required this.appbarTitle});
}
