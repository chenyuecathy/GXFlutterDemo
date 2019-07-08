import 'package:flutter/material.dart';

import 'package:my_flutter/Utils/navigator_utils.dart';

import 'package:my_flutter/Page/dynamic_page/dynamic_detail_page.dart';

class DynamicItem extends StatelessWidget {
  final String itemUrl;
  final String itemTitle;
  final String data;

  const DynamicItem({Key key, this.itemUrl, this.itemTitle, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // 卡片背景颜色
      elevation: 2.0,      // 卡片的z坐标,控制卡片下面的阴影大小
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: const RoundedRectangleBorder(
        // 圆角
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () { 
              // NavigatorUtils.goDynamicDetail(context, itemUrl, itemTitle);
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context){
                  return new DynamicDetailPage(itemUrl, itemTitle);
                }
              ) );
              }, // 点击事件
            leading: Icon(Icons.home),
            title: Padding(
              child: Text(
                itemTitle,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              padding: EdgeInsets.only(top: 10.0),
            ),

            subtitle: Row(
              children: <Widget>[
                Padding(
                  child: Text(data,
                      style: TextStyle(color: Colors.black54, fontSize: 12.0)),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                )
              ],
            ),

            // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 20.0),
          ),
          // ButtonTheme.bar(
          //   child: ButtonBar(
          //     children: <Widget>[
          //       FlatButton(
          //         child: const Text('Detail',style: TextStyle(color: Colors.black, fontSize: 14.0)),
          //         onPressed: (){ },
          //       ),
          //       FlatButton(
          //         child: const Text('LISTEN',style: TextStyle(color: Colors.black, fontSize: 14.0)),
          //         onPressed: () {  },
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );

/*
    return Card(
      color: Colors.white,  //  卡片背景颜色
      elevation: 2.0, // 卡片的z坐标,控制卡片下面的阴影大小
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: const RoundedRectangleBorder(   // 圆角
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
      child: ListTile(
        onTap: (){},  // 点击事件
        leading: Icon(Icons.access_time),
        title: Padding(
          child: Text(
            itemTitle,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),

          padding: EdgeInsets.only(top: 10.0),
        ),

        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(
                data,
                style: TextStyle(color: Colors.black54, fontSize: 10.0)
              ),
              padding: EdgeInsets.only(top: 10,bottom: 10),
            )
          ],
        ),

        // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 20.0),  

      ),
    );*/
  }
}

// class DynamicItem extends StatefulWidget {
//   @override
//   _DynamicItemState createState() => _DynamicItemState();
// }

// class _DynamicItemState extends State<DynamicItem> {
// ///返回一个居中带图标和文本的Item
//   _getBottomItem(IconData icon, String text) {
//     ///充满 Row 横向的布局
//     return new Expanded(
//       flex: 1,
//       ///居中显示
//       child: new Center(
//         ///横向布局
//         child: new Row(
//           ///主轴居中,即是横向居中
//           mainAxisAlignment: MainAxisAlignment.center,
//           ///大小按照最大充满
//           mainAxisSize : MainAxisSize.max,
//           ///竖向也居中
//           crossAxisAlignment : CrossAxisAlignment.center,
//           children: <Widget>[
//             ///一个图标，大小16.0，灰色
//             new Icon(
//               icon,
//               size: 16.0,
//               color: Colors.grey,
//             ),
//             ///间隔
//             new Padding(padding: new EdgeInsets.only(left:5.0)),
//             ///显示文本
//             new Text(
//               text,
//               //设置字体样式：颜色灰色，字体大小14.0
//               style: new TextStyle(color: Colors.grey, fontSize: 14.0),
//               //超过的省略为...显示
//               overflow: TextOverflow.ellipsis,
//               //最长一行
//               maxLines: 1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// @override
//   Widget build(BuildContext context) {
//     return new Container(
//       ///卡片包装
//       child: new Card(
//            ///增加点击效果
//           child: new FlatButton(
//               onPressed: (){print("点击了哦");},
//               child: new Padding(
//                 padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
//                 child: new Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     ///文本描述
//                     new Container(
//                         child: new Text(
//                           "这是一点描述这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11这是一点描述11",
//                           style: TextStyle(
//                             color:Colors.grey,
//                             fontSize: 14.0,
//                           ),
//                           ///最长三行，超过 ... 显示
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
//                         alignment: Alignment.topLeft),
//                     new Padding(padding: EdgeInsets.all(10.0)),

//                     ///三个平均分配的横向图标文字
//                     new Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         _getBottomItem(Icons.star, "1000"),
//                         _getBottomItem(Icons.link, "1000"),
//                         _getBottomItem(Icons.subject, "1000"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ))),
//     );
//   }
// }
