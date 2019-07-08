import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:my_flutter/widget/map_drawer_widget.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    const double w = 30;
    const double h = 30;

    var markers = <Marker>[
      Marker(
        width: w,
        height: h,
        point: LatLng(51.5, -0.09),
        builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
      ),
      Marker(
        width: w,
        height: h,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => Container(
              child: FlutterLogo(
                colors: Colors.green,
              ),
            ),
      ),
      Marker(
        width: w,
        height: h,
        point: LatLng(48.8566, 2.3522),
        builder: (ctx) => Container(
              child: FlutterLogo(colors: Colors.purple),
            ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: buildDrawer(context, route),
      body: Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                'This is a map that is showing (51.5, -0.9).',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  // backgroundColor: Color(0xEEEEE0FF),
                ),
              ),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 5.0,
                ),
                layers: [
                  TileLayerOptions(
                    // urlTemplate:
                    // 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    // subdomains: ['a', 'b', 'c']
                    urlTemplate: "https://api.tiles.mapbox.com/v4/"
                        "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                    additionalOptions: {
                      'accessToken':
                          'pk.eyJ1IjoiY2hlbnl1ZWNhdGh5IiwiYSI6ImNqbHp4azhzYTA1MzUzdm9ibDExdWVvOWUifQ.IJJOLhkX60fZOwEELBD57Q',
                      'id': 'mapbox.streets',
                    },
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
