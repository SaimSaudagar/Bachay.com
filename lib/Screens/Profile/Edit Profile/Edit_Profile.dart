import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utils/app_constants.dart';
import '../Profile_Initial.dart';
import 'Add_Children.dart';
import 'Contact_Details.dart';
import 'Personal_Information.dart';

void main() {
  runApp(const MaterialApp(
    home: EditProfileScreen(),
  ));
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset('assets/logo/Logo.svg',
              height: getFontSize(context) * 4),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(getPadding(context)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: getFontSize(context) * 4,
                  backgroundImage: const AssetImage(
                      'assets/images/Celebrate.png'), // Adjust the asset path
                ),
                SizedBox(width: getPadding(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Samira Khan',
                      style:
                          interBold.copyWith(fontSize: getBigFontSize(context)),
                    ),
                    Text(
                      'Mother of 03',
                      style: interRegular.copyWith(
                          color: Colors.grey, fontSize: getFontSize(context)),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change Profile',
                    style:
                        interRegular.copyWith(fontSize: getFontSize(context)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                    context, 'Personal Information', Icons.person_outline, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PersonalInformationScreen()),
                  );
                }),
                _buildListTile(context, 'Contact Details', Icons.contact_mail,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactDetailsScreen()),
                  );
                }),
                _buildListTile(
                    context, 'Children Details', Icons.child_care_outlined, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChildrenDetailsScreen()),
                  );
                }),
                _buildListTile(context, 'Address Book', Icons.home_outlined,
                    () {
                  // Add your onPressed functionality here
                }),
                _buildListTile(context, 'Change Password', Icons.lock_outline,
                    () {
                  // Add your onPressed functionality here
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getPadding(context),
        vertical: getSpacing(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(roundBorderRadius),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: outfitRegular.copyWith(fontSize: getFontSize(context)),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: getFontSize(context)),
        onTap: onTap,
      ),
    );
  }
}
