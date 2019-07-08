import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class GXWebViewPage extends StatefulWidget {

  final String url;
  final String title;

  GXWebViewPage(this.url,this.title);

  _GXWebViewPageState createState() => _GXWebViewPageState();
}

class _GXWebViewPageState extends State<GXWebViewPage> {


  // final String _url;
  // final String _title;

    // 构造函数
  // _GXWebViewPageState(this._url, this._title): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            tooltip: 'Back to flutter Navigator',
            icon:Icon(Icons.chevron_left) ,
            onPressed: () => Navigator.pop(context, false),
          )
        ],
      ),

      body: WebviewScaffold(
        url: widget.url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}