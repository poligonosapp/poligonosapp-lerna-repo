import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var center2 = LatLng(45.5231, -122.6765);
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Container(
                width: 200,
                height: 200,
                child: FlutterMap(
                  options: MapOptions(
                    center: center2,
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
