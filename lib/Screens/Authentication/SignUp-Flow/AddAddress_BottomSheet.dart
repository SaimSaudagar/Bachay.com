import 'package:flutter/material.dart';

import '../../../Utils/app_constants.dart';

class AddAddressBottomSheet extends StatefulWidget {
  @override
  _AddAddressBottomSheetState createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  bool _isDefaultAddress = false;
  String _selectedAddressType = "Home"; // Selected radio button option
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _fullAddressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get the bottom padding (when keyboard is shown)
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset), // Moves up when keyboard is shown
        child: Container(
          padding: EdgeInsets.all(getPadding(context)),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(roundBorderRadius / 2.5),
              topRight: Radius.circular(roundBorderRadius / 2.5),
            ),
          ),
          child: SingleChildScrollView(
            // Ensure scrollable content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Grey Bar
                Center(
                  child: Container(
                    width: getBarWidth(context) / 2,
                    height: getBarHeight(context) * 1.2,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(getBarHeight(context) * 2),
                    ),
                  ),
                ),
                SizedBox(height: getSpacing(context) * 4),

                // Address Type Section
                Text(
                  "Address Type",
                  style: outfitBold.copyWith(fontSize: getFontSize(context) * 1.5),
                ),
                SizedBox(height: getSpacing(context)),
                Row(
                  children: [
                    Flexible(
                      child: _buildRadioButton("Home", context, selectedColor: buttonColorPurple),
                    ),
                    Flexible(
                      child: _buildRadioButton("Office", context, selectedColor: buttonColorPurple),
                    ),
                    Flexible(
                      child: _buildRadioButton("Other", context, selectedColor: buttonColorPurple),
                    ),
                  ],
                ),
                SizedBox(height: getSpacing(context) * 2),

                // Name Field
                _buildTextField("Name", _nameController, context),

                // Area Field
                _buildTextField("Area", _areaController, context),

                // Full Address Field
                _buildTextField("Full Address (Flat/House/Building/Area)", _fullAddressController, context),

                // City and State Fields
                Row(
                  children: [
                    Expanded(child: _buildTextField("City", _cityController, context)),
                    SizedBox(width: getSpacing(context)),
                    Expanded(child: _buildTextField("State", _stateController, context)),
                  ],
                ),

                // Phone Number with Prefix
                _buildTextField("Phone Number", _phoneController, context, prefixIcon: _buildPhonePrefix(context)),

                // Default Address Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure correct alignment
                  children: [
                    Row(
                      children: [
                        Text(
                          "Make Default",
                          style: outfitRegular.copyWith(fontSize: getFontSize(context) * 1.2),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          icon: const Icon(Icons.info_outline, size: 18),
                          onPressed: () {
                            // Show explanation for default address
                          },
                        ),
                      ],
                    ),
                    Switch(
                      value: _isDefaultAddress,
                      onChanged: (value) {
                        setState(() {
                          _isDefaultAddress = value;
                        });
                      },
                      activeColor: buttonColorPurple, // Set switch color
                    ),
                  ],
                ),
                Text(
                  "Use this address for future orders.",
                  style: outfitRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey[600]),
                ),
                SizedBox(height: getSpacing(context) * 4),

                // Save Address Button
                ElevatedButton(
                  onPressed: () {
                    // Save address functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColorPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius * 10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: getSpacing(context) * 5,
                      horizontal: getSpacing(context) * 8,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Save Address",
                      style: buttonTextStyle(context).copyWith(fontSize: getFontSize(context) * 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, BuildContext context,
      {Widget? prefixIcon}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSpacing(context)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: outfitRegular.copyWith(fontSize: getFontSize(context)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners like the image
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }

  Widget _buildPhonePrefix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSpacing(context) * 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("+92", style: outfitRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(width: getSpacing(context)),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String value, BuildContext context, {required Color selectedColor}) {
    return RadioListTile(
      value: value,
      groupValue: _selectedAddressType,
      activeColor: selectedColor, // Set the color to the provided purple color
      onChanged: (String? newValue) {
        setState(() {
          _selectedAddressType = newValue!;
        });
      },
      title: Text(
        value,
        style: TextStyle(
          fontSize: getFontSize(context),
          fontWeight: _selectedAddressType == value ? FontWeight.bold : FontWeight.normal,
          color: _selectedAddressType == value ? Colors.black : Colors.grey, // Bold and black for selected
        ),
      ),
    );
  }
}

void showAddAddressBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes sure the bottom sheet adjusts when the keyboard is open
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(roundBorderRadius)),
    ),
    builder: (context) => AddAddressBottomSheet(),
  );
}
