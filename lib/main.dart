import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_flutter/BasicAppBarSample.dart';
import 'package:my_flutter/page/tabber_bottom_page.dart';

/* 自定义AppBar */
class MyAppBar extends StatelessWidget {
   
   MyAppBar({this.title});  // 构造函数

  // Widget子类中的字段往往都会定义为"final"
  // const值编译期确定 final值运行期确定

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter, // row居中显示
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(color: Colors.blue),
      // Row 是水平方向的线性布局（linear layout）
      // Icon Menu(IconButton) -->  title(Expanded) -->  Icon Search(IconButton)
      child: Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null, // 禁用button
            color: Colors.white,
          ),

          // 经常与row和column在一起使用
          new Expanded(
            child: Text(
              // 注意TextSpan  显示不同的字体
              'MyAppBar-MyAppBar-MyAppBar-MyAppBar',
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              textScaleFactor: 1, // 字体倍数
              softWrap: false, // 自动换行
              overflow: TextOverflow.ellipsis, //当文字超出屏幕的时候，如何处理 省略号
              // maxLines: 2,
              style: TextStyle(
                // height: 30,
                fontSize: 18,
                color: Colors.white,
                // fontFamily:,
                wordSpacing: 6, // 单词间距
                letterSpacing: 2, // 字符间距
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline, // 文字装饰
              ),
            ),
          ),

          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'My AppBar',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),

          //只有一个子 Widget。在 Column 和 Row 中充满。
          new Expanded(
            child: new Center(
              child: new Text('Hello world'),
            ),
          ),
        ],
      ),
    );
  }
}

// 测试自定义AppBar
// void main() {
//   runApp(
//     new MaterialApp(
//       title: 'My app',
//       home: new MyScaffold(),
//     )
//   );
// }

// center widget作为runapp
// void main() {
//   runApp(
//     new Center(
//       child: new Text(
//         'Hello world',
//         textDirection: TextDirection.ltr,
//       ),
//     ),
//   );
// }

// 测试2 调用方法其实和测试3一样
void main() {
  runApp(new DemoApp());
}

// 无状态的StatelessWidget
class DemoApp extends StatelessWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // MaterialApp：APP顶层主页入口
      title: 'First demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BasicAppBarSample(),
      home: TabBarBottomPageWidget(),
    );
  }
}

// 测试3
// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
