import 'package:flutter/material.dart';

import 'package:my_flutter/Widget/TabBarWidget.dart';
// import 'package:my_flutter/Page/TabBarPageFirst.dart';
import 'package:my_flutter/Page/dynamic_page/dynamic_page.dart';
import 'package:my_flutter/Page/Map/map_page.dart';
import 'package:my_flutter/Page/widget_page/widget_page.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  // name({Key key}) : super(key: key);

@override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {

  final PageController topPageController = new PageController();
  final List<String> tab = ['动态','Map','Widget'];

  _renderTab(){

    return [
      Tab(text: "动态",icon: Icon(Icons.language),),
      Tab(text: "Map",icon:Icon(Icons.map)),
      Tab(text: "Widget",icon: Icon(Icons.extension)),
    ];

    // List<Widget> list = new List();
    // for (var i = 0; i < tab.length; i++) {
    //   list.add(
    //     new FlatButton(
    //       onPressed: (){
    //         topPageController.jumpTo(MediaQuery.of(context).size.width*i);
    //       },
    //       child: Text(
    //         tab[i],
    //         maxLines: 1,
    //       ),
          
    //     )
    //   );
    // }

    // return list;
  }


  _renderPage(){
    return[
      new DynamicPage(),
      new MapPage(),
      new WidgetPage(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      // topPageController: topPageController,
      backgroundColor:Colors.red,
      indicatorColor: Colors.white,
      title: Text('TabBar Demo'),
    );
  }
}

