import 'package:flutter/material.dart';

import 'package:my_flutter/Widget/tabbar_widget.dart';
import 'package:my_flutter/Widget/life_cycle_widget.dart';

import 'package:my_flutter/page/dynamic/dynamic_page.dart';
import 'package:my_flutter/page/map/map_page.dart';
import 'package:my_flutter/page/widget/widget_page.dart';
import 'package:my_flutter/page/net/websocket_page.dart';

class TabBarBottomPageWidget extends StatefulWidget {

  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
 
  // final PageController topPageController = new PageController();
  // final List<String> tab = ['动态','Map','Widget'];

  _renderTab() {
    return [
      Tab(
        text: "动态",
        icon: Icon(Icons.language),
      ),
      Tab(text: "Map", icon: Icon(Icons.map)),
      Tab(text: "NetWork", icon: Icon(Icons.network_check)),
      Tab(text: "life", icon: Icon(Icons.wb_cloudy)),
    ];

    /*List<Widget> list = new List();
    for (var i = 0; i < tab.length; i++) {
      list.add(new FlatButton(
        onPressed: () {
          topPageController.jumpTo(MediaQuery.of(context).size.width * i);
        },
        child: Text(
          tab[i],
          maxLines: 1,
        ),
      ));
    }

    return list;*/
  }

  _renderPage() {
    return [
      new DynamicPage(),
      new MapPage(),
      // new WidgetPage(),
      new WebsocketRoute(),
      new CounterWiget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      tabItems: _renderTab(),
      tabViews: _renderPage(),
      // topPageController: topPageController,
      backgroundColor: Colors.blue,
      indicatorColor: Colors.white,
      title: Text('TabBar Demo'),
    );
  }
}
