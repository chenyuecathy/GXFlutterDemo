import 'package:flutter/material.dart';

import 'package:my_flutter/utils/navigator_utils.dart';

import '../dynamic/dynamic_detail_page.dart';

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
      elevation: 2.0, // 卡片的z坐标,控制卡片下面的阴影大小
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),  // 圆角
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: () {
              NavigatorUtils.goDynamicDetail(context, itemUrl, itemTitle);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (BuildContext context) {
              //   return new DynamicDetailPage(itemUrl, itemTitle);
              // }));
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
  }
}
