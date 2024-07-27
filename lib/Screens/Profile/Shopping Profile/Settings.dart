import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Settings'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            _buildSettingsSection(context, 'Settings', [
              _buildRoundedListItem(context, 'Personal Information', 'assets/images/account.png', onTap: () {}),
              _buildRoundedListItem(context, 'Language', 'assets/images/language.png', trailingText: 'English', onTap: () {}),
              _buildRoundedListItem(context, 'Contact Details', 'assets/images/contact.png', onTap: () {}),
              _buildRoundedListItem(context, 'My Payments', 'assets/images/card.png', onTap: () {}),
              _buildRoundedListItem(context, 'Children Details', 'assets/images/children.png', onTap: () {}),
              _buildRoundedListItem(context, 'Address Book', 'assets/images/address.png', onTap: () {}),
              _buildRoundedListItem(context, 'Change Password', 'assets/images/password.png', onTap: () {}),
              _buildRoundedListItem(context, 'Deactivated Account', 'assets/images/trash.png', onTap: () {}),
            ]),
            SizedBox(height: getSpacing(context) * 2),
            _buildSettingsSection(context, 'Information', [
              _buildRoundedListItem(context, 'Shipping Info', 'assets/images/group.png', onTap: () {}),
              _buildRoundedListItem(context, 'Return Policy', 'assets/images/return-policy.png', onTap: () {}),
              _buildRoundedListItem(context, 'Privacy Center', 'assets/images/privacy_center.png', onTap: () {}),
              _buildRoundedListItem(context, 'Our Policies', 'assets/images/policy.png', onTap: () {}),
              _buildRoundedListItem(context, 'Terms & Conditions', 'assets/images/terms_conditions.png', onTap: () {}),
              _buildRoundedListItem(context, 'About Us', 'assets/images/about_us.png', onTap: () {}),
            ]),
            SizedBox(height: getSpacing(context) * 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getSpacing(context) * 2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: getSpacing(context) * 2),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: getSpacing(context)),
                    Text('Sign Out', style: buttonTextStyle(context)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: interBold.copyWith(fontSize: getBigFontSize(context))),
        SizedBox(height: getSpacing(context)),
        ...items,
      ],
    );
  }

  Widget _buildRoundedListItem(BuildContext context, String title, String imagePath, {String? trailingText, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50), // Circular borders
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          leading: Image.asset(imagePath, width: 24, height: 24, color: Colors.black),
          title: Text(title, style: interRegular.copyWith(fontSize: getFontSize(context))),
          trailing: trailingText != null
              ? Text(trailingText, style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey))
              : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}
