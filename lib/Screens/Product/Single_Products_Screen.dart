import 'package:app/API/Bloc/Product/Product_Bloc.dart';
import 'package:app/API/Bloc/Product/Product_Event.dart';
import 'package:app/API/Bloc/Product/Product_State.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Models/Products/Single_Product.dart';
import 'package:app/Screens/Checkout/Checkout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Utils/app_constants.dart';

import '../../Widgets/App_Bar.dart';

class SingleProductScreen extends StatefulWidget {
  final int productId;

  SingleProductScreen({required this.productId});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  String _selectedSize = '2 - 4 Years';

  void _onSizeSelected(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(state: 3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocProvider(
                create: (_) =>
                    ProductBloc(productRepository: ProductRepository())
                      ..add(LoadSingleProduct(productId: widget.productId)),
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is SingleProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SingleProductLoaded) {
                      return singleProduct(state.singleProduct);
                    } else if (state is SingleProductError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const Center(
                          child: Text('Press the button to load product.'));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget singleProduct(SingleProduct product) {
    double circleRadius = MediaQuery.of(context).size.width *
        0.03; // Responsive radius for color options
    double chipFontSize = MediaQuery.of(context).size.width *
        0.03; // Responsive font size for size options
    double chipHeight = MediaQuery.of(context).size.width *
        0.01; // Responsive height for size options
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prodcutImages(product.images),
        SizedBox(height: getSpacing(context) * 3),
        header(product.unitPrice.toString(), product.discount.toString(),
            product.name),
        SizedBox(height: getSpacing(context) * 3),
        colors(product.colorImage),
        SizedBox(height: getSpacing(context) * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size:',
              style: interRegular.copyWith(fontSize: getFontSize(context)),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.straighten,
                      size: 18, color: buttonColorPurple),
                  const SizedBox(width: 4),
                  Text(
                    'Size Guide',
                    style: interRegular.copyWith(color: buttonColorPurple),
                  ),
                ],
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _sizeOption('12 - 24 Months', chipFontSize, chipHeight),
            _sizeOption('2 - 4 Years', chipFontSize, chipHeight),
            _sizeOption('4 - 6 Years', chipFontSize, chipHeight),
            _sizeOption('6 - 8 Years', chipFontSize, chipHeight),
            _sizeOption('8 - 12 Years', chipFontSize, chipHeight),
            _sizeOption('12+ Years', chipFontSize, chipHeight),
          ],
        ),
        SizedBox(height: getSpacing(context) * 3),
        Container(
          padding: EdgeInsets.all(getPadding(context)),
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              const Icon(Icons.monetization_on, color: Colors.orange, size: 30),
              SizedBox(width: getSpacing(context) * 3),
              Expanded(
                child: Text(
                  'Earn 50 Points Worth Rs. 8 on this Product.',
                  style: interRegular.copyWith(fontSize: getFontSize(context)),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(getPadding(context) / 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Text(
                      '08',
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: EdgeInsets.all(getPadding(context) / 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Text(
                      '39',
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: EdgeInsets.all(getPadding(context) / 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Text(
                      '42',
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: getSpacing(context) * 3),
        Container(
          padding: EdgeInsets.all(getPadding(context)),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              const Icon(Icons.local_shipping, color: Colors.black, size: 30),
              SizedBox(width: getSpacing(context) * 3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Standard Delivery',
                      style: interBold.copyWith(fontSize: getFontSize(context)),
                    ),
                    Text(
                      '19 Jun - 24 Jun',
                      style:
                          interRegular.copyWith(fontSize: getFontSize(context)),
                    ),
                  ],
                ),
              ),
              Text(
                'Rs. 125',
                style: interRegular.copyWith(
                  fontSize: getFontSize(context),
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: getSpacing(context) * 3),
              Text(
                'FREE',
                style: interBold.copyWith(
                  fontSize: getFontSize(context),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getSpacing(context) * 3),
        Text(
          'Offers & Discount',
          style: interBold.copyWith(fontSize: getBigFontSize(context)),
        ),
        SizedBox(height: getSpacing(context) * 3),
        Image.asset("assets/images/coupon_card.png"),
        SizedBox(height: getSpacing(context) * 3),
        featuredProducts(context),
        SizedBox(height: getSpacing(context) * 3),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(roundBorderRadius),
            gradient: appGradient,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(roundBorderRadius),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShoppingCartScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart),
                SizedBox(width: getSpacing(context) * 3),
                Text('Add to Cart', style: buttonTextStyle(context)),
              ],
            ),
          ),
        ),
      ],
    );
  }

//Images
  Widget prodcutImages(List<String> imageUrls) {
    int _currentIndex = 0;

    return Stack(
      children: [
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imageUrls.map((imageUrl) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "https://bachay.com$imageUrl",
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.black54,
            child: Text(
              '${_currentIndex + 1} / ${imageUrls.length}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

//Header
  Widget header(String price, String discountAmount, String name) {
    double discount = double.tryParse(discountAmount) ?? 0.0;
    double originalPrice = double.tryParse(price) ?? 0.0;
    double discountPercentage =
        originalPrice != 0.0 ? (discount / originalPrice) * 100 : 0.0;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  price,
                  style: interBold.copyWith(
                    fontSize: getBigFontSize(context),
                    color: buttonColorPurple,
                  ),
                ),
                if (discount != 0.0) ...[
                  SizedBox(width: getSpacing(context) * 3),
                  Text(
                    discountAmount,
                    style: interRegular.copyWith(
                      fontSize: getFontSize(context),
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: getSpacing(context) * 3),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getPadding(context) / 2,
                      vertical: getPadding(context) / 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Text(
                      '-${discountPercentage.toStringAsFixed(0)}%',
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: getSpacing(context) * 3),
        Text(
          name,
          style: interBold.copyWith(fontSize: getBigFontSize(context)),
        ),
      ],
    );
  }

//Colors
  Widget colors(List<SingleProductColorImage> colors) {
    double circleRadius = MediaQuery.of(context).size.width * 0.03;
    String? selectedColor;

    void _showColorSelectionSheet(BuildContext context, StateSetter setState) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: colors.map((colorImage) {
                    bool isSelected = selectedColor == colorImage.color;
                    return GestureDetector(
                      onTap: () {
                        setModalState(() {
                          selectedColor = colorImage.color;
                        });
                        setState(() {
                          selectedColor = colorImage.color;
                        });
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.blue,
                              width: isSelected ? 2.0 : 1.0,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Color(
                              int.parse(
                                  colorImage.color.replaceFirst('#', '0xff')),
                            ),
                            radius: circleRadius,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      );
    }

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  icon: Text(
                    selectedColor != null
                        ? 'Color: $selectedColor'
                        : 'Color: Select',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  label: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    _showColorSelectionSheet(context, setState);
                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: colors.map((colorImage) {
                bool isSelected = selectedColor == colorImage.color;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.blue,
                        width: isSelected ? 2.0 : 1.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color(
                        int.parse(colorImage.color.replaceFirst('#', '0xff')),
                      ),
                      radius: circleRadius,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _sizeOption(String size, double fontSize, double height) {
    return ChoiceChip(
      label: Text(
        size,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
      selected: _selectedSize == size,
      selectedColor: buttonColorPurple.withOpacity(0.1),
      onSelected: (selected) {
        _onSizeSelected(size);
      },
      labelStyle: TextStyle(
        color: _selectedSize == size ? buttonColorPurple : Colors.black,
        fontWeight: _selectedSize == size ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: _selectedSize == size ? buttonColorPurple : Colors.grey,
          width: 1.0,
        ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: height / 4),
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
            // return buildFeaturedProducts(context, state.products);
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5, // Set a fixed height
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: getSpacing(context),
          mainAxisSpacing: getSpacing(context),
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return buildFeaturedProductTile(context, products[index]);
        },
      ),
    );
  }

  Widget buildFeaturedProductTile(
      BuildContext context, FeaturedProduct product) {
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
