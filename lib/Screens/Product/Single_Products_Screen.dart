import 'package:flutter/material.dart';
import '../../Utils/app_constants.dart';

import '../../Widgets/App_Bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleProductScreen(),
    );
  }
}

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

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
    double circleRadius = MediaQuery.of(context).size.width * 0.03; // Responsive radius for color options
    double chipFontSize = MediaQuery.of(context).size.width * 0.04; // Responsive font size for size options
    double chipHeight = MediaQuery.of(context).size.width * 0.1; // Responsive height for size options

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', // Replace with actual image URL
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.cover,
              ),
              SizedBox(height: getSpacing(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Rs. 2,699',
                        style: interBold.copyWith(
                          fontSize: getBigFontSize(context),
                          color: buttonColorPurple,
                        ),
                      ),
                      SizedBox(width: getSpacing(context)),
                      Text(
                        'Rs. 3,999',
                        style: interRegular.copyWith(
                          fontSize: getFontSize(context),
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: getSpacing(context)),
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
                          '-24%',
                          style: interRegular.copyWith(
                            fontSize: getFontSize(context),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context)),
              Text(
                'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve Shirt',
                style: interBold.copyWith(fontSize: getBigFontSize(context)),
              ),
              SizedBox(height: getSpacing(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Text(
                      'Color: Black',
                      style: interRegular.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.black,
                      ),
                    ),
                    label: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: interRegular.copyWith(
                        color: buttonColorPurple,
                        fontSize: getFontSize(context),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.black, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.grey, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.brown, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.pink, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.red, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.green, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.blue, radius: circleRadius),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Colors.orange, radius: circleRadius),
                ],
              ),
              SizedBox(height: getSpacing(context)),
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
                        Icon(Icons.straighten, size: 18, color: buttonColorPurple),
                        SizedBox(width: 4),
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
                children: [
                  _sizeOption('12 - 24 Months', chipFontSize, chipHeight),
                  _sizeOption('2 - 4 Years', chipFontSize, chipHeight),
                  _sizeOption('4 - 6 Years', chipFontSize, chipHeight),
                  _sizeOption('6 - 8 Years', chipFontSize, chipHeight),
                  _sizeOption('8 - 12 Years', chipFontSize, chipHeight),
                  _sizeOption('12+ Years', chipFontSize, chipHeight),
                ],
              ),
              SizedBox(height: getSpacing(context)),
              Container(
                padding: EdgeInsets.all(getPadding(context)),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  children: [
                    Icon(Icons.monetization_on, color: Colors.orange, size: 30),
                    SizedBox(width: getSpacing(context)),
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
                        SizedBox(width: 4),
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
                        SizedBox(width: 4),
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
              SizedBox(height: getSpacing(context)),
              Container(
                padding: EdgeInsets.all(getPadding(context)),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_shipping, color: Colors.black, size: 30),
                    SizedBox(width: getSpacing(context)),
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
                            style: interRegular.copyWith(fontSize: getFontSize(context)),
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
                    SizedBox(width: getSpacing(context)),
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
              SizedBox(height: getSpacing(context)),
              Text(
                'Offers & Discount',
                style: interBold.copyWith(fontSize: getBigFontSize(context)),
              ),
              SizedBox(height: getSpacing(context)),
              Container(
                padding: EdgeInsets.all(getPadding(context)),
                decoration: BoxDecoration(
                  gradient: appGradient,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '15% OFF',
                          style: interBold.copyWith(fontSize: getBigFontSize(context), color: Colors.purple),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Apply'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColorPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getSpacing(context)),
                    Text(
                      'Over Rs. 1000',
                      style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.black),
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Code: NEW111', style: interRegular.copyWith(fontSize: getFontSize(context))),
                            Text('06-08-2024 to 07-08-2024', style: interRegular.copyWith(fontSize: getFontSize(context))),
                            Text('Applies to Selected Products', style: interRegular.copyWith(fontSize: getFontSize(context))),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Expire in', style: interRegular.copyWith(fontSize: getFontSize(context))),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(getPadding(context) / 4),
                                  decoration: BoxDecoration(
                                    color: buttonColorPurple,
                                    borderRadius: BorderRadius.circular(borderRadius),
                                  ),
                                  child: Text(
                                    '06',
                                    style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  padding: EdgeInsets.all(getPadding(context) / 4),
                                  decoration: BoxDecoration(
                                    color: buttonColorPurple,
                                    borderRadius: BorderRadius.circular(borderRadius),
                                  ),
                                  child: Text(
                                    '39',
                                    style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  padding: EdgeInsets.all(getPadding(context) / 4),
                                  decoration: BoxDecoration(
                                    color: buttonColorPurple,
                                    borderRadius: BorderRadius.circular(borderRadius),
                                  ),
                                  child: Text(
                                    '42',
                                    style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getSpacing(context)),
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: getSpacing(context)),
                      Text('Add to Cart', style: buttonTextStyle(context)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sizeOption(String size, double fontSize, double height) {
    return ChoiceChip(
      label: Text(
        size,
        style: TextStyle(fontSize: fontSize),
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
}
