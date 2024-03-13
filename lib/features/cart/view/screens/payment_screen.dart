import 'dart:convert';
import 'dart:io';
import 'package:bino_kids/common/widgets/custom_snakbar.dart';
import 'package:flutter/Material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String url;
  const PaymentScreen({
    required this.url,
    Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:

    WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: Set.from([
        JavascriptChannel(
            name: 'messageHandler',
            onMessageReceived: (JavascriptMessage message) {
              print(message.message);
              var jsonData = jsonDecode(message.message);
              if(jsonData['status'] == 'CANCELLED'){
                // Your code
              }else if(jsonData['status'] == 'SUCCESS'){
                // Your code
              }
            })
      ]),
      onPageFinished: (value){
        print("url:$value" );
        if (value.toString().contains("success-callback")){
          CustomSnakbar().appSnackBar(isFaild: false,text: 'success');
        }
        if(value.toString().contains("error-callback")){

          CustomSnakbar().appSnackBar(isFaild: true,text: 'fail');
          Navigator.pop(context);
        }

      },
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.currentUrl().then((value) {
          print("url:$value" );
          if (value.toString().contains("success-callback")){
            CustomSnakbar().appSnackBar(isFaild: false,text: 'success');
          }
          if(value.toString().contains("error-callback")){
            CustomSnakbar().appSnackBar(isFaild: true,text: 'fail');
            Navigator.pop(context);
          }
        });
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains("success")){
          CustomSnakbar().appSnackBar(isFaild: false,text: 'success');
          return NavigationDecision.prevent;
        }

        return NavigationDecision.navigate;
      },
    )

      ,);
  }
}
