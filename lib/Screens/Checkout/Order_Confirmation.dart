import 'package:app/API/Bloc/Order/Order_Bloc.dart';
import 'package:app/API/Bloc/Order/Order_Event.dart';
import 'package:app/API/Bloc/Order/Order_State.dart';
import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Screens/Checkout/Order_Placed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utils/app_constants.dart';

class OrderConfirmationScreen extends StatefulWidget {
  final List<CartItem> cartItem;

  const OrderConfirmationScreen({super.key, required this.cartItem});
  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmations',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total: Rs. 1,445',
                  style: interBold.copyWith(
                      fontSize: getBigFontSize(context), color: Colors.red)),
              const Divider(color: Colors.blue),
              SizedBox(height: getSpacing(context)),
              deliveryInformationSection(context),
              SizedBox(height: getSpacing(context)),
              shippingMethodSection(context),
              SizedBox(height: getSpacing(context)),
              const PaymentMethodSection(),
              SizedBox(height: getSpacing(context)),
              const OptionsSection(),
              SizedBox(height: getSpacing(context)),
              orderDetailsSection(context),
              SizedBox(height: getSpacing(context)),
              const TotalPriceSection(),
              SizedBox(height: getSpacing(context)),
              const PaymentSecuritySection(),
              SizedBox(height: getSpacing(context)),
              const SecurityPrivacySection(),
              SizedBox(height: getSpacing(context)),
              placeOrderButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget deliveryInformationSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Information',
              style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Text('Talha Ahmed',
              style: interBold.copyWith(fontSize: getFontSize(context))),
          Text('03041978736',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          Text('Street No 05, Sector 19',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          Text('Karachi - Clifton, Sindh, Pakistan',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget shippingMethodSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping Method',
              style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              Text('Standard Shipping',
                  style: interRegular.copyWith(fontSize: getFontSize(context))),
              const Spacer(),
              Text('Rs. 150',
                  style: interRegular.copyWith(fontSize: getFontSize(context))),
              const Align(
                alignment: Alignment.topRight,
                child:
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          Text('Estimated time Jun 19 - Jun 24',
              style: interRegular.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }

  Widget orderDetailsSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade300)), // More null-safe
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Order Details',
                  style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Assuming outfitBold was bold
                      fontSize: getFontSize(context))),
              const Spacer(),
              Text('View All Items',
                  style: TextStyle(
                      color: Colors.blue, fontSize: getFontSize(context))),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.cartItem.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  OrderItem(
                    imageUrl: widget.cartItem[index].thumbnail,
                    price: widget.cartItem[index].price.toString(),
                  ),
                  const SizedBox(
                      width: 20), // Example spacing, adjust as needed
                ],
              );
            },
          ),
          SizedBox(height: getSpacing(context)),
        ],
      ),
    );
  }

  Widget placeOrderButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: appGradient,
        borderRadius: BorderRadius.circular(roundBorderRadius),
      ),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is PlaceOrderLoaded) {
            state.response != 0
                ? ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order Placed Successfully'),
                    ),
                  )
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to place order'),
                    ),
                  );
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderPlacedScreen(
                        price: widget.cartItem
                            .map((e) => e.price)
                            .reduce((value, element) => value + element)
                            .toString(),
                      )),
            );
          } else if (state is PlaceOrderLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Placing Order...'),
              ),
            );
          } else if (state is PlaceOrderError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to place order: ${state.message}'),
              ),
            );
          }
        },
        child: ElevatedButton(
          onPressed: () {
            context.read<OrderBloc>().add(PlaceOrder());
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: buttonPaddingValue),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(roundBorderRadius),
            ),
            shadowColor: Colors.transparent,
          ),
          child: Text('Place Order',
              style: buttonTextStyle(context)
                  .copyWith(fontSize: getBigFontSize(context))),
        ),
      ),
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Payment Method',
              style: outfitBold.copyWith(fontSize: getFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Row(
            children: [
              // Replace with actual payment method icons
              const Icon(Icons.credit_card, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              const Icon(Icons.payment, color: Colors.purple),
              SizedBox(width: getSpacing(context)),
              // Add more icons as needed
              const Spacer(),
              const Align(
                alignment: Alignment.topRight,
                child:
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OptionsSection extends StatelessWidget {
  const OptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OptionItem(icon: Icons.code, text: 'Coupon Code: FIRSTORDER1'),
        OptionItem(icon: Icons.card_giftcard, text: 'Gift Card:'),
        OptionItem(icon: Icons.account_balance_wallet, text: 'Wallet:'),
        OptionItem(icon: Icons.star, text: 'Points:'),
      ],
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const OptionItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          SizedBox(width: getSpacing(context)),
          Text(text,
              style: interRegular.copyWith(fontSize: getFontSize(context))),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String price;

  const OrderItem({super.key, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Column(
              children: [
                Icon(
                  Icons.error,
                  size: 30,
                  color: Colors.red,
                ),
                Text(
                  'Image not found',
                  style: TextStyle(color: Colors.red, fontSize: 10),
                )
              ],
            );
          },
        ),
        Text(price,
            style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }
}

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PriceItem(label: 'Subtotal:', price: 'Rs. 1,495'),
          PriceItem(label: 'Coupon Code: FIRSTORDER1', price: '- Rs. 180'),
          PriceItem(label: 'Delivery Fee:', price: 'FREE'),
          Divider(),
          PriceItem(label: 'Total Order:', price: 'Rs. 1,445', isBold: true),
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
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
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
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
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
