// Demo 测试statefulWidget生命周期
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CounterWiget extends StatefulWidget {

  // const CounterWiget({Key key, this.initValue: 0});
  // final int initValue;

  _CounterWigetState createState() => _CounterWigetState();
}

class _CounterWigetState extends State<CounterWiget> {
  int _counter;

  @override
  void initState() {
    super.initState();

    //初始化状态
    // _counter = widget.initValue;
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });

    print("initState");
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    print('$dir');
    return File('$dir/count.txt');
  }

  // read counter file
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = file.readAsStringSync();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    (await _getLocalFile()).writeAsStringSync('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('File operation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        //点击后计数器自增
        // onPressed: () => setState(
        //       () => ++_counter,
        //     ),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void didUpdateWidget(CounterWiget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
