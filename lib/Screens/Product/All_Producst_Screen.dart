import 'package:app/API/Repository/Product_Repository.dart';
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
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Widgets/Sidebar.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        state: 3,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          CustomSearchBar(
              // text: 'Select Location to see product availability',
              // onTap: () {},
              ),
          FilterButtons(),
          DeliveryButtons(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(getPadding(context)),
              child: featuredProducts(context),
            ),
          ),
          FilterOptions(),
        ],
      ),
    );
  }

  Widget featuredProducts(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(productRepository: ProductRepository())
        ..add(LoadAllProducts()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllProductsLoaded) {
            // return buildFeaturedProducts(context, state.allProducts);
          } else if (state is AllProductsError) {
            return const Center(child: Text('Failed to load products'));
          }
          return const Center(child: Text('Press a button to load products'));
        },
      ),
    );
  }

  Widget buildFeaturedProducts(
      BuildContext context, List<FeaturedProduct> products) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: getSpacing(context),
        mainAxisSpacing: getSpacing(context),
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SingleProductScreen(
                              productId: products[index].id,
                            )),
                  )
                },
            child: buildFeaturedProductTile(context, products[index]));
      },
    );
  }

  Widget buildFeaturedProductTile(
      BuildContext context, FeaturedProduct product) {
    Color textColor = Color.fromRGBO(191, 143, 57, 1);
    Color color = Color.fromRGBO(255, 244, 223, 1);
    Color borderColor = Color.fromRGBO(255, 198, 95, 1);
    double fontSize = MediaQuery.of(context).size.width * 0.025;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(228, 228, 231, 1),
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
                        BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) =>
                          Center(child: Text('Image not available')),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Text(
                product.name,
                style: TextStyle(fontSize: fontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                RatingBarIndicator(
                  rating: 4.5,
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
                    "\Rs.${product.variations[0].price.toStringAsFixed(2)}",
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
              onTap: () {
                print('Fast Delivery clicked');
              },
            ),
            horizontalSpacing(context),
            DeliveryButton(
              text: 'Free Delivery',
              color: Colors.green.shade100,
              textColor: Colors.green.shade700,
              icon: Icons.local_shipping,
              onTap: () {
                print('Free Delivery clicked');
              },
            ),
            horizontalSpacing(context),
            DeliveryButton(
              text: 'Best Selling',
              color: Colors.grey.shade200,
              textColor: Colors.black,
              borderColor: Colors.black,
              onTap: () {
                print('Best Selling clicked');
              },
            ),
            horizontalSpacing(context),
            DeliveryButton(
              text: 'Trending',
              color: Colors.grey.shade200,
              textColor: Colors.grey.shade500,
              onTap: () {
                print('Trending clicked');
              },
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
    Key? key,
  }) : super(key: key);

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
                  return ColorFilterSheet();
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
    Key? key,
  }) : super(key: key);

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
