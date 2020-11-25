import 'package:auto_route/auto_route_annotations.dart';
import 'package:newsapp/views/home/home_view.dart';
import 'package:newsapp/views/webView/webView.dart';

import '../main.dart';

/// run these code in terminal to generate route setting
/// flutter packages pub run build_runner watch --delete-conflicting-outputs (while development)
/// flutter packages pub run build_runner build (one time)

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeView;
  WebView webView;
}
