import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApplyForm extends StatefulWidget {
  @override
  _ApplyFormState createState() => _ApplyFormState();
}

class _ApplyFormState extends State<ApplyForm> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
                initialUrl:
                    "https://afa.coplsaas.com.au/afa/quote/index.html?businessManagerID=139&badgeType=A&introducerID=1252&applicationStageIndicator=LAS",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            ),
        );
        }
}
