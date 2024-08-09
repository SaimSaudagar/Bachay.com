import 'package:flutter/material.dart';
import '../../Utils/app_constants.dart';

class OrderPlacedScreen extends StatefulWidget {
  final String price;

  const OrderPlacedScreen({super.key, required this.price});
  @override
  _OrderPlacedScreenState createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text('Order Placed',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
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
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 100),
                    SizedBox(height: getSpacing(context)),
                    Text('Your Order has been Placed.',
                        style: outfitBold.copyWith(
                            fontSize: getBigFontSize(context))),
                    Text('Your order has been received.',
                        style: interRegular.copyWith(
                            fontSize: getFontSize(context))),
                  ],
                ),
              ),
              SizedBox(height: getSpacing(context) * 2),
              const OrderDetailsSection(),
              SizedBox(height: getSpacing(context)),
              const PaymentSecuritySection(),
              SizedBox(height: getSpacing(context)),
              const SecurityPrivacySection(),
              SizedBox(height: getSpacing(context)),
              const TrackOrderButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({super.key});

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
              const Icon(Icons.local_shipping, color: Colors.green),
              SizedBox(width: getSpacing(context)),
              Text('Cash on Delivery',
                  style: interRegular.copyWith(fontSize: getFontSize(context))),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          Text('Talha Ahmed',
              style: interBold.copyWith(fontSize: getFontSize(context))),
          Text('03041978736',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          Text('Street No 05, Sector 19',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          Text('Karachi - Clifton, Sindh, Pakistan',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              const Icon(Icons.local_shipping, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Text('Standard Shipping',
                  style: interRegular.copyWith(fontSize: getFontSize(context))),
              const Spacer(),
              Text('Rs. 150',
                  style: interRegular.copyWith(fontSize: getFontSize(context))),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          Text('Estimated time Jun 19 - Jun 24',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context) * 2),
          const PriceItem(label: 'Subtotal:', price: 'Rs. 1,495'),
          const PriceItem(
              label: 'Coupon Code: FIRSTORDER1', price: '- Rs. 180'),
          const PriceItem(label: 'Delivery Fee:', price: 'FREE'),
          const Divider(),
          const PriceItem(
              label: 'Total Order:', price: 'Rs. 1,445', isBold: true),
          SizedBox(height: getSpacing(context)),
          const Row(
            children: [
              // Expanded(
              //   child: Image.network('https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', width: 60, height: 60),
              // ),
              // Expanded(
              //   child: Image.network('https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', width: 60, height: 60),
              // ),
              // Expanded(
              //   child: Image.network('https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', width: 60, height: 60),
              // ),
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

  const PriceItem(
      {super.key,
      required this.label,
      required this.price,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: isBold
                ? interBold.copyWith(fontSize: getFontSize(context))
                : interRegular.copyWith(fontSize: getFontSize(context))),
        Text(price,
            style: isBold
                ? interBold.copyWith(
                    fontSize: getFontSize(context), color: Colors.red)
                : interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }
}

class PaymentSecuritySection extends StatelessWidget {
  const PaymentSecuritySection({super.key});

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
          Text('Payment Security',
              style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Text(
              'Bachay.com is committed to protecting your payment information and only shares your card details with our payment service provider who are required to safeguard your information.',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              const Icon(Icons.security, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              const Icon(Icons.credit_card, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              const Icon(Icons.check, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              const Icon(Icons.verified_user, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              const Icon(Icons.payment, color: Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}

class SecurityPrivacySection extends StatelessWidget {
  const SecurityPrivacySection({super.key});

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
          Text('Security & Privacy',
              style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Text(
              'Bachay.com respects the privacy of users and visitors on our site, and we are committed to protecting it through maintaining industry-standard physical, technical, and administrative measures designed to guard your personal information from unauthorized processing, use or disclosure.',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }
}

class TrackOrderButton extends StatelessWidget {
  const TrackOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: buttonPaddingValue),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundBorderRadius),
          ),
        ),
        child: Text('Track Order',
            style: buttonTextStyle(context)
                .copyWith(fontSize: getBigFontSize(context))),
      ),
    );
  }
}
