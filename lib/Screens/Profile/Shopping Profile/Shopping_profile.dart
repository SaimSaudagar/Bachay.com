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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Icon(Icons.settings),
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
            _buildFeatureItem(context, 'Wallet: Rs. 140', Icons.account_balance_wallet),
            _buildFeatureItem(context, 'Coupons: 02', Icons.card_giftcard),
            _buildFeatureItem(context, 'Points: 200', Icons.star),
            _buildFeatureItem(context, 'Gift Cards', Icons.card_membership),
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
            _buildOrderItem(context, 'History', Icons.history),
            _buildOrderItem(context, 'Returns', Icons.undo),
            _buildOrderItem(context, 'Reorder', Icons.repeat),
            _buildOrderItem(context, 'Tracking', Icons.local_shipping),
            _buildOrderItem(context, 'Reviews', Icons.rate_review),
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
            _buildOtherItem(context, 'Favorites', Icons.favorite),
            _buildOtherItem(context, 'Payment', Icons.payment),
            _buildOtherItem(context, 'Account', Icons.account_circle),
            _buildOtherItem(context, 'Children', Icons.child_care),
            _buildOtherItem(context, 'Contact', Icons.contact_mail),
          ],
        ),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOtherItem(context, 'Address', Icons.location_on),
            _buildOtherItem(context, 'Password', Icons.lock),
            _buildOtherItem(context, 'Support', Icons.support),
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

  Widget _buildFeatureItem(BuildContext context, String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: getFontSize(context) * 4),
        SizedBox(height: getSpacing(context)),
        Text(text, textAlign: TextAlign.center, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }

  Widget _buildOrderItem(BuildContext context, String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: getFontSize(context) * 4),
        SizedBox(height: getSpacing(context)),
        Text(text, textAlign: TextAlign.center, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }

  Widget _buildOtherItem(BuildContext context, String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: getFontSize(context) * 4),
        SizedBox(height: getSpacing(context)),
        Text(text, textAlign: TextAlign.center, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }
}

