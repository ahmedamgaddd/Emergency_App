import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';






class MapScreen3 extends StatefulWidget {
  const MapScreen3({super.key});





  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen3> {
  Position? currentPosition;
  final _places = GoogleMapsPlaces(apiKey: '');
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = {};
    _searchForHospitals();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('car_repair map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(30.58768,31.502),
          zoom: 16,
        ),
        markers: _markers,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
  }

  Future<void> _searchForHospitals() async {
    final location = Location(lat: 30.58768, lng:31.502 );

    final result = await _places.searchNearbyWithRadius(
      location,
      2000,
      type: 'car_repair',
    );

    if (result.status == 'OK') {
      setState(() {
        _markers = Set<Marker>.from(result.results.map((place) => Marker(
          markerId: MarkerId(place.placeId),
          position: LatLng(place.geometry!.location.lat, place.geometry!.location.lng),
          infoWindow: InfoWindow(
            title: place.name,
            snippet: place.vicinity,
          ),
        )));
      });
    }
  }
}