import 'package:app/API/Bloc/Cart/Cart_Bloc.dart';
import 'package:app/API/Bloc/Cart/Cart_Event.dart';
import 'package:app/API/Bloc/Cart/Cart_State.dart';
import 'package:app/API/Repository/Cart_Repo.dart';
import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Screens/Checkout/Order_Confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utils/app_constants.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${_cartItems.length})',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SignInSection(),
                    SizedBox(height: getSpacing(context)),
                    VoucherInputSection(),
                    SizedBox(height: getSpacing(context)),
                    AllProductsSection(),
                    SizedBox(height: getSpacing(context)),
                    cart(),
                    SizedBox(height: getSpacing(context)),
                    featuresSection(context),
                  ],
                ),
              ),
            ),
            CheckoutSection(),
          ],
        ),
      ),
    );
  }

  void _deleteCartItem(CartItem item) {
    setState(() {
      _cartItems.remove(item);
    });
  }

  Widget cart() {
    return BlocProvider(
      create: (_) =>
          CartBloc(cartRepository: CartRepository())..add(LoadCartList()),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartListLoading) {
            return SizedBox();
          } else if (state is CartListLoaded) {
            return cartSection("Bachay", state.cartList.carts, context);
          } else if (state is CartListError) {
            return SizedBox();
          }
          return Center(child: Text('Press a button to load discount banner'));
        },
      ),
    );
  }

  Widget cartSection(String title, List<CartItem> items, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Column(
          children: items.map((item) => cartItemWidget(item, context)).toList(),
        ),
      ],
    );
  }

  Widget cartItemWidget(CartItem item, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: getSpacing(context)),
      child: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: true,
              groupValue: true,
              onChanged: (value) {},
              activeColor: buttonColorPurple,
            ),
            Image.network(item.thumbnail, width: 60, height: 60),
            SizedBox(width: getSpacing(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context))),
                  SizedBox(height: getSpacing(context)),
                  Row(
                    children: [
                      Text('Color: ${item.color}',
                          style: contentC5.copyWith(
                              fontSize: getFontSize(context))),
                      SizedBox(width: getSpacing(context)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getPadding(context),
                            vertical: getSpacing(context)),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: Text(item.color ?? '',
                            style: interRegular.copyWith(
                                fontSize: getFontSize(context))),
                      ),
                    ],
                  ),
                  SizedBox(height: getSpacing(context)),
                  Row(
                    children: [
                      Text('Rs.${item.price}',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: getFontSize(context))),
                      SizedBox(width: getSpacing(context)),
                      Text('Rs.${item.price}',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: getFontSize(context))),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteCartItem(item);
                  },
                  color: Colors.red,
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.purple,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (item.quantity > 1) item.quantity--;
                        });
                      },
                    ),
                    Text('${item.quantity}',
                        style: interRegular.copyWith(
                            fontSize: getFontSize(context))),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          item.quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget featuresSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Features',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FeatureIcon(
                icon: Icons.security,
                label: 'Quick & Secure\nPayments',
                context: context),
            FeatureIcon(
                icon: Icons.refresh,
                label: 'Easy Returns &\nRefunds',
                context: context),
            FeatureIcon(
                icon: Icons.lock,
                label: 'Encrypted User\nData',
                context: context),
            FeatureIcon(
                icon: Icons.verified,
                label: 'PCI\nCertified',
                context: context),
          ],
        ),
      ],
    );
  }
}

class SignInSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.purple[100]!), // Light purple border color
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign in/Signup',
                    style:
                        outfitBold.copyWith(fontSize: getBigFontSize(context))),
                SizedBox(height: getSpacing(context)),
                Text(
                  'Please Sign in or Sign up to place order and also apply coupons and discounts.',
                  style: interRegular.copyWith(
                      fontSize: getFontSize(context), color: fontcolor),
                ),
              ],
            ),
          ),
          SizedBox(width: getSpacing(context)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColorPurple,
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    roundBorderRadius), // More rounded border radius
              ),
            ),
            child: Text('Sign in', style: buttonTextStyle(context)),
          ),
        ],
      ),
    );
  }
}

class VoucherInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.purple[100]!), // Light purple border color
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Voucher',
                border: InputBorder.none,
              ),
              style: interRegular.copyWith(
                  fontSize: getFontSize(context), color: fontcolor),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColorPurple,
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    roundBorderRadius), // More rounded border radius
              ),
            ),
            child: Text('Apply', style: buttonTextStyle(context)),
          ),
        ],
      ),
    );
  }
}

class AllProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: true,
          groupValue: true,
          onChanged: (value) {},
          activeColor: buttonColorPurple,
        ),
        Text('All Products',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text('Delete',
              style:
                  TextStyle(color: Colors.red, fontSize: getFontSize(context))),
        ),
      ],
    );
  }
}

class FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final BuildContext context;

  FeatureIcon({required this.icon, required this.label, required this.context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(getSpacing(context)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
          child: Icon(icon, size: 30, color: buttonColorPurple),
        ),
        SizedBox(height: getSpacing(context)),
        Text(label,
            textAlign: TextAlign.center,
            style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }
}

class CheckoutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Delivery',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context))),
                  SizedBox(width: 5),
                  Text('Rs. 125',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context),
                          decoration: TextDecoration.lineThrough)),
                  SizedBox(width: 5),
                  Text('FREE',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context),
                          color: Colors.purple)),
                ],
              ),
              SizedBox(height: getSpacing(context)),
              Row(
                children: [
                  Text('Total',
                      style:
                          interBold.copyWith(fontSize: getFontSize(context))),
                  SizedBox(width: 10),
                  Text('Rs. 5,288',
                      style: interBold.copyWith(
                          fontSize: getFontSize(context),
                          color: Colors.purple)),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: appGradient,
              borderRadius: BorderRadius.circular(roundBorderRadius),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderConfirmationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: buttonPaddingValue, horizontal: 30),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundBorderRadius),
                ), // Important for gradient
                shadowColor: Colors.transparent, // Important for gradient
              ),
              child: Text('Checkout (02)', style: buttonTextStyle(context)),
            ),
          ),
        ],
      ),
    );
  }
}
