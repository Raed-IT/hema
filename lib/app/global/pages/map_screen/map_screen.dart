import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  LatLng latLong;

  Set<Marker> marker;

  MapScreen({Key? key, required this.latLong, required this.marker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true,
        //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: latLong,
          //initial position
          zoom: 17.0, //initial zoom level
        ),
        markers: marker,
        //markers to show on map
        mapType: MapType.hybrid,
        //map type
        onMapCreated: (controller) {
          //method called when map is created
        },
      ),
    );
  }
}
