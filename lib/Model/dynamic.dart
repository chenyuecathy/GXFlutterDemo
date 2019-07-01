
import 'package:my_flutter/Utils/utils.dart';


class DynamicModel {
  
  bool hot;
  String tag;
  String username;
  int collectionCount;
  int commentCount;
  String title;
  String createdTime;
  String detailUrl;
  String isCollection;  // type

  DynamicModel({
  this.hot,
  this.tag,
  this.username,
  this.collectionCount,
  this.commentCount,
  this.title,
  this.createdTime,
  this.detailUrl,
  this.isCollection
  });

  factory DynamicModel.fromJson(Map<String, dynamic> json){
    String _tag = '';
    if(json['tags'].length>0){
      _tag = '${json['tags'][0]['title']}/';
    }

    return DynamicModel(
      hot: json['hot'],
      collectionCount: json['collectionCount'],
      commentCount: json['commentsCount'],
      tag: '$_tag${json['category']['name']}',
      username: json['user']['username'],
      createdTime: Utils.getTimeDuration(json['createdAt']),
      title: json['title'],
      detailUrl: json['originalUrl'],
      isCollection: json['type'] ,
    );

  }

  
}