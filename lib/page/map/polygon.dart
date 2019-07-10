import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:my_flutter/page/map/map_model.dart';
import 'package:latlong/latlong.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:my_flutter/widget/map_drawer_widget.dart';

class PolygonMapPage extends StatefulWidget {
  static const String route = '/polygon';

  @override
  _PolygonMapPageState createState() => _PolygonMapPageState();
}

class _PolygonMapPageState extends State<PolygonMapPage> {
  MapModel model = MapModel();

  Timer timer;

  @override
  void initState() {
    super.initState();
    // setState(() {
    //    model.rebuild();
    // });
  }

  @override
  Widget build(BuildContext context) {
    ///模拟数据
    List<Polygon> polygons = List<Polygon>();
    Polygon polygon = Polygon(points: [
      LatLng(46.55001, -63.6645),
      LatLng(46.41587, -62.9393),
      LatLng(46.44314, -62.01208),
      LatLng(46.03339, -62.50391),
      LatLng(45.96818, -62.87433),
      LatLng(46.39265, -64.1428),
      LatLng(46.72747, -64.39261),
      LatLng(47.03601, -64.01486),
      LatLng(46.55001, -63.6645),
    ]);
    polygons.add(polygon);

    timer = new Timer(const Duration(milliseconds:1000), () {
      print('timer');
      setState(() {
        model.rebuild();
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Polygon'),
      ),
      drawer: buildDrawer(context, PolygonMapPage.route),
      body: ScopedModel<MapModel>(
          model: model,
          child: ScopedModelDescendant<MapModel>(
            //The ScopedModelDescendant Widget. Use this Widget to find the appropriate ScopedModel in the Widget tree.
            builder: (context, child, model) {
              var layer = List<LayerOptions>();
              layer.add(
                TileLayerOptions(
                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoibmlrbGFzcmFhYiIsImEiOiJjam8xbGVkZ2MwY3hlM2txaXF1eWJ1ZWdtIn0.IVsKgZVSzR6qJSDAmNhGKA',
                    'id': 'mapbox.streets',
                  },
                ),
              );

              ///模拟数据
              // layer.add(
              //   PolygonLayerOptions(
              //     polygons: polygons,
              //   ),
              // );

              layer.addAll(model.layer.map((layer) {
                print('load layer:${layer.polygons[0].points.length}');
                return PolygonLayerOptions(polygons: layer.polygons);
              }));
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Rebuild"),
                    onPressed: () {
                      setState(() {
                        model.rebuild();
                      });
                    },
                  ),
                  Expanded(
                    child: FlutterMap(
                      options: MapOptions(
                          center:
                              LatLng(36.930614325501836, 122.51999474496584),
                          zoom: 5.0),
                      layers: layer,
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
