import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/Models/Products/Products.dart';
import 'package:app/Screens/Product/Single_Products_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/Bloc/Product/Product_Bloc.dart';
import '../../API/Bloc/Product/Product_Event.dart';
import '../../API/Bloc/Product/Product_State.dart';
import '../../Utils/app_constants.dart';
import '../../Widgets/App_Bar.dart';
import '../../Widgets/Color_Fill_Sheet.dart';
import '../../Widgets/Search_Bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Widgets/Sidebar.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        state: 3,
      ),
      bottomNavigationBar: const FilterOptions(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchBar(
                // text: 'Select Location to see product availability',
                // onTap: () {},
                ),
            const FilterButtons(),
            const DeliveryButtons(),
            Padding(
              padding: EdgeInsets.all(getPadding(context)),
              child: allProducts(),
            ),
          ],
        ),
      ),
    );
  }

  //All Products
  Widget allProducts() {
    return BlocProvider(
      create: (_) => ProductBloc(productRepository: ProductRepository())
        ..add(LoadAllProducts()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllProductsLoaded) {
            return buildAllProducts(
                context, state.allProducts.allProducts!.data);
          } else if (state is AllProductsError) {
            return const Text('Failed to load all products');
          }
          return const Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildAllProducts(BuildContext context, List<Product> products) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleProductScreen(
                                  productId: products[index].id,
                                )),
                      ),
                    },
                child: buildAllProductTile(context, products[index]));
          },
        ),
      ],
    );
  }

  Widget buildAllProductTile(BuildContext context, Product product) {
    Color textColor = const Color.fromRGBO(191, 143, 57, 1);
    Color color = const Color.fromRGBO(255, 244, 223, 1);
    Color borderColor = const Color.fromRGBO(255, 198, 95, 1);
    double fontSize = MediaQuery.of(context).size.width * 0.025;
    double fontSizeBig = MediaQuery.of(context).size.width * 0.025;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(228, 228, 231, 1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) =>
                          const Center(child: Text('Image not available')),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Text(
                product.name.toString(),
                style: TextStyle(fontSize: fontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                RatingBarIndicator(
                  rating: 1,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemCount: 1,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Text(
                  '4.5',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' (100)',
                  style: TextStyle(fontSize: fontSize),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: borderColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Free Delivery',
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs.${product.unitPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getPadding(context), vertical: getSpacing(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Recommended',
                    style: TextStyle(
                        color: Colors.purple, fontSize: getFontSize(context))),
                const Icon(Icons.arrow_drop_down, color: Colors.purple),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Most Popular',
                style: TextStyle(
                    color: Colors.black, fontSize: getFontSize(context))),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Top Rated',
                style: TextStyle(
                    color: Colors.black, fontSize: getFontSize(context))),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Price',
                    style: TextStyle(
                        color: Colors.black, fontSize: getFontSize(context))),
                Icon(Icons.arrow_upward,
                    color: Colors.black, size: getFontSize(context)),
                Icon(Icons.arrow_downward,
                    color: Colors.black, size: getFontSize(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryButtons extends StatelessWidget {
  const DeliveryButtons({super.key});

  Widget horizontalSpacing(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.01,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getPadding(context), vertical: getSpacing(context)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeliveryButton(
              text: 'Fast Delivery',
              color: Colors.orange.shade100,
              textColor: Colors.orange.shade700,
              icon: Icons.local_shipping,
              onTap: () {},
            ),
            horizontalSpacing(context),
            DeliveryButton(
              text: 'Free Delivery',
              color: Colors.green.shade100,
              textColor: Colors.green.shade700,
              icon: Icons.local_shipping,
              onTap: () {},
            ),
            horizontalSpacing(context),
            DeliveryButton(
              text: 'Best Selling',
              color: Colors.grey.shade200,
              textColor: Colors.black,
              borderColor: Colors.black,
              onTap: () {},
            ),
            horizontalSpacing(context),
            DeliveryButton(
              text: 'Trending',
              color: Colors.grey.shade200,
              textColor: Colors.grey.shade500,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final IconData icon;
  final VoidCallback onTap;

  const DeliveryButton({
    required this.text,
    required this.color,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.icon = Icons.check,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor, size: getFontSize(context)),
            const SizedBox(width: 4),
            Text(
              text,
              style:
                  TextStyle(color: textColor, fontSize: getFontSize(context)),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOptions extends StatelessWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getPadding(context) * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterOptionButton(
            text: 'Colors',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ColorFilterSheet();
                },
              );
            },
          ),
          FilterOptionButton(text: 'Age', onTap: () {}),
          FilterOptionButton(text: 'Gender', onTap: () {}),
          FilterOptionButton(
            text: 'Filters',
            onTap: () {},
            color: Colors.black,
            textColor: Colors.white,
            icon: Icons.filter_list,
          ),
        ],
      ),
    );
  }
}

class FilterOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final IconData icon;

  const FilterOptionButton({
    required this.text,
    required this.onTap,
    this.color = const Color.fromRGBO(161, 161, 170, 0.1),
    this.textColor = Colors.black,
    this.icon = Icons.adjust,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: getFontSize(context)),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: getFontSize(context)),
          ),
        ],
      ),
    );
  }
}
