import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_flutter/Page/dynamic_page/dynamic_detail_page.dart';


class NavigatorUtils {

  // 替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }


  static goDynamicDetail(BuildContext context,String url,String title){
    NavigatorRouter(context, new DynamicDetailPage(url,title));
  }



  // 公共打开方式
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context,
        new CupertinoPageRoute(builder: (context) => pageContainer(widget)));
  }

  // Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(

        ///不受系统字体缩放影响
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .copyWith(textScaleFactor: 1),
        child: widget);
  }
  
}