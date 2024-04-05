import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/descriptionNews/descriptionNews_screen.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/models/news_response/atricle.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewContainer extends StatefulWidget {
  static const String route_name = "/webViewContainer";
  const webViewContainer({
    super.key,
  });

  @override
  State<webViewContainer> createState() => _webViewContainerState();
}

class _webViewContainerState extends State<webViewContainer> {
  @override
  Widget build(BuildContext context) {
     homeProvider providerhome = Provider.of<homeProvider>(context);
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(providerhome.newsUrl??""));
    return Scaffold(
      appBar: AppBar(title: Text("WebView",style: TextStyle(color: Colors.white),)),
      backgroundColor: Colors.white,
      body: WebViewWidget(controller: controller),
    );
  }
}
