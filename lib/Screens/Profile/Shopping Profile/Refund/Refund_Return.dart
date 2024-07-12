import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';

class ReturnRefundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Return/Refund',
          style: TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How can we help?', style: interBold.copyWith(fontSize: getBigFontSize(context) * 1.5)),
            SizedBox(height: getSpacing(context) * 4),
            _buildOptionTile(
              context,
              imagePath: 'assets/images/back-square.png',
              title: 'I want to return the product',
              subtitle: 'Select this if you have received your product but not satisfied with the purchase.',
              onTap: () {
                // Handle return product option
              },
            ),
            Divider(),
            _buildOptionTile(
              context,
              imagePath: 'assets/images/cancel.png',
              title: 'I didn\'t receive the products.',
              subtitle: 'Select this if you have not received the product.',
              onTap: () {
                // Handle didn't receive product option
              },
            ),
          Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, {required String imagePath, required String title, required String subtitle, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: getSpacing(context) * 2),
        child: Row(
          children: [
            Image.asset(imagePath, width: getBigFontSize(context) * 1.5, height: getBigFontSize(context) * 1.5),
            SizedBox(width: getSpacing(context) * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: interBold.copyWith(fontSize: getFontSize(context))),
                  SizedBox(height: getSpacing(context)),
                  Text(subtitle, style: interRegular.copyWith(fontSize: getFontSize(context))),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: getFontSize(context)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReturnRefundScreen(),
    );
  }
}
