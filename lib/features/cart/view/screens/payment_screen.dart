import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';

class PaymentScreen extends StatefulWidget {
  final String url;
  const PaymentScreen({required this.url, Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'messageHandler',
        onMessageReceived: (JavaScriptMessage message) {
          var jsonData = jsonDecode(message.message);
          if (jsonData['status'] == 'CANCELLED') {
            // handle cancel
          } else if (jsonData['status'] == 'SUCCESS') {
            // handle success
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            print("url: $url");
            if (url.contains("success-callback")) {
              CustomSnakbar().appSnackBar(isFaild: false, text: 'success');
            }
            if (url.contains("error-callback")) {
              CustomSnakbar().appSnackBar(isFaild: true, text: 'fail');
              Navigator.pop(context);
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains("success")) {
              CustomSnakbar().appSnackBar(isFaild: false, text: 'success');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(controller: _controller),
    );
  }
}
