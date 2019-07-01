import 'package:flutter/material.dart';
import 'package:my_flutter/DemoItem.dart';


class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => _BasicAppBarSampleState();
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {


  Choice _selectedChoice = choices[0]; // The app's "state".
  

  void _select(Choice choice){
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }


  @override
  Widget build(BuildContext context) {
    ///一个页面的开始
    ///如果是新页面，会自带返回按键
    return new Scaffold(

      // 1.系统 AppBar
      // appBar:new MyAppBar(
      //   title: new Text(
      //     'Custom AppBar',
      //     style:Theme.of(context).primaryTextTheme.title,
      //   ),
      // ),


      // 2.自定义AppBar
      appBar: new AppBar(

        backgroundColor: Colors.blue,

        leading: new IconButton(
          icon: new Icon(Icons.menu),
          color: Colors.white,
          disabledColor: Colors.white,
          tooltip: 'Navigation menu',
          onPressed: null,
        ),

        ///这个title是一个Widget
        title: new Text("Basic AppBar"),
        actions: <Widget>[
          
          new IconButton(
            icon: new Icon(choices[0].icon),
            tooltip: 'Search',
            onPressed: (){
              _select(choices[0]);
            },
          ),
          
          new IconButton(
            // iconSize: 2,
            icon: new Icon(choices[1].icon),
            color: Colors.white,
            onPressed: (){
              _select(choices[1]);
            },
          ),

          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context){
              return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
            },
          ),
        ],
      ),

      ///背景样式
      // backgroundColor: Colors.lightBlue,

      //正式的页面开始  一个ListView，20个Item
      // body: new ListView.builder(
      //   itemBuilder: (context, index) {
      //     return new DemoItem();
      //   },
      //   itemCount: 20,
      // ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChoiceCard(choice: _selectedChoice),
      ),

    );
  }
}


class  Choice{
   const Choice({this.title,this.icon});

   final String title;
   final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];


// 主体部分
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key,this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon,size: 128.0,color: textStyle.color),  // 设置图片的大小以及图片颜色
            Text(choice.title,style:textStyle),
          ],
        ),
      ),
    );
  }
}