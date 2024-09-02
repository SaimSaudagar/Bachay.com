import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/Models/Products/Products.dart';
import 'package:app/Screens/Product/Single_Products_Screen.dart';
import 'package:app/Widgets/CP_Bar.dart';
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
  static const String routeName = '/all-products';

  AllProductsScreen({super.key});
  Filter _filter = Filter(
      choice1: Choice1(name: '', title: '', options: []),
      choice0: Choice0(title: '', options: {}));
  String _selectedSize = '';
  List<String> _selectedColors = [];
  List<String> _selectedAges = [];
  String _selectedGender = '';

  void _onSizeSelected(String size) {
    if (_selectedSize != size) {
      _selectedSize = size;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository: ProductRepository())
        ..add(LoadAllProducts(
          colors: _selectedColors,
          ages: _selectedAges,
          gender: _selectedGender,
        )),
      child: Scaffold(
        appBar: const CustomAppBarWithBack(
          state: 3,
        ),
        bottomNavigationBar: filterOptions(context),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomSearchBar(),
              const FilterButtons(),
              const DeliveryButtons(),
              Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: allProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // All Products
  Widget allProducts() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        print('State: $state');
        if (state is AllProductsLoading) {
          return const Center(
            child: BouncingSvgLoader(
              svgAssetPath: 'assets/logo/progress_logo.svg',
              size: 100.0,
            ),
          );
        } else if (state is AllProductsLoaded) {
          _filter = state.allProducts.filter!;
          return buildAllProducts(context, state.allProducts.allProducts!.data);
        } else if (state is AllProductsError) {
          return const Text('Failed to load all products');
        }
        return const Center(child: Text('No products available'));
      },
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

  Widget filterOptions(BuildContext context) {
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
          FilterOptionButton(
            text: 'Age',
            onTap: () {
              _showAgeSelectionSheet(context);
            },
          ),
          FilterOptionButton(
            text: 'Gender',
            onTap: () {
              _showGenderSelectionSheet(context);
            },
          ),
          Builder(builder: (newContext) {
            return FilterOptionButton(
              text: 'Filters',
              onTap: () {
                showFilterBottomSheet(newContext);
              },
              color: Colors.black,
              textColor: Colors.white,
              icon: Icons.filter_list,
            );
          }),
        ],
      ),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => filterSheet(context),
    ).whenComplete(() {
      BlocProvider.of<ProductBloc>(context).add(LoadAllProducts(
          colors: _selectedColors,
          ages: _selectedAges,
          gender: _selectedGender));
    });
  }

  Widget filterSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Colors',
                    style: TextStyle(fontSize: getBigFontSize(context))),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: getSpacing(context)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                ),
                itemCount: _filter.choice0.options.length,
                itemBuilder: (context, index) {
                  String colorCode =
                      _filter.choice0.options.values.elementAt(index);
                  bool isSelected = _selectedColors.contains(colorCode);

                  return GestureDetector(
                    onTap: () {
                      if (isSelected) {
                        _selectedColors.remove(colorCode);
                      } else {
                        _selectedColors.add(colorCode);
                      }
                      (context as Element)
                          .markNeedsBuild(); // Trigger UI update
                    },
                    child: Container(
                      margin: EdgeInsets.all(getPadding(context)),
                      decoration: BoxDecoration(
                        color:
                            Color(int.parse(colorCode.replaceAll('#', '0xFF'))),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color:
                              isSelected ? Colors.purple : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text('Select Age',
                style: TextStyle(fontSize: getBigFontSize(context))),
            SizedBox(height: getSpacing(context)),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _filter.choice1.options
                  .map((age) => ChoiceChip(
                        label: Text(
                          age,
                          style: TextStyle(
                              fontSize: getFontSize(context),
                              fontWeight: FontWeight.bold),
                        ),
                        selected: _selectedAges.contains(age),
                        selectedColor: Colors.purple.withOpacity(0.1),
                        onSelected: (selected) {
                          if (_selectedAges.contains(age)) {
                            _selectedAges.remove(age);
                          } else {
                            _selectedAges.add(age);
                          }
                          (context as Element)
                              .markNeedsBuild(); // Trigger UI update
                        },
                        labelStyle: TextStyle(
                          color: _selectedAges.contains(age)
                              ? Colors.purple
                              : Colors.black,
                          fontWeight: _selectedAges.contains(age)
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(
                            color: _selectedAges.contains(age)
                                ? Colors.purple
                                : Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: getBarHeight(context) / 4),
                      ))
                  .toList(),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<ProductBloc>(context).add(LoadAllProducts(
                    colors: _selectedColors,
                    ages: _selectedAges,
                    gender: _selectedGender,
                  ));
                },
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAgeSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(getPadding(context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Age',
                    style: TextStyle(fontSize: getBigFontSize(context))),
                SizedBox(height: getSpacing(context)),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _filter.choice1.options
                      .map((age) => ChoiceChip(
                            label: Text(
                              age,
                              style: TextStyle(
                                  fontSize: getFontSize(context),
                                  fontWeight: FontWeight.bold),
                            ),
                            selected: _selectedAges.contains(age),
                            selectedColor: Colors.purple.withOpacity(0.1),
                            onSelected: (selected) {
                              if (_selectedAges.contains(age)) {
                                _selectedAges.remove(age);
                              } else {
                                _selectedAges.add(age);
                              }
                              (context as Element)
                                  .markNeedsBuild(); // Trigger UI update
                            },
                            labelStyle: TextStyle(
                              color: _selectedAges.contains(age)
                                  ? Colors.purple
                                  : Colors.black,
                              fontWeight: _selectedAges.contains(age)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: _selectedAges.contains(age)
                                    ? Colors.purple
                                    : Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: getBarHeight(context) / 4),
                          ))
                      .toList(),
                ),
                SizedBox(height: getSpacing(context)),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      BlocProvider.of<ProductBloc>(context).add(LoadAllProducts(
                        colors: _selectedColors,
                        ages: _selectedAges,
                        gender: _selectedGender,
                      ));
                    },
                    child: Text('Apply'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showGenderSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Gender',
                  style: TextStyle(fontSize: getBigFontSize(context))),
              SizedBox(height: getSpacing(context)),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: ['Male', 'Female', 'Unisex']
                    .map((gender) => ChoiceChip(
                          label: Text(
                            gender,
                            style: TextStyle(
                                fontSize: getFontSize(context),
                                fontWeight: FontWeight.bold),
                          ),
                          selected: _selectedGender == gender,
                          selectedColor: Colors.purple.withOpacity(0.1),
                          onSelected: (selected) {
                            if (_selectedGender == gender) {
                              _selectedGender = '';
                            } else {
                              _selectedGender = gender;
                            }
                            (context as Element)
                                .markNeedsBuild(); // Trigger UI update
                          },
                          labelStyle: TextStyle(
                            color: _selectedGender == gender
                                ? Colors.purple
                                : Colors.black,
                            fontWeight: _selectedGender == gender
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              color: _selectedGender == gender
                                  ? Colors.purple
                                  : Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: getBarHeight(context) / 4),
                        ))
                    .toList(),
              ),
              SizedBox(height: getSpacing(context)),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    BlocProvider.of<ProductBloc>(context).add(LoadAllProducts(
                      colors: _selectedColors,
                      ages: _selectedAges,
                      gender: _selectedGender,
                    ));
                  },
                  child: Text('Apply'),
                ),
              ),
            ],
          ),
        );
      },
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
