import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Utils/app_constants.dart';
import 'AddChild_Screen.dart';

class ProfilePhotoScreen extends StatefulWidget {
  @override
  _ProfilePhotoScreenState createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen> {
  XFile? _imageFile;
  int _currentStep = 1;

  final ImagePicker _picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = selectedImage;
      if (_imageFile != null) {
        _currentStep = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: getSpacing(context) * 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: getBarHeight(context),
                  width: getBarWidth(context) / 3 ,
                  color: _currentStep >= 1 ? buttonColorPurple : Colors.grey[300],
                ),
                SizedBox(width: getSpacing(context) * 10), // Space between the steps
                Container(
                  height: getBarHeight(context),
                  width: getBarWidth(context) / 3 ,
                  color: _currentStep >= 2 ? buttonColorPurple : Colors.grey[300],
                ),
                SizedBox(width: getSpacing(context) * 10), // Space between the steps
                Container(
                  height: getBarHeight(context),
                  width: getBarWidth(context) / 3 ,
                  color: _currentStep >= 3 ? buttonColorPurple : Colors.grey[300],
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 10),
            Row(
              children: [
                SvgPicture.asset('assets/images/profile-icon.svg'),
                SizedBox(width: getSpacing(context) * 2),
                Text(
                  "Profile Photo",
                  textAlign: TextAlign.left,
                  style: outfitBold.copyWith(fontSize: getBoldFontSize(context) * 2),
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 8),
            Text(
              "Please provide a clear photo of your face so your hosts can recognize you.",
              textAlign: TextAlign.left,
              style: contentC5.copyWith(fontSize: getFontSize(context) * 1.5),
            ),
            SizedBox(height: getSpacing(context) * 32),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.camera),
                            title: Text('Take Photo'),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.photo_library),
                            title: Text('Add from Gallery'),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.cancel),
                            title: Text('Cancel'),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: buttonColorPurple,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: getBarWidth(context) / 2,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  backgroundImage: _imageFile != null
                      ? FileImage(File(_imageFile!.path))
                      : null,
                  child: _imageFile == null
                      ? SvgPicture.asset('assets/images/camera-icon.svg')
                      : null,
                ),
              ),
            ),
            SizedBox(height: getSpacing(context) * 5),
            if (_imageFile == null)
              Text('+ Upload Photo', style: outfitBold),
            if (_imageFile != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/edit-icon.svg',),
                  SizedBox(width: 5),
                  Text(
                    'Change Photo',
                    style: outfitBold.copyWith(color: Colors.black),
                  ),
                ],
              ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: getSpacing(context) * 10, vertical: getSpacing(context) * 5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(roundBorderRadius),
                    ),
                  ),
                  child: Text("Skip", style: outfitBold.copyWith(fontSize: getFontSize(context) * 1.5)),
                ),
                ElevatedButton(
                  onPressed: _imageFile != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddChildScreen()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: _imageFile != null ? buttonColorPurple : Colors.grey[300], // Text color
                    padding: EdgeInsets.symmetric(horizontal: getSpacing(context) * 15, vertical: getSpacing(context) * 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(roundBorderRadius),
                    ),
                  ),
                  child: Text("Save & Continue", style: outfitBold.copyWith(fontSize: getFontSize(context) * 1.5)),
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
