import 'dart:convert'; // 解析
import 'dart:ui';
import 'dart:async';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapModel extends Model {
  List<LayerModel> layer = List<LayerModel>();

  MapModel() {
    // rebuild();
  }

  void rebuild() {
     rootBundle.loadString('assets/geojson/CHN.geojson').then((result) {
      _parseGeoJson(result);
      print('_parseGeoJson done');
    });
  } // end of rebuild

  Future _parseGeoJson(String result) async {
    layer = new List<LayerModel>();

    /// all.geojson
    /*  var features = map["features"] as List<dynamic>;
      features.cast<Map<String, dynamic>>().forEach((feature) {
        var geo = feature["geometry"] as Map<String, dynamic>;
        var type = geo["type"] as String;
        var layers = geo["coordinates"] as List<dynamic>;

        if (type == "Polygon"){  // 单polygon
          print('ploygon');
          layerModels.add(LayerModel(layers.cast<List<dynamic>>().map((polygons) {
            return Polygon(
                color: Color.fromRGBO(0, 0, 0, 0.6),
                points: polygons.cast<List<dynamic>>().map((polygon) {
                  return getPosition(polygon);
                }).toList());
          }).toList()));
        }
        else {//MultiPolygon
          print('MultiPolygon');
          layerModels.addAll(layers.cast<List<dynamic>>().map((layer) {
            return LayerModel(layer.cast<List<dynamic>>().map((polygons) {
              return Polygon(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  points: polygons.cast<List<dynamic>>().map((polygon) {
                    return getPosition(polygon);
                  }).toList());
            }).toList());
          }).toList());
        }
      }); */

    Map<String, dynamic> map = json.decode(result);

    var geo = map["geometry"] as Map<String, dynamic>;
    var type = geo["type"] as String;
    var layers = geo["coordinates"] as List<dynamic>;

    if (type == "Polygon")
      layer.add(LayerModel(layers.cast<List<dynamic>>().map((polygons) {
        return Polygon(
            color: Color.fromRGBO(255, 189, 0, 0.3),
            points: polygons.cast<List<dynamic>>().map((polygon) {
              return getPosition(polygon);
            }).toList());
      }).toList()));
    else {
      layer.addAll(layers.cast<List<dynamic>>().map((layer) {
        return LayerModel(layer.cast<List<dynamic>>().map((polygons) {
          return Polygon(
              color: Color.fromRGBO(255, 189, 0, 0.3),
              points: polygons.cast<List<dynamic>>().map((polygon) {
                return getPosition(polygon);
              }).toList());
        }).toList());
      }).toList());
    }
    return;
  }

  LatLng getPosition(List polygon) {
    double lat = polygon[1] + .0;
    double long = polygon[0] + .0;
    if (long > 180.0) long = 180.0;
    return LatLng(lat, long);
  }
}

class LayerModel {
  List<Polygon> polygons = List<Polygon>();
  LayerModel(this.polygons);
}
