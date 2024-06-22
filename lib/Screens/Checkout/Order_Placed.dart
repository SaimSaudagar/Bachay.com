import 'package:flutter/material.dart';
import '../../Utils/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Confirmation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: OrderPlacedScreen(),
    );
  }
}

class OrderPlacedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text('Order Placed', style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 100),
                    SizedBox(height: getSpacing(context)),
                    Text('Your Order has been Placed.', style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
                    Text('Your order has been received.', style: interRegular.copyWith(fontSize: getFontSize(context))),
                  ],
                ),
              ),
              SizedBox(height: getSpacing(context) * 2),
              OrderDetailsSection(),
              SizedBox(height: getSpacing(context)),
              PaymentSecuritySection(),
              SizedBox(height: getSpacing(context)),
              SecurityPrivacySection(),
              SizedBox(height: getSpacing(context)),
              TrackOrderButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple[100]!),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.local_shipping, color: Colors.green),
              SizedBox(width: getSpacing(context)),
              Text('Cash on Delivery', style: interRegular.copyWith(fontSize: getFontSize(context))),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          Text('Talha Ahmed', style: interBold.copyWith(fontSize: getFontSize(context))),
          Text('03041978736', style: interRegular.copyWith(fontSize: getFontSize(context))),
          Text('Street No 05, Sector 19', style: interRegular.copyWith(fontSize: getFontSize(context))),
          Text('Karachi - Clifton, Sindh, Pakistan', style: interRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              Icon(Icons.local_shipping, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Text('Standard Shipping', style: interRegular.copyWith(fontSize: getFontSize(context))),
              Spacer(),
              Text('Rs. 150', style: interRegular.copyWith(fontSize: getFontSize(context))),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          Text('Estimated time Jun 19 - Jun 24', style: interRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context) * 2),
          PriceItem(label: 'Subtotal:', price: 'Rs. 1,495'),
          PriceItem(label: 'Coupon Code: FIRSTORDER1', price: '- Rs. 180'),
          PriceItem(label: 'Delivery Fee:', price: 'FREE'),
          Divider(),
          PriceItem(label: 'Total Order:', price: 'Rs. 1,445', isBold: true),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              Expanded(
                child: Image.network('https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', width: 60, height: 60),
              ),
              Expanded(
                child: Image.network('https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', width: 60, height: 60),
              ),
              Expanded(
                child: Image.network('https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', width: 60, height: 60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PriceItem extends StatelessWidget {
  final String label;
  final String price;
  final bool isBold;

  PriceItem({required this.label, required this.price, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: isBold ? interBold.copyWith(fontSize: getFontSize(context)) : interRegular.copyWith(fontSize: getFontSize(context))),
        Text(price, style: isBold ? interBold.copyWith(fontSize: getFontSize(context), color: Colors.red) : interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }
}

class PaymentSecuritySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple[100]!),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Security', style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Text('Bachay.com is committed to protecting your payment information and only shares your card details with our payment service provider who are required to safeguard your information.', style: interRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              Icon(Icons.security, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Icon(Icons.credit_card, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Icon(Icons.check, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Icon(Icons.verified_user, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Icon(Icons.payment, color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}

class SecurityPrivacySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple[100]!),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Security & Privacy', style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Text('Bachay.com respects the privacy of users and visitors on our site, and we are committed to protecting it through maintaining industry-standard physical, technical, and administrative measures designed to guard your personal information from unauthorized processing, use or disclosure.', style: interRegular.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }
}

class TrackOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: buttonPaddingValue),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundBorderRadius),
          ),
        ),
        child: Text('Track Order', style: buttonTextStyle(context).copyWith(fontSize: getBigFontSize(context))),
      ),
    );
  }
}
