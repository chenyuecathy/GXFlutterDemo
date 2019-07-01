
import 'package:flutter/material.dart';


const Map<String,Color> enumMap = const{
  "Objective-C": Color(0xFF438EFF),
  "Perl": Color(0xFF0298C3),
  "Python": Color(0xFF0298C3),
  "JavaScript": Color(0xFFF1E05A),
  "PHP": Color(0xFF4F5D95),
  "R": Color(0xFF188CE7),
  "Lua": Color(0xFFC22D40),
  "Scala": Color(0xFF020080),
  "Swift": Color(0xFFFFAC45),
  "Kotlin": Color(0xFFF18E33),
  "Vue": Colors.black,
  "Ruby": Color(0xFF701617),
  "Shell": Color(0xFF89E051),
  "TypeScript": Color(0xFF2B7489),
  "C++": Color(0xFFF34B7D),
  "CSS": Color(0xFF563C7C),
  "Java": Color(0xFFB07219),
  "C#": Color(0xFF178600),
  "Go": Color(0xFF375EAB),
  "Erlang": Color(0xFFB83998),
  "C": Color(0xFF555555),
};

class Utils{

  // 计算时间间隔
  static String getTimeDuration(String compTime){
    var currentTime = DateTime.now();
    var compareTime = DateTime.parse(compTime);
    if (currentTime.isAfter(compareTime)) {

      if(currentTime.year == compareTime.year){
        
        if(currentTime.month == compareTime.month){
          if(currentTime.day == compareTime.day){
            if(currentTime.hour == compareTime.hour){
              if (currentTime.minute == currentTime.minute) {
                return '刚刚';
              }
              return (currentTime.month -compareTime.month).toString() + '分钟前';
            }
            return (currentTime.month -compareTime.month).toString() + '小时前';
          }
          return (currentTime.month -compareTime.month).toString() + '天前';
        }
        return (currentTime.month -compareTime.month).toString() + '月前';
      }
      return (currentTime.year -compareTime.year).toString() + '年前';
    }
    return 'time error';
  }


  static double setPercentage(percentage, context) {
    return MediaQuery.of(context).size.width * percentage;
  }

// 设置语言颜色
  static Color getLangColor(String language) {
    if (enumMap.containsKey(language)) {
      return enumMap[language];
    }
    return Colors.black26;
  }

// 获取时间
  static String getTimeDate(String comTime) {
    var compareTime = DateTime.parse(comTime);
    String weekDay = '';
    switch (compareTime.weekday) {
      case 2:
        weekDay = '周二';
        break;
      case 3:
        weekDay = '周三';
        break;
      case 4:
        weekDay = '周四';
        break;
      case 5:
        weekDay = '周五';
        break;
      case 6:
        weekDay = '周六';
        break;
      case 7:
        weekDay = '周日';
        break;
      default:
        weekDay = '周一';
    }
    return '${compareTime.month}-${compareTime.day}  $weekDay';
  }

}