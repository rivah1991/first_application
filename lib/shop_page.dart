import 'dart:async';

//import 'package:rivah_app/navigation_controls.dart';
import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShopPage extends StatefulWidget {
  ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  //var _title = '';
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Image.asset(
              'assets/zjobeur-logo-200x41.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container()
          ],
        ),
        //  title: Text(_title),
        //
        //  actions: <Widget>[
        //  NavigationControls(_controller.future),
        //],
      ),
      body: _buildWebView(),
      // floatingActionButton: _buildShowUrlBtn(),
    );
  }

  Widget _buildWebView() {
    var webView = WebView(
      javascriptMode: JavascriptMode.unrestricted,
      //initialUrl: 'https://demo.allo-wewa.xyz/recevoir_code.php',
      // initialUrl: 'https://demo.allo-wewa.xyz/montest/mapgeoloc/',
      initialUrl: 'https://www.zjobeur.com/app/',
      //javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (request) {
        return _buildNavigationDecision(request);
      },

      javascriptChannels: <JavascriptChannel>[
        _createTopBarJsChannel(),
      ].toSet(),
      onPageFinished: (url) {
        //  _showPageTitle();
      },
    );
    return webView;
  }
/*
 * Widget _buildChangeTitleBtn() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _title = 'Apprendre le flutter';
        });
      },
      child: Icon(Icons.link),
    );
  }

  Widget _buildShowUrlBtn() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              String url = await controller.data.currentUrl();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "l'url actuelle est: $url",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
            child: Icon(Icons.link),
          );
        }

        return Container();
      },
    );
  }
 */

  NavigationDecision _buildNavigationDecision(NavigationRequest request) {
    if (request.url.contains('my-account')) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            "Vous n'avez pas le droit d'accéder à la page Mon compte",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }
/*
 *   void _showPageTitle() {
    _controller.future.then((webViewController) {
      webViewController
          .evaluateJavascript('TopBarJsChannel.postMessage(document.title);');
    });
  }
 */

  JavascriptChannel _createTopBarJsChannel() {
    return JavascriptChannel(
        name: 'TopBarJsChannel',
        onMessageReceived: (message) {
          String newTitle = message.message;
          if (newTitle.contains('-')) {
            newTitle = newTitle.substring(0, newTitle.indexOf('-')).trim();
          }
          setState(() {
            // _title = newTitle;
          });
        });
  }
}
