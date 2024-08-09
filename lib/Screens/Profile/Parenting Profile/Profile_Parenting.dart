import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/App_Bar.dart';
import 'Expert_Following.dart';
import 'Expert_Panel.dart';
import 'Following.dart';
import 'My_Posts.dart';
import 'My_Questions.dart';
import 'Questions_Following.dart';
class Parenting_Profile extends StatefulWidget {
  const Parenting_Profile({super.key});

  @override
  _Parenting_ProfileState createState() => _Parenting_ProfileState();
}

class _Parenting_ProfileState extends State<Parenting_Profile> {
  bool isRecentlyViewPressed = false;
  bool isRecentOrderedPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(state: 1),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/Celebrate.png'), // Replace with actual image URL
                  ),
                  SizedBox(width: getSpacing(context) * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Samira',
                          style: interBold.copyWith(
                              fontSize: getBigFontSize(context))),
                      Text('Welcome to Bachay.com',
                          style: interRegular.copyWith(
                              color: Colors.grey,
                              fontSize: getFontSize(context))),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/setting.png', // Replace with the actual path to your settings icon image
                      width:
                          getFontSize(context) * 2, // Adjust the size as needed
                      height:
                          getFontSize(context) * 2, // Adjust the size as needed
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => SettingsScreen()),
                      // );
                    },
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context) * 2),
              _buildFeaturesSection(context),
              Divider(color: Colors.grey.shade300),
              _buildMyOrdersSection(context),
              Divider(color: Colors.grey.shade300),
              _buildOthersSection(context),
              Divider(color: Colors.grey.shade300),
              _buildBottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Features',
            style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFeatureItem(
                context, 'Add Child', 'assets/images/child.png', () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => WalletScreen()));
            }),
            _buildFeatureItem(
                context, 'Expert Follow', 'assets/images/Expert Follow.png', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ExpertFollowingScreen()));
            }),
            _buildFeatureItem(
                context, 'Expert Panel', 'assets/images/Expert Panel.png', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExpertPanelScreen()));
            }),
            _buildFeatureItem(
                context, 'Bachay Club', 'assets/images/BachayClub.png', () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => GiftCardsScreen()));
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildMyOrdersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Profile',
            style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOrderItem(context, 'Posts', 'assets/images/posts.png',
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyPosts()));
            }),
            _buildOrderItem(context, 'Saved', 'assets/images/saved.png',
                () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ProductReturnScreen(
              //               returnRequests: [],
              //             )));
            }),
            _buildOrderItem(context, 'Questions', 'assets/images/Questions.png',
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyQuestions()));
            }),
            _buildOrderItem(context, 'Answers', 'assets/images/Answers.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingScreen()));
            }),
            _buildOrderItem(context, 'Following', 'assets/images/following.png',
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingScreen()));
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildOthersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Others',
            style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOtherItem(context, 'Follow\nQuestion', 'assets/images/Follow Question.png',
                () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsFollowing()));
            }),
            _buildOtherItem(context, 'My\nFollowers', 'assets/images/My Followers.png', () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
            }),
            _buildOtherItem(context, 'Vaccine\nTracking', 'assets/images/vaccine.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
            }),
            _buildOtherItem(context, 'Growth\nDetails', 'assets/images/growth.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ChildrenScreen()));
            }),
            _buildOtherItem(context, 'Baby\nNames', 'assets/images/baby-name.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()));
            }),
          ],
        ),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildOtherItem(context, 'Children', 'assets/images/children.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
            }),
              SizedBox(width: getSpacing(context) * 10),
            _buildOtherItem(context, 'Support', 'assets/images/24-support.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SupportScreen()));
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isRecentlyViewPressed = true;
                isRecentOrderedPressed = false;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RecentlyViewedScreen()));
            },
            child: Container(
              padding: buttonPadding,
              decoration: BoxDecoration(
                color: isRecentlyViewPressed ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(roundBorderRadius),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  'Recently Like',
                  style: buttonTextStyle(context).copyWith(
                      color:
                          isRecentlyViewPressed ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: getSpacing(context)),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isRecentlyViewPressed = false;
                isRecentOrderedPressed = true;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RecentOrderedScreen()));
            },
            child: Container(
              padding: buttonPadding,
              decoration: BoxDecoration(
                color: isRecentOrderedPressed ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(roundBorderRadius),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  'Recent Upvote',
                  style: buttonTextStyle(context).copyWith(
                      color:
                          isRecentOrderedPressed ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text, String imagePath,
      VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(imagePath,
              width: getFontSize(context) * 4,
              height: getFontSize(context) * 4),
          SizedBox(height: getSpacing(context)),
          Text(text,
              textAlign: TextAlign.center,
              style: interRegular.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, String text, String imagePath,
      VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(imagePath,
              width: getFontSize(context) * 4,
              height: getFontSize(context) * 4),
          SizedBox(height: getSpacing(context)),
          Text(text,
              textAlign: TextAlign.center,
              style: interRegular.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }

  Widget _buildOtherItem(BuildContext context, String text, String imagePath,
      VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(imagePath,
              width: getFontSize(context) * 4,
              height: getFontSize(context) * 4),
          SizedBox(height: getSpacing(context)),
          Text(text,
              textAlign: TextAlign.center,
              style: interRegular.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }
}
