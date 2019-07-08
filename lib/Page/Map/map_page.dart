import 'package:flutter/material.dart';


import 'package:my_flutter/Page/Map/animated_map_controller.dart';
import 'package:my_flutter/Page/Map/circle.dart';
import 'package:my_flutter/Page/Map/esri.dart';
import 'package:my_flutter/Page/Map/home.dart';
import 'package:my_flutter/Page/Map/map_controller.dart';
import 'package:my_flutter/Page/Map/marker_anchor.dart';
import 'package:my_flutter/Page/Map/moving_markers.dart';
import 'package:my_flutter/Page/Map/offline_map.dart';
import 'package:my_flutter/Page/Map/offline_mbtiles_map.dart';
import 'package:my_flutter/Page/Map/on_tap.dart';
import 'package:my_flutter/Page/Map/overlay_image.dart';
import 'package:my_flutter/Page/Map/plugin_api.dart';
import 'package:my_flutter/Page/Map/polyline.dart';
import 'package:my_flutter/Page/Map/tap_to_add.dart';

/*  Map 页面的主入口 **/
// class MapPage extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Map  Demo',
//       theme: ThemeData(
//         primarySwatch:Colors.red,
//       ),
//       home: HomePage(),

//       // 路由设置 很关键
//       routes: <String, WidgetBuilder>{
//         TapToAddPage.route: (context) => TapToAddPage(),
//         EsriPage.route: (context) => EsriPage(),
//         PolylinePage.route: (context) => PolylinePage(),
//         MapControllerPage.route: (context) => MapControllerPage(),
//         AnimatedMapControllerPage.route: (context) =>
//             AnimatedMapControllerPage(),
//         MarkerAnchorPage.route: (context) => MarkerAnchorPage(),
//         PluginPage.route: (context) => PluginPage(),
//         OfflineMapPage.route: (context) => OfflineMapPage(),
//         OfflineMBTilesMapPage.route: (context) => OfflineMBTilesMapPage(),
//         OnTapPage.route: (context) => OnTapPage(),
//         MovingMarkersPage.route: (context) => MovingMarkersPage(),
//         CirclePage.route: (context) => CirclePage(),
//         OverlayImagePage.route: (context) => OverlayImagePage(),
//       },
    
//     );

//   }
// }

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
        primarySwatch:Colors.blue,
      ),
      home: HomePage(),

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
      },
    
    );
  }
}