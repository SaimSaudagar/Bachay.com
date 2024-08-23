import 'package:app/API/Bloc/Cart/Cart_Bloc.dart';
import 'package:app/API/Bloc/Cart/Cart_Event.dart';
import 'package:app/API/Bloc/Cart/Cart_State.dart';
import 'package:app/API/Repository/Cart_Repo.dart';
import 'package:app/Models/Cart/CartItem.dart';
import 'package:app/Screens/Checkout/Order_Confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Utils/app_constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> _cartItems = [];
  int itemCount = 0;
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (_) =>
          CartBloc(cartRepository: CartRepository())..add(LoadCartList()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/images/Back-Button.svg'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              itemCount =
                  state is CartListLoaded ? state.cartList.cartItems.length : 0;
              return Text('Cart($itemCount)',
                  style:
                      outfitBold.copyWith(fontSize: getBigFontSize(context)));
            },
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/images/notification.svg'),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/images/favorites.svg'),
              onPressed: () {},
            ),
          ],
        ),
        body: 
        Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 2),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignInSection(),
                      SizedBox(height: getSpacing(context)),
                      VoucherInputSection(),
                      SizedBox(height: getSpacing(context)),
                      allProductsSection(),
                      SizedBox(height: getSpacing(context)),
                      cart(),
                      SizedBox(height: getSpacing(context)),
                      featuresSection(context),
                    ],
                  ),
                ),
              ),
              checkoutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget allProductsSection() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartListLoading) {
          return Container();
        } else if (state is CartListLoaded) {
          return buildAllProductsSection(context);
        } else if (state is CartListError) {
          return Container();
        }
        return Container();
      },
    );
  }

  Widget buildAllProductsSection(BuildContext context) {
    return Row(
      children: [
        const Radio(
          value: true,
          groupValue: true,
          onChanged: null,
          activeColor: buttonColorPurple,
        ),
        Text('All Products',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.read<CartBloc>().add(DeleteCart());
          },
          child: const Text('Delete All', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }

  Widget cart() {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartListLoading || state is UpdateCartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartListLoaded) {
          _cartItems = state.cartList.cartItems;
          _calculateCartTotals(_cartItems);
          return cartSection("Your Cart", state.cartList.cartItems, context);
        } else {
          return const Center(child: Text('Cart is empty'));
        }
      },
    );
  }

  void _calculateCartTotals(List<CartItem> cartItems) {
    totalPrice = 0.0;
    itemCount = 0;
    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
      itemCount += item.quantity;
    }
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
    // Convert the color string to a Color object (assuming color is stored as a hex string like "#FFFFFF")
    Color? itemColor;
    if (item.color != null && item.color!.isNotEmpty) {
      itemColor = _getColorFromHex(item.color!);
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: getSpacing(context) / 2),
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
            SizedBox(width: getSpacing(context) / 2),
            // Item image
            Image.network(item.thumbnail, width: 80, height: 80),
            SizedBox(width: getSpacing(context) / 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item name
                  Text(
                    item.name,
                    style: interRegular.copyWith(
                      fontSize: getFontSize(context),
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: getSpacing(context) / 2),
                  // Item color dropdown or color display
                  Row(
                    children: [
                      if (item.color != null) ...[
                        Text(
                          'Color:',
                          style: contentC5.copyWith(
                              fontSize: getFontSize(context)),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: itemColor,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            item.color!,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  SizedBox(height: getSpacing(context) / 2),
                  // Item price and discount
                  Row(
                    children: [
                      Text(
                        'Rs.${item.price}',
                        style: TextStyle(
                          color: buttonColorPurple,
                          fontSize: getFontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: getSpacing(context) / 2),
                      if (item.discount > 0) ...[
                        Text(
                          'Rs.${item.price + item.discount}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: getFontSize(context),
                            color: Colors.grey),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: getSpacing(context) / 2),
                  // Additional Information (e.g., Shipping Cost)
                  if (item.shippingCost > 0)
                    Text(
                      'Shipping: Rs.${item.shippingCost}',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context),
                          color: Colors.grey),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Row for Favorites and Delete Icons
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/images/favorites.svg'),
                      onPressed: () {
                        // Add to favorites logic here
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/images/delete.svg'),
                      onPressed: () {
                        setState(() {
                          _cartItems.remove(item);
                        });
                        context
                            .read<CartBloc>()
                            .add(DeleteCartItem(key: item.id.toString()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                // Row for Remove, Quantity, and Add Icons
                Container(
                  height: 40, // Adjusted height
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Shrink to fit content
                    children: [
                      _buildIconButton(
                        context,
                        iconPath: 'assets/images/delete.png', // Assuming this is the remove icon
                        iconSize: 16.0, // Adjust size as per the design
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            }
                          });
                          context.read<CartBloc>().add(
                              UpdateCart(key: item.id, quantity: item.quantity));
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: Colors.grey),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                        child: Text(
                          '${item.quantity.toString().padLeft(2, '0')}',
                          style: interRegular.copyWith(
                            fontSize: getFontSize(context),
                          ),
                        ),
                      ),
                      _buildIconButton(
                        context,
                        iconPath: 'assets/images/add.png', // Assuming this is the add icon
                        iconSize: 16.0, // Adjust size as per the design
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                          context.read<CartBloc>().add(
                              UpdateCart(key: item.id, quantity: item.quantity));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build an IconButton with custom styling
  Widget _buildIconButton(BuildContext context, {required String iconPath, required VoidCallback onPressed, double iconSize = 12.0}) {
    return IconButton(
      icon: Image.asset(
        iconPath,
        width: iconSize,
        height: iconSize,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero, // Remove padding around the icon
      constraints: BoxConstraints(), // Remove default constraints
    );
  }

  // Helper function to convert hex string to Color object
  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
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
                svgPath: 'assets/images/quicksecurepayments.png',
                label: 'Quick & Secure\nPayments',
                context: context),
            FeatureIcon(
                svgPath: 'assets/images/easyreturnrefunds.png',
                label: 'Easy Returns &\nRefunds',
                context: context),
            FeatureIcon(
                svgPath: 'assets/images/encrypteduserdata.png',
                label: 'Encrypted User\nData',
                context: context),
            FeatureIcon(
                svgPath: 'assets/images/PCI.png',
                label: 'PCI\nCertified',
                context: context),
          ],
        ),
      ],
    );
  }

  Widget checkoutSection() {
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
                  const SizedBox(width: 5),
                  Text('Rs. 125',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context),
                          decoration: TextDecoration.lineThrough)),
                  const SizedBox(width: 5),
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
                  const SizedBox(width: 10),
                  Text('Rs. ${totalPrice.toStringAsFixed(2)}',
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
                      builder: (context) => OrderConfirmationScreen(
                            cartItem: _cartItems,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: buttonPaddingValue, horizontal: 30),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundBorderRadius),
                ), // Important for gradient
                shadowColor: Colors.transparent, // Important for gradient
              ),
              child: Text('Checkout ($itemCount)',
                  style: buttonTextStyle(context)),
            ),
          ),
        ],
      ),
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
              decoration: const InputDecoration(
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

class FeatureIcon extends StatelessWidget {
  final String svgPath;
  final String label;
  final BuildContext context;

  const FeatureIcon({
    required this.svgPath,
    required this.label,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          svgPath,
          width: 40,  // Adjust the size as needed
          height: 40, // Adjust the size as needed
        ),
        SizedBox(height: getSpacing(context) / 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: outfitRegular.copyWith(
            fontSize: getFontSize(context),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
