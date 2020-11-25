import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class WebView extends StatelessWidget{
  final String url;
  final String appbarTitle;
  WebView(this.url, this.appbarTitle);


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      javascriptChannels: jsChannels,
      appCacheEnabled: true,
      allowFileURLs: true,
      ignoreSSLErrors: true,
      withJavascript: true,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(
        title: Text(appbarTitle??""),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      //initialChild: Center(child: CircularProgressIndicator()),
    );
  }

}