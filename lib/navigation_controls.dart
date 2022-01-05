import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  final Future<WebViewController> _controllerFuture;
  const NavigationControls(this._controllerFuture, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _controllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return Row(
            children: <Widget>[
              _buildHistoryBackBtn(context),
              // _buildReloadBtn(controller),
              //_buildHistoryForwardBtn(context, controller),
            ],
          );
        }
        return Container();
      },
    );
  }

  _buildHistoryBackBtn(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/zjobeur-logo-200x41.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
    );
  }
/*
 * FlatButton _buildHistoryBackBtn(
      BuildContext context, AsyncSnapshot<WebViewController> controller) {
    return FlatButton(
      color: Colors.white,
      child: Row(children: <Widget>[
        Icon(Icons.arrow_left),
        Text('precedent'),
      ]),
      onPressed: () async {
        if (await controller.data.canGoBack()) {
          controller.data.goBack();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Pas d'historique pour la page précedente",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }
 */

/*
 * FlatButton _buildHistoryForwardBtn(
      BuildContext context, AsyncSnapshot<WebViewController> controller) {
    return FlatButton(
      textColor: Colors.red,
      child: Row(children: <Widget>[
        Text('suivant'),
        Icon(Icons.arrow_right),
      ]),
      onPressed: () async {
        if (await controller.data.canGoForward()) {
          controller.data.goForward();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Pas d'historique pour la page suivante",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }

  _buildReloadBtn(AsyncSnapshot<WebViewController> controller) {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        controller.data.reload();
      },
    );
  }
 */

}
