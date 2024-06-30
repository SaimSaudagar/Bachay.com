import 'package:flutter/material.dart';
import '../../Utils/app_constants.dart';
import '../../Widgets/App_Bar.dart';
import '../../Widgets/Botton_Nav_Bar.dart';
import 'Edit Profile/Edit_Profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(state: 2,),
      body: _buildProfileScreen(context),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: _onTabSelected),
    );
  }

  Widget _buildProfileScreen(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(getPadding(context)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/Celebrate.png'),
          ),
          SizedBox(height: getSpacing(context)),
          Text(
            "Samira Khan",
            style: interBold.copyWith(fontSize: getBigFontSize(context)),
          ),
          Text(
            "Mother of 03",
            style: interRegular.copyWith(color: Colors.grey, fontSize: getFontSize(context)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
            child: Text("Update Profile",
                style: interRegular.copyWith(
                    color: Colors.green,
                    fontSize: getFontSize(context),
                    decoration: TextDecoration.underline)),
          ),
          SizedBox(height: getSpacing(context) * 2),
          _buildIconRow(context),
          SizedBox(height: getSpacing(context) * 2),
          _buildProfileOptions(context),
          SizedBox(height: getSpacing(context) * 2),
          _buildCustomerServiceOptions(context),
          SizedBox(height: getSpacing(context) * 2),
          _buildSignOutButton(context),
        ],
      ),
    );
  }

  Widget _buildIconRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIconCard(context, Icons.child_care, "Add Child", Colors.pink[50]!),
        _buildIconCard(context, Icons.account_balance_wallet, "Wallet\nRs. 150", Colors.lightGreen[100]!),
        _buildIconCard(context, Icons.star, "Points\n150", Colors.orange[100]!),
        _buildIconCard(context, Icons.group, "Bachay\nClub", Colors.yellow[100]!),
      ],
    );
  }

  Widget _buildIconCard(BuildContext context, IconData icon, String text, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgColor,
          ),
          child: Center(
            child: Icon(
              icon,
              size: 40,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: getSpacing(context)),
        Text(
          text,
          textAlign: TextAlign.center,
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
      ],
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildProfileOptionRow(context, "Shopping", "Go to your Shopping Profile", Icons.shopping_bag, [
          _buildSmallIconCard(context, Icons.account_circle, "Account"),
          _buildSmallIconCard(context, Icons.history, "History"),
        ], Colors.purple[50]!, Colors.purple[100]!),
        _buildProfileOptionRow(context, "Explore", "Go to your Explore Profile", Icons.explore, [
          _buildSmallIconCard(context, Icons.person, "Profile"),
          _buildSmallIconCard(context, Icons.bookmark, "Saved"),
        ], Colors.orange[50]!, Colors.orange[100]!),
        _buildProfileOptionRow(context, "Parenting", "Go to your Parenting Profile", Icons.favorite, [
          _buildSmallIconCard(context, Icons.local_hospital, "Vacc/Grow"),
          _buildSmallIconCard(context, Icons.question_answer, "Q/A"),
        ], Colors.pink[50]!, Colors.pink[100]!),
        _buildProfileOptionRow(context, "Education", "Go to your Education Profile", Icons.school, [
          _buildSmallIconCard(context, Icons.quiz, "Quizzes"),
          _buildSmallIconCard(context, Icons.library_books, "Courses"),
        ], Colors.yellow[50]!, Colors.yellow[100]!),
      ],
    );
  }

  Widget _buildProfileOptionRow(BuildContext context, String title, String subtitle, IconData icon, List<Widget> smallIcons, Color bgColor, Color borderColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: bgColor,
                border: Border.all(color: borderColor, width: 1),
              ),
              child: ListTile(
                leading: Icon(icon, color: Colors.black),
                title: Text(title, style: interBold.copyWith(fontSize: getFontSize(context))),
                subtitle: Text(subtitle, style: interRegular.copyWith(fontSize: getFontSize(context))),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(width: getPadding(context)),
          Row(
            children: smallIcons,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallIconCard(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: getSpacing(context)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerServiceOptions(BuildContext context) {
    return Column(
      children: [
        _buildCustomerServiceOption(context, "Help & Support", Icons.help_outline),
        _buildCustomerServiceOption(context, "Notifications", Icons.notifications_outlined),
        _buildCustomerServiceOption(context, "Our Policies", Icons.policy),
      ],
    );
  }

  Widget _buildCustomerServiceOption(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: interBold.copyWith(fontSize: getFontSize(context))),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () {},
      child: Text("Sign Out", style: buttonTextStyle(context)),
    );
  }
}
