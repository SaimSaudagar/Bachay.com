import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/App_Bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(state: 1),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            _buildSettingsSection(context, 'Settings', [
              _buildRoundedListItem(context, 'Personal Information', Icons.person, onTap: () {}),
              _buildRoundedListItem(context, 'Language', Icons.language, trailingText: 'English', onTap: () {}),
              _buildRoundedListItem(context, 'Contact Details', Icons.contact_phone, onTap: () {}),
              _buildRoundedListItem(context, 'My Payments', Icons.payment, onTap: () {}),
              _buildRoundedListItem(context, 'Children Details', Icons.child_care, onTap: () {}),
              _buildRoundedListItem(context, 'Address Book', Icons.location_on, onTap: () {}),
              _buildRoundedListItem(context, 'Change Password', Icons.lock, onTap: () {}),
              _buildRoundedListItem(context, 'Deactivated Account', Icons.delete, onTap: () {}),
            ]),
            SizedBox(height: getSpacing(context) * 2),
            _buildSettingsSection(context, 'Information', [
              _buildRoundedListItem(context, 'Shipping Info', Icons.local_shipping, onTap: () {}),
              _buildRoundedListItem(context, 'Return Policy', Icons.assignment_return, onTap: () {}),
              _buildRoundedListItem(context, 'Privacy Center', Icons.privacy_tip, onTap: () {}),
              _buildRoundedListItem(context, 'Our Policies', Icons.policy, onTap: () {}),
              _buildRoundedListItem(context, 'Terms & Conditions', Icons.description, onTap: () {}),
              _buildRoundedListItem(context, 'About Us', Icons.info, onTap: () {}),
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
                    Icon(Icons.logout, color: Colors.white),
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

  Widget _buildRoundedListItem(BuildContext context, String title, IconData icon, {String? trailingText, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50), // Circular borders
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: interRegular.copyWith(fontSize: getFontSize(context))),
          trailing: trailingText != null ? Text(trailingText, style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey)) : Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int state;

  const CustomAppBar({required this.state});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Settings'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Add navigation logic here
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
