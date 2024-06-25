import 'package:app/Screens/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

import '../../../Utils/app_constants.dart';
import 'AddLocation_Screen.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  // GoogleMapController? mapController;
  // LatLng? _currentPosition;
  // Location _location = Location();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    // var locationData = await _location.getLocation();
    setState(() {
      // _currentPosition =
      // LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getSpacing(context) * 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getBarHeight(context),
                  width: getBarWidth(context) / 3,
                  color: buttonColorPurple,
                ),
                SizedBox(width: getSpacing(context) * 10),
                Container(
                  height: getBarHeight(context),
                  width: getBarWidth(context) / 3,
                  color: buttonColorPurple,
                ),
                SizedBox(width: getSpacing(context) * 10),
                Container(
                  height: getBarHeight(context),
                  width: getBarWidth(context) / 3,
                  color: buttonColorPurple,
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 10),
            Row(
              children: [
                SvgPicture.asset('assets/images/address-icon.svg'),
                SizedBox(width: getSpacing(context) * 2),
                Text(
                  "Add Address",
                  textAlign: TextAlign.left,
                  style: outfitBold.copyWith(
                      fontSize: getBigFontSize(context) * 2),
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 8),
            Text(
              "Please add your address in order to ship your shopping products to delivered them.",
              textAlign: TextAlign.left,
              style: contentC5.copyWith(fontSize: getFontSize(context) * 1.5),
            ),
            SizedBox(height: getSpacing(context) * 32),
            Center(
                child: TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(builder: (context) => AddLocationScreen()),
                // );
              },
              style: TextButton.styleFrom(
                foregroundColor: buttonColorPurple,
                textStyle: TextStyle(
                  fontSize: getFontSize(context) * 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("+ Add Address"),
            )),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                        horizontal: getSpacing(context) * 10,
                        vertical: getSpacing(context) * 5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(roundBorderRadius),
                    ),
                  ),
                  child: Text("Skip",
                      style: outfitBold.copyWith(
                          fontSize: getFontSize(context) * 1.5)),
                ),
                ElevatedButton(
                  onPressed: null,
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
            SizedBox(height: getSpacing(context) * 16),
          ],
        ),
      ),
    );
  }
}
