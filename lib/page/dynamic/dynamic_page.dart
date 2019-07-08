import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_flutter/utils/net_utils.dart';

import 'package:my_flutter/model/dynamic.dart';
import 'package:my_flutter/page/dynamic/dynamic_page_item.dart';
import 'package:my_flutter/widget/drawer_widget.dart';

class DynamicPage extends StatefulWidget {
  // print(){
  //    List numList = [1,2,3,4];
  //   var any = numList.any((num) => num > 3);
  //   print(); //只要有>3的任何元素,返回true
  // }

  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> with AutomaticKeepAliveClientMixin {

  // Choice _selectedChoice = choices[0]; // The app's "state".

  List<DynamicModel> dynamicList = new List();

  int pageIndex = 0;

  bool isShowLoading = false;

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    // setState(() {
    // _selectedChoice = choice;
    // });

    print(choice.title.toString());
  }

  // Future<Map> getIndexListData([Map<String, dynamic> params]) async {
  //   const juejin_flutter = 'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
  //   var pageIndex = (params is Map) ? params['pageIndex'] : 0;
  //   final _param  = {'page':pageIndex,'pageSize':20,'sort':'rankIndex'};
  //   var responseList = [];
  //   var  pageTotal = 0;

  //   try{
  //     var response = await NetUtils.get(juejin_flutter, _param);
  //     responseList = response['d']['entrylist'];
  //     pageTotal = response['d']['total'];
  //     if (!(pageTotal is int) || pageTotal <= 0) {
  //       pageTotal = 0;
  //     }
  //   }catch(e){

  //   }
  //   pageIndex += 1;
  //   List resultList = new List();
  //   for (int i = 0; i < responseList.length; i++) {
  //     try {
  //       DynamicModel cellData = new DynamicModel.fromJson(responseList[i]);  // 解析json
  //       resultList.add(cellData);
  //     } catch (e) {
  //       // No specified type, handles all
  //     }
  //   }
  //   Map<String, dynamic> result = {"list":resultList, 'total':pageTotal, 'pageIndex':pageIndex};
  //   return result;
  // }

  Future<Null> _getNewsData() async {
    const juejin_flutter =
        'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    // var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param = {'page': pageIndex, 'pageSize': 20, 'sort': 'rankIndex'};
    var responseList = [];
    var pageTotal = 0;

    try {
      var response = await NetUtils.get(juejin_flutter, _param);
      responseList = response['d']['entrylist'];
      pageTotal = response['d']['total']; // 获取总page数
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }


      setState(() {
        for (int i = 0; i < responseList.length; i++) {
          DynamicModel cellData = new DynamicModel.fromJson(responseList[i]); // 解析json
          print('+++++++++' + cellData.title);
          dynamicList.add(cellData);
        }

        isShowLoading = false;
        return null;
      });

    } catch (e) {
      return null;
    }
  }

  /// item的样式
  Widget makeCard(index, model) {
    var myTitle = '${model.title}';
    var myUsername = '${'👲'}: ${model.username} ';
    var codeUrl = '${model.detailUrl}';
    return DynamicItem(itemTitle: myTitle, itemUrl: codeUrl, data: myUsername);
  }

  /// pull down refresh
  Future<Null> _refresh() async {
    // reset data
    dynamicList.clear();
    pageIndex = 0;
    await _getNewsData();
    return;
  }

  /// pull up refresh
  Future<Null> _getMoreData() async {
    if (!isShowLoading) {
      setState(() {
        isShowLoading = true;
      });

      pageIndex++;
      await _getNewsData();
    }

  }

  // 加载更多 Widget
  Widget _buildProgressIndicator() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 14.0),
        child: Opacity(
            opacity: isShowLoading ? 1.0 : 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // new SpinKitChasingDots(color: Colors.blueAccent, size: 26.0),
                Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: Text('正在加载中...'))
              ],
            )));
  }

  ScrollController _scrollController = new ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 当滑到最底部时调用
        _getMoreData();
      }
    });

    _getNewsData();
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

        // leading: new IconButton(
        //   icon: new Icon(Icons.home),
        //   color: Colors.white,
        //   disabledColor: Colors.white,
        //   tooltip: 'Navigation menu',
        //   onPressed: null,
        // ),

        ///这个title是一个Widget
        title: new Text("Flutter动态"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(choices[0].icon),
            tooltip: 'Search',
            onPressed: () {
              _select(choices[0]);
            },
          ),

          new IconButton(
            // iconSize: 2,
            icon: new Icon(choices[1].icon),
            color: Colors.white,
            onPressed: () {
              _select(choices[1]);
            },
          ),

          // overflow menu
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
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

      drawer: Drawer(
        child: DrawerWidget(), // 记得包一层
      ),

      // //正式的页面开始
      // body: ListView.builder(
      //   itemBuilder: (BuildContext context, int index /*context, index*/) {
      //     DynamicModel model = resultList[index];
      //     return makeCard(index, model);
      //     // return DynamicItem(itemTitle:model.title,itemUrl:model.detailUrl,data:model.username);
      //   },
      //   itemCount: resultList.length,
      //   // separatorBuilder: (BuildContext context,int index){
      //   //   return index%2==0?Divider(color: Colors.blue):Divider(color: Colors.green);
      //   // },
      // ),

      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: _refresh,
          backgroundColor: Colors.white,
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (index == dynamicList.length) {
                return _buildProgressIndicator();
              } else {
                DynamicModel model = dynamicList[index];
                return makeCard(index, model);
              }
            },
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: dynamicList.length + 1,
            controller: _scrollController,
          ),
        ),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ChoiceCard(choice: _selectedChoice),
      // ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

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
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon,
                size: 128.0, color: textStyle.color), // 设置图片的大小以及图片颜色
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
