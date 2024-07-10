import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/App_Bar.dart';
import 'Settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shopping_Profile(),
    );
  }
}

class Shopping_Profile extends StatefulWidget {
  @override
  _Shopping_ProfileState createState() => _Shopping_ProfileState();
}

class _Shopping_ProfileState extends State<Shopping_Profile> {
  bool isRecentlyViewPressed = false;
  bool isRecentOrderedPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(state: 1),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/Celebrate.png'), // Replace with actual image URL
                  ),
                  SizedBox(width: getSpacing(context) * 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Samira', style: interBold.copyWith(fontSize: getBigFontSize(context))),
                      Text('Welcome to Bachay.com', style: interRegular.copyWith(color: Colors.grey, fontSize: getFontSize(context))),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/setting.png', // Replace with the actual path to your settings icon image
                      width: getFontSize(context) * 2, // Adjust the size as needed
                      height: getFontSize(context) * 2, // Adjust the size as needed
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen()),
                      );
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
        Text('Features', style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFeatureItem(context, 'Wallet: Rs. 140', 'assets/images/wallet.png'),
            _buildFeatureItem(context, 'Coupons: 02', 'assets/images/coupons.png'),
            _buildFeatureItem(context, 'Points: 200', 'assets/images/points.png'),
            _buildFeatureItem(context, 'Gift Cards', 'assets/images/gift_cards.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildMyOrdersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Orders', style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOrderItem(context, 'History', 'assets/images/history.png'),
            _buildOrderItem(context, 'Returns', 'assets/images/returns.png'),
            _buildOrderItem(context, 'Reorder', 'assets/images/reorder.png'),
            _buildOrderItem(context, 'Tracking', 'assets/images/tracking.png'),
            _buildOrderItem(context, 'Reviews', 'assets/images/reviews.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildOthersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Others', style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOtherItem(context, 'Favorites', 'assets/images/favorites.png'),
            _buildOtherItem(context, 'Payment', 'assets/images/card.png'),
            _buildOtherItem(context, 'Account', 'assets/images/account.png'),
            _buildOtherItem(context, 'Children', 'assets/images/children.png'),
            _buildOtherItem(context, 'Contact', 'assets/images/contact.png'),
          ],
        ),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOtherItem(context, 'Address', 'assets/images/address.png'),
            _buildOtherItem(context, 'Password', 'assets/images/password.png'),
            _buildOtherItem(context, 'Support', 'assets/images/24-support.png'),
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
                  'Recently View',
                  style: buttonTextStyle(context).copyWith(color: isRecentlyViewPressed ? Colors.white : Colors.black),
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
                  'Recent Ordered',
                  style: buttonTextStyle(context).copyWith(color: isRecentOrderedPressed ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text, String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: getFontSize(context) * 4, height: getFontSize(context) * 4),
        SizedBox(height: getSpacing(context)),
        Text(text, textAlign: TextAlign.center, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }

  Widget _buildOrderItem(BuildContext context, String text, String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: getFontSize(context) * 4, height: getFontSize(context) * 4),
        SizedBox(height: getSpacing(context)),
        Text(text, textAlign: TextAlign.center, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }

  Widget _buildOtherItem(BuildContext context, String text, String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: getFontSize(context) * 4, height: getFontSize(context) * 4),
        SizedBox(height: getSpacing(context)),
        Text(text, textAlign: TextAlign.center, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }
}
