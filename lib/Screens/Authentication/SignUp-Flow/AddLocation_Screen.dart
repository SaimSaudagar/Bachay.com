import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';

class AddLocationScreen extends StatefulWidget {
  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  GoogleMapController? mapController;
  LatLng _center = LatLng(24.8607, 67.0011);
  LatLng? _currentPosition;
  loc.Location _location = loc.Location();
  String _currentAddress = "Searching Address...";
  bool _addressFound = false;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Future<void> _getCurrentLocation() async {
    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;

    try {
      // Check if location service is enabled
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
        if (!_serviceEnabled) {
          print("Location service is not enabled.");
          return;
        }
      }

      // Check location permission
      _permissionGranted = await _location.hasPermission();
      if (_permissionGranted == loc.PermissionStatus.denied) {
        _permissionGranted = await _location.requestPermission();
        if (_permissionGranted != loc.PermissionStatus.granted) {
          print("Location permission not granted.");
          return;
        }
      }

      var locationData = await _location.getLocation();
      if (locationData.latitude == null || locationData.longitude == null) {
        throw Exception("Failed to get location");
      }

      _currentPosition = LatLng(locationData.latitude!, locationData.longitude!);

      // Animate the camera to the new location
      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: _currentPosition!, zoom: 15),
          ),
        );
      } else {
        print("Map controller is null");
      }

      // Get the address from the coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      setState(() {
        _currentAddress = placemarks.isNotEmpty ? placemarks.first.street ?? "Address not found" : "Address not found";
        _addressFound = true;
      });
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        _currentAddress = "Error finding address";
        _addressFound = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search your Location",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 15,
            right: 15,
            child: ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text("User Current Location"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address from Map",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _currentAddress,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        "Change",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addressFound
                        ? () {
                            // Handle location confirmation
                          }
                        : null,
                    child: Center(
                      child: Text("Confirm Location"),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}