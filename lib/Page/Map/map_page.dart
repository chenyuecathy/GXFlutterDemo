import 'package:flutter/material.dart';

import 'package:my_flutter/page/map/animated_map_controller.dart';
import 'package:my_flutter/page/map/circle.dart';
import 'package:my_flutter/page/map/esri.dart';
import 'package:my_flutter/page/map/home.dart';
import 'package:my_flutter/page/map/map_controller.dart';
import 'package:my_flutter/page/map/marker_anchor.dart';
import 'package:my_flutter/page/map/moving_markers.dart';
import 'package:my_flutter/page/map/offline_map.dart';
import 'package:my_flutter/page/map/offline_mbtiles_map.dart';
import 'package:my_flutter/page/map/on_tap.dart';
import 'package:my_flutter/page/map/overlay_image.dart';
import 'package:my_flutter/page/map/plugin_api.dart';
import 'package:my_flutter/page/map/polyline.dart';
import 'package:my_flutter/page/map/tap_to_add.dart';
import 'package:my_flutter/page/map/polygon.dart';

/*  Map 页面的主入口 **/

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map  Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),

      // routes: {
      //   "secondPage": (BuildContext context) => new SecondPage(),
      // },

      // 路由设置 很关键
      routes: <String, WidgetBuilder>{
        TapToAddPage.route: (context) => TapToAddPage(),
        EsriPage.route: (context) => EsriPage(),
        PolylinePage.route: (context) => PolylinePage(),
        MapControllerPage.route: (context) => MapControllerPage(),
        AnimatedMapControllerPage.route: (context) =>
            AnimatedMapControllerPage(),
        MarkerAnchorPage.route: (context) => MarkerAnchorPage(),
        PluginPage.route: (context) => PluginPage(),
        OfflineMapPage.route: (context) => OfflineMapPage(),
        OfflineMBTilesMapPage.route: (context) => OfflineMBTilesMapPage(),
        OnTapPage.route: (context) => OnTapPage(),
        MovingMarkersPage.route: (context) => MovingMarkersPage(),
        CirclePage.route: (context) => CirclePage(),
        OverlayImagePage.route: (context) => OverlayImagePage(),
        PolygonMapPage.route: (context) => PolygonMapPage(),
      },
    );
  }
}
