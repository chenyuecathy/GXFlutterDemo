
import 'package:flutter/material.dart';


import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';



class WidgetPage extends StatefulWidget {
  WidgetPage({Key key}) : super(key: key);

  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {

var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(51.5, -0.09),
        builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => Container(
              child: FlutterLogo(
                colors: Colors.green,
              ),
            ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(48.8566, 2.3522),
        builder: (ctx) => Container(
              child: FlutterLogo(colors: Colors.purple),
            ),
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center:  LatLng(39.9088230000,116.3974700000),
        zoom: 13,
        // plugins: [
        //   MarkerClusterPlugin(),
        // ],
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "http://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}",
          // urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          // subdomains: ['a', 'b', 'c'],
          ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 40,
              height: 40,
              point: LatLng(39.9088230000,116.3974700000),
              builder: (ctx) => Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}