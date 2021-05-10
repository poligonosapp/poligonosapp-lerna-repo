import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/drawer.dart';

class PolygonPage extends StatelessWidget {
  static const String route = 'polygon';

  final List<LatLng> listOfPoints = [
    LatLng(51.5, -0.09),
    LatLng(-51.5, 0.09),
    LatLng(51.5, -0.09),
    LatLng(51.5, 0.09)
  ];

  @override
  Widget build(BuildContext context) {
    var polygonsList = <Polygon>[
      Polygon(
          points: listOfPoints,
          color: Colors.blue.withOpacity(0.7),
          borderStrokeWidth: 2
          ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Polygons')),
      drawer: buildDrawer(context, route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('This is a map that is showing (51.5, -0.9).'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 11.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  PolygonLayerOptions(polygons: polygonsList)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
