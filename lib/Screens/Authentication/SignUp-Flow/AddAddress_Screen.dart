import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../Utils/app_constants.dart';
import 'package:app/Screens/Home/Homepage.dart';

import 'AddAddress_BottomSheet.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _addressController = TextEditingController();
  final MapController _mapController = MapController();
  bool _mapReady = false; // To track if the map is ready

  @override
  void initState() {
    super.initState();
    // Delay _getCurrentLocation until after the initial build
    WidgetsBinding.instance.addPostFrameCallback((_) => _getCurrentLocation());
  }

  void _getCurrentLocation() {
    if (_mapReady) {
      // Check if the map is ready before moving it
      _mapController.move(
          LatLng(51.5, -0.09), 13); // Mock location for demonstration
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/images/address-icon.svg'),
                SizedBox(width: getSpacing(context) * 2),
                Expanded(
                  child: Text(
                    "Add Address",
                    textAlign: TextAlign.left,
                    style: outfitBold.copyWith(
                        fontSize: getBigFontSize(context) * 2),
                  ),
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 1),
            Text(
              "Please add your address in order to ship your shopping products to delivered them.",
              textAlign: TextAlign.left,
              style: contentC5.copyWith(fontSize: getFontSize(context) * 1.5),
            ),
            SizedBox(height: getSpacing(context) * 2),
            Expanded(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  onMapReady: () {
                    // Set the mapReady flag to true once the map is created
                    setState(() => _mapReady = true);
                  },
                  initialCenter: LatLng(51.5, -0.09),
                  maxZoom: 18.0,
                  minZoom: 10.0,
                  
                ),
                children: [],
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            Center(
              child: TextButton(
                onPressed: () {
    showAddAddressBottomSheet(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: buttonColorPurple,
                  textStyle: TextStyle(
                    fontSize: getFontSize(context) * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("+ Add Address"),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: getSpacing(context) * 10,
                        vertical: getSpacing(context) * 5),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(roundBorderRadius),
                    ),
                  ),
                  child: Text("Skip",
                      style: outfitBold.copyWith(
                          fontSize: getFontSize(context) * 1.5)),
                ),
                ElevatedButton(
                  onPressed: null, // To be implemented
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey[300], // Disabled color
                    padding: EdgeInsets.symmetric(
                        horizontal: getSpacing(context) * 15,
                        vertical: getSpacing(context) * 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(roundBorderRadius),
                    ),
                  ),
                  child: Text("Save & Continue",
                      style: outfitBold.copyWith(
                          fontSize: getFontSize(context) * 1.5)),
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 2),
          ],
        ),
      ),
    );
  }
}
