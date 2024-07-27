import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Utils/app_constants.dart';
import 'AddAddress_Screen.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  _AddChildScreenState createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  bool isBoySelected = false;
  bool isGirlSelected = false;

  void _pickImage(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getSpacing(context) * 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: getBarWidth(context) / 3,
                    height: getBarHeight(context),
                    color: buttonColorPurple,
                  ),
                  SizedBox(width: getSpacing(context) * 10),
                  Container(
                    width: getBarWidth(context) / 3,
                    height: getBarHeight(context),
                    color: buttonColorPurple,
                  ),
                  SizedBox(width: getSpacing(context) * 10),
                  Container(
                    width: getBarWidth(context) / 3,
                    height: getBarHeight(context),
                    color: Colors.grey[300],
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context) * 10),
              Row(
                children: [
                  SvgPicture.asset('assets/images/child-icon.svg'),
                  SizedBox(width: getSpacing(context) * 2),
                  Text(
                    "Add Child",
                    style: outfitBold.copyWith(
                        fontSize: getBigFontSize(context) * 2),
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context) * 2),
              Text(
                "Please add your child in order to customize your shopping feed and use parenting tools.",
                style: contentC5.copyWith(fontSize: getFontSize(context) * 1.5),
              ),
              SizedBox(height: getSpacing(context) * 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SafeArea(
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text('Take Photo'),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Add from Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.cancel),
                                title: const Text('Cancel'),
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
                  child: CircleAvatar(
                    radius: getBarWidth(context) / 3,
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (_imageFile == null)
                  const Text('+ Upload Photo', style: outfitBold),
              ]),
              if (_imageFile != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/edit-icon.svg'),
                    const SizedBox(width: 5),
                    Text(
                      'Change Photo',
                      style: outfitBold.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              SizedBox(height: getSpacing(context) * 5),
              const Text(
                'Child Name',
                style: outfitBold,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter child\'s name',
                  hintStyle: contentC5.copyWith(
                      fontSize: getFontSize(context) * 1.5, color: fontcolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/images/name-icon.svg'),
                  ),
                ),
              ),
              SizedBox(height: getSpacing(context) * 5),
              const Text('Date of Birth', style: outfitBold),
              TextField(
                controller: _dobController,
                decoration: InputDecoration(
                    hintText: 'Enter child\'s date of birth',
                    hintStyle: contentC5.copyWith(
                        fontSize: getFontSize(context) * 1.5, color: fontcolor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:
                          SvgPicture.asset('assets/images/calender-icon.svg'),
                    )),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dobController.text = pickedDate.toString().split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: getSpacing(context) * 5),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isBoySelected = !isBoySelected;
                          if (isBoySelected) {
                            isGirlSelected = false;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: getSpacing(context) * 5),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: isBoySelected
                                ? buttonColorPurple
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/boy-icon.png'),
                          SizedBox(width: getSpacing(context) * 2),
                          Text(
                            "It's a Boy!",
                            style: outfitBold.copyWith(
                                fontSize: getFontSize(context) * 1.5,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: getSpacing(context) * 4),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isGirlSelected = !isGirlSelected;
                          if (isGirlSelected) {
                            isBoySelected = false;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: getSpacing(context) * 5),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: isGirlSelected
                                ? buttonColorPurple
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/girl-icon.png'),
                          SizedBox(width: getSpacing(context) * 2),
                          Text(
                            "It's a Girl!",
                            style: outfitBold.copyWith(
                                fontSize: getFontSize(context) * 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context) * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddAddressScreen()),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddAddressScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPurple,
                      padding: EdgeInsets.symmetric(
                          horizontal: getSpacing(context) * 15,
                          vertical: getSpacing(context) * 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(roundBorderRadius),
                      ),
                    ),
                    child: Text("Save & Continue",
                        style: outfitBold.copyWith(
                            color: Colors.white,
                            fontSize: getFontSize(context) * 1.5)),
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context) * 10),
            ],
          ),
        ),
      ),
    );
  }
}
