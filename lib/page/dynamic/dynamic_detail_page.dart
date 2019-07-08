import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class DynamicDetailPage extends StatefulWidget {

  final String url;
  final String title;

  DynamicDetailPage(this.url,this.title);

  _DynamicDetailPageState createState() => _DynamicDetailPageState();
}

class _DynamicDetailPageState extends State<DynamicDetailPage> {


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
            tooltip: 'Collection',
            color: Colors.white,
            disabledColor: Colors.white,
            icon:Icon(Icons.favorite),
            onPressed:null,
          ),
        ],
        // leading:  IconButton(
        //   icon: Icon(Icons.chevron_left),
        //   color: Colors.white,
        //   disabledColor: Colors.white,
        //   tooltip: 'Back to flutter Navigator',
        //   onPressed: ()=> Navigator.pop(context,false),
        // ),
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