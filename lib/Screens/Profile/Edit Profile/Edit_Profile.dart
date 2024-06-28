import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utils/app_constants.dart';
import '../Profile_Initial.dart';
import 'Add_Children.dart';
import 'Contact_Details.dart';
import 'Personal_Information.dart';

void main() {
  runApp(MaterialApp(
    home: EditProfileScreen(),
  ));
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
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
            icon: Icon(Icons.search, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
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
                  backgroundImage: AssetImage('assets/images/Celebrate.png'), // Adjust the asset path
                ),
                SizedBox(width: getPadding(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Samira Khan',
                      style: interBold.copyWith(fontSize: getBigFontSize(context)),
                    ),
                    Text(
                      'Mother of 03',
                      style: interRegular.copyWith(color: Colors.grey, fontSize: getFontSize(context)),
                    ),
                  ],
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change Profile',
                    style: interRegular.copyWith(fontSize: getFontSize(context)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(context, 'Personal Information', Icons.person_outline, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PersonalInformationScreen()),
                  );                  print('Personal Information tapped');
                }),
                _buildListTile(context, 'Contact Details', Icons.contact_mail, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactDetailsScreen()),
                  );                     
                }),
                _buildListTile(context, 'Children Details', Icons.child_care_outlined, () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChildrenDetailsScreen()),
                  );                   print('Children Details tapped'); 
                }),
                _buildListTile(context, 'Address Book', Icons.home_outlined, () {
                  // Add your onPressed functionality here
                  print('Address Book tapped');
                }),
                _buildListTile(context, 'Change Password', Icons.lock_outline, () {
                  // Add your onPressed functionality here
                  print('Change Password tapped');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
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
