import 'package:app/API/Bloc/Profile/Profile_Bloc.dart';
import 'package:app/API/Bloc/Profile/Profile_Event.dart';
import 'package:app/API/Bloc/Profile/Profile_State.dart';
import 'package:app/API/Repository/Profile_Repo.dart';
import 'package:app/Models/Profile/User_Profile.dart';
import 'package:app/Screens/Profile/Explore%20Profile/Explore_Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utils/app_constants.dart';
import '../../Widgets/App_Bar.dart';
import '../../Widgets/Botton_Nav_Bar.dart';
import 'Edit Profile/Add_Children.dart';
import 'Edit Profile/Edit_Profile.dart';
import 'Education Profile/Education_Profile.dart';
import 'Parenting Profile/Profile_Parenting.dart';
import 'Shopping Profile/Shopping_profile.dart';
import 'Shopping Profile/Wallet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

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
      appBar: const CustomAppBar(
        state: 2,
      ),
      body: profileScreen(context),
      bottomNavigationBar:
          CustomBottomNavigationBar(onTabSelected: _onTabSelected),
    );
  }

  Widget profileScreen(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(profileRepository: ProfileRepository())
        ..add(LoadProfile()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return _buildProfileScreen(context, state.profile);
          } else if (state is ProfileError) {
            return const SizedBox();
          }
          return const Center(child: SizedBox());
        },
      ),
    );
  }

  Widget _buildProfileScreen(BuildContext context, UserProfile user) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(getPadding(context)),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/Celebrate.png'),
          ),
          SizedBox(height: getSpacing(context)),
          Text(
            "${user.fName} ${user.lName}",
            style: interBold.copyWith(fontSize: getBigFontSize(context)),
          ),
          Text(
            user.tagline!,
            style: interRegular.copyWith(
                color: Colors.grey, fontSize: getFontSize(context)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfileScreen()),
              );
            },
            child: Text("Update Profile",
                style: interRegular.copyWith(
                    color: Colors.black,
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
        _buildIconCard(context, 'assets/images/settings-child.png', "Add Child",
            Colors.pink[50]!, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChildrenDetailsScreen()));
        }),
        _buildIconCard(context, 'assets/images/wallet.png', "Wallet\nRs. 150",
            Colors.lightGreen[100]!, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WalletScreen()));
        }),
        _buildIconCard(context, 'assets/images/points.png', "Points\n150",
            Colors.orange[100]!, () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PointsScreen()));
        }),
        _buildIconCard(context, 'assets/images/bachay_club.png', "Bachay\nClub",
            Colors.yellow[100]!, () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => BachayClubScreen()));
        }),
      ],
    );
  }

  Widget _buildIconCard(BuildContext context, String imagePath, String text, Color bgColor, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            SizedBox(height: getSpacing(context) / 2),
            Text(
              text,
              textAlign: TextAlign.center,
              style: interRegular.copyWith(fontSize: getFontSize(context) * 0.8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildProfileOptionRow(
            context,
            "Shopping",
            "Go to your Shopping Profile",
            'assets/images/home/shopping-active.png',
            [
              _buildSmallIconCard(
                  context, 'assets/images/account.png', "Account", () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingAccountScreen()));
              }),
              _buildSmallIconCard(
                  context, 'assets/images/history.png', "History", () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingHistoryScreen()));
              }),
            ],
            Colors.purple[50]!,
            Colors.purple[100]!, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Shopping_Profile()));
        }),
        _buildProfileOptionRow(
            context,
            "Explore",
            "Go to your Explore Profile",
            'assets/images/home/explore-active.png',
            [
              _buildSmallIconCard(
                  context, 'assets/images/profileicon.png', "Profile", () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreProfileScreen()));
              }),
              _buildSmallIconCard(context, 'assets/images/saved.png', "Saved",
                  () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SavedItemsScreen()));
              }),
            ],
            Colors.orange[50]!,
            Colors.orange[100]!, () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreProfileScreen()));
        }),
        _buildProfileOptionRow(
            context,
            "Parenting",
            "Go to your Parenting Profile",
            'assets/images/home/parenting-active.png',
            [
              _buildSmallIconCard(
                  context, 'assets/images/vacc_grow.png', "Vacc/Grow", () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => VaccinationGrowthScreen()));
              }),
              _buildSmallIconCard(context, 'assets/images/QA.png', "Q/A", () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QAScreen()));
              }),
            ],
            Colors.pink[50]!,
            Colors.pink[100]!, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Parenting_Profile()));
        }),
        _buildProfileOptionRow(
            context,
            "Education",
            "Go to your Education Profile",
            'assets/images/home/education-active.png',
            [
              _buildSmallIconCard(context, 'assets/images/Quiz.png', "Quizzes",
                  () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzesScreen()));
              }),
              _buildSmallIconCard(
                  context, 'assets/images/courses.png', "Courses", () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesScreen()));
              }),
            ],
            Colors.yellow[50]!,
            Colors.yellow[100]!, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EducationScreen()));
        }),
      ],
    );
  }

  Widget _buildProfileOptionRow(
      BuildContext context,
      String title,
      String subtitle,
      String imagePath,
      List<Widget> smallIcons,
      Color bgColor,
      Color borderColor,
      VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: bgColor,
                border: Border.all(color: borderColor, width: 1),
              ),
              child: ListTile(
                leading: Image.asset(imagePath, width: 40, height: 40),
                title: Text(title,
                    style: interBold.copyWith(fontSize: getFontSize(context))),
                subtitle: Text(subtitle,
                    style:
                        interRegular.copyWith(fontSize: getFontSize(context))),
                trailing:
                    Image.asset('assets/images/arrow-right.png', width: 24, height: 24),
                onTap: onTap,
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

  Widget _buildSmallIconCard(
      BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 60,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
            border: Border.all(color: Colors.grey[300]!, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 30, height: 30),
              SizedBox(height: getSpacing(context)),
              Text(
                text,
                textAlign: TextAlign.center,
                style: interRegular.copyWith(fontSize: getFontSize(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCustomerServiceOptions(BuildContext context) {
    return Column(
      children: [
        _buildCustomerServiceOption(
            context, "Help & Support", 'assets/images/24-support.png', () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupportScreen()));
        }),
        _buildCustomerServiceOption(
            context, "Notifications", 'assets/images/notification.png', () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
        }),
        _buildCustomerServiceOption(
            context, "Our Policies", 'assets/images/policy.png', () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => PoliciesScreen()));
        }),
      ],
    );
  }

  Widget _buildCustomerServiceOption(BuildContext context, String title,
      String imagePath, VoidCallback onTap) {
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset(imagePath, width: 40, height: 40),
          title: Text(title,
              style: interBold.copyWith(fontSize: getFontSize(context))),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSpacing(context) * 2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(vertical: getSpacing(context) * 2),
        ),
        onPressed: () {
          // Add sign-out logic here
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logout.png'),         
            SizedBox(width: getSpacing(context)),
            Text('Sign Out', style: buttonTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
