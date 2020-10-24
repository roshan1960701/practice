import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_map_place/search_map_place.dart';

// import 'package:search_map_place/search_map_place.dart';

class SearchMap extends StatefulWidget {
  @override
  _SearchMapState createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  GoogleMapController mapController;

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(19.120759, 72.854977);
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("SearchMap"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SearchMapPlaceWidget(
              hasClearButton: true,
              placeType: PlaceType.address,
              placeholder: 'Enter the location',
              apiKey: 'AIzaSyDf0PCQ2yRM_YzyxZ89DibiAEHuIIFgnr4',
              onSelected: (Place place) async {
                Geolocation geolocation = await place.geolocation;
                mapController.animateCamera(
                    CameraUpdate.newLatLng(geolocation.coordinates));
                mapController.animateCamera(
                    CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
              },
            ),
            SizedBox(
              height: 500.0,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    mapController = controller;
                  });
                },
                initialCameraPosition: CameraPosition(
                    zoom: 15.0, target: LatLng(19.120759, 72.854977)),
                mapType: MapType.satellite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
