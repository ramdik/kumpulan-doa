import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);
  static Future<String> get _url async {
    await Future.delayed(const Duration(seconds: 1));
    return 'https://muslim.or.id/';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: FutureBuilder(
              future: _url,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  snapshot.hasData
                      ? WebViewWidget(
                          url: snapshot.data,
                        )
                      : const CircularProgressIndicator(strokeWidth: 2)),
        ),
      );
}

class WebViewWidget extends StatefulWidget {
  final String url;
  const WebViewWidget({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewWidget createState() => _WebViewWidget();
}

class _WebViewWidget extends State<WebViewWidget> {
  late WebView _webView;
  @override
  void initState() {
    super.initState();
    _webView = WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: null_check_always_fails
    _webView;
  }

  @override
  Widget build(BuildContext context) => _webView;
}
