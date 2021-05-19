import 'package:data/data.dart';// data structures
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:geojson/geojson.dart';
// import 'package:latlong2/latlong.dart';
import 'package:latlong/latlong.dart' hide Path; // conflict with Path from UI

import '../widgets/drawer.dart';

  /// Data for the Flutter map polylines layer
  final lines = <Polyline>[];

  Future<void> parseAndDrawAssetsOnMap() async {
    final geo = GeoJson();
    geo.processedLines.listen((GeoJsonLine line) {
      /// when a line is parsed add it to the map right away
      setState(() => lines.add(Polyline(
          strokeWidth: 2.0, color: Colors.blue, points: line.geoSerie.toLatLng())));
    });
    geo.endSignal.listen((_) => geo.dispose());
    final data = await rootBundle
        .loadString('assets/polygons.geojson');
    await geo.parse(data, verbose: true);
  }


class PolygonPage extends StatelessWidget {
  static const String route = 'polygon';

  final a = Matrix<double>.fromRows(DataType.double, [
  [2, 1, 1],
  [1, 3, 2],
  [1, 0, 0],
]);

final b = Vector<double>.fromList(DataType.double, [4, 5, 6]);

final x = a.solve(b.columnMatrix).column(0);

print(x.format(valuePrinter: Printer.fixed()); // prints '6 15 -23'
//TODO MATRIX DATA TYPE
  final List<LatLng> listOfPoints = [
    LatLng(90+51.5, -180-0.09),
    LatLng(90+-51.5, -180-0.09),
    LatLng(-90+51.5, 180+0.09),
    LatLng(-90+51.5, 180+0.09)
  ];

  @override
  Widget build(BuildContext context) {
    //TODO MATRIX DATA TYPE
    var polygonsList = <Polygon>[
      Polygon(
          points: buildListOfPoints,
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
                  center: LatLng(90+51.5, -180-0.09),
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

  List<LatLng> get buildListOfPoints => listOfPoints;
}
