
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:my_flutter/Widget/gradient_button_widget.dart';

class WebsocketRoute extends StatefulWidget {
  _WebsocketRouteState createState() => _WebsocketRouteState();
}

class _WebsocketRouteState extends State<WebsocketRoute> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    //创建websocket连接
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Websocket内容回显'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cast_connected), onPressed: null)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GradientButton(
              colors: [Colors.lightGreen, Colors.green[700]],
              height: 50.0,
              child: Text("发送渐变按钮消息"),
              onTap: _onTap,
            ),
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  _text = "can not connect to net";
                } else if (snapshot.hasData) {
                  _text = "echo:\n" + snapshot.data;
                }

                print('======================$_text');
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send Message',
        child: Icon(Icons.send),
      ),
    );
  }

  // message: Client -> Server
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
      channel.stream
          .listen(this.onData, onError: onError, onDone: onDone); // 设置监听

    }
  }

  void _onTap(){
    channel.sink.add('我是渐变按钮');
  }

  void _reconnect() {
    channel.sink.close();
    // channel.sink.
  }

  onDone() {
    // 断开后自动重新🔗
    print("Socket is closed");
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    this._sendMessage();
  }

  onError(err) {
    print(err.runtimeType.toString());
    WebSocketChannelException ex = err;
    print(ex.message);
  }

  onData(event) {
    setState(() {
      _text = event;
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
