import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebApp extends StatefulWidget {
  WebApp({Key? key}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  late final String appUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("WebPages"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: Uri.parse("https://kyumainotobira.com/"))),
              )
            ],
          ),
        ));
  }
}

class _viewWebApp {
  final String appUrl;

  _viewWebApp({required this.appUrl});
}
