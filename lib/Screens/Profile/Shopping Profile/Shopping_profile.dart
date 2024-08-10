import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/App_Bar.dart';
import 'Coupons.dart';
import 'Order_History.dart';
import 'Points.dart';
import 'Refund/Refund_Status.dart';
import 'Settings.dart';
import 'Wallet.dart';

class Shopping_Profile extends StatefulWidget {
  const Shopping_Profile({super.key});

  @override
  _Shopping_ProfileState createState() => _Shopping_ProfileState();
}

class _Shopping_ProfileState extends State<Shopping_Profile> {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()),
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
        Text('Features',
            style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFeatureItem(
                context, 'Wallet: Rs. 140', 'assets/images/wallet.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WalletScreen()));
            }),
            _buildFeatureItem(
                context, 'Coupons: 02', 'assets/images/coupons.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CouponScreen()));
            }),
            _buildFeatureItem(
                context, 'Points: 200', 'assets/images/points.png', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PointsScreen()));
            }),
            _buildFeatureItem(
                context, 'Gift Cards', 'assets/images/gift_cards.png', () {
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
        Text('My Orders',
            style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildOrderItem(context, 'History', 'assets/images/history.png',
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderHistoryScreen()));
            }),
            _buildOrderItem(context, 'Returns', 'assets/images/returns.png',
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductReturnScreen(
                            returnRequests: [],
                          )));
            }),
            _buildOrderItem(context, 'Reorder', 'assets/images/reorder.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ReorderScreen()));
            }),
            _buildOrderItem(context, 'Tracking', 'assets/images/tracking.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingScreen()));
            }),
            _buildOrderItem(context, 'Reviews', 'assets/images/reviews.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewProductScreen()));
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
            _buildOtherItem(context, 'Favorites', 'assets/images/favorites.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen()));
            }),
            _buildOtherItem(context, 'Payment', 'assets/images/card.png', () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
            }),
            _buildOtherItem(context, 'Account', 'assets/images/account.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
            }),
            _buildOtherItem(context, 'Children', 'assets/images/children.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ChildrenScreen()));
            }),
            _buildOtherItem(context, 'Contact', 'assets/images/contact.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()));
            }),
          ],
        ),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildOtherItem(context, 'Address', 'assets/images/address.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
            }),
            SizedBox(width: getSpacing(context) * 10),
            _buildOtherItem(context, 'Password', 'assets/images/password.png',
                () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen()));
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
                  'Recently View',
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
                  'Recent Ordered',
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
