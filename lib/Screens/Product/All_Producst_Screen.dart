import 'package:flutter/material.dart';

import '../../Widgets/App_Bar.dart';
import '../../Widgets/Location_Bar.dart';

class AllProducstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          LocationButton(
            text: 'Select Location to see product availability',
            onTap: () {},
          ),
          FilterButtons(),
          DeliveryButtons(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            ),
          ),
          FilterOptions(),
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Recommended', style: TextStyle(color: Colors.purple)),
                Icon(Icons.arrow_drop_down, color: Colors.purple),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Most Popular', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Top Rated', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Price', style: TextStyle(color: Colors.black)),
                Icon(Icons.arrow_upward, color: Colors.black, size: 16),
                Icon(Icons.arrow_downward, color: Colors.black, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
          DeliveryButton(
            text: 'Free Delivery',
            color: Colors.green.shade100,
            textColor: Colors.green.shade700,
            icon: Icons.local_shipping,
            onTap: () {
              print('Free Delivery clicked');
            },
          ),
          DeliveryButton(
            text: 'Best Selling',
            color: Colors.grey.shade200,
            textColor: Colors.black,
            borderColor: Colors.black,
            onTap: () {
              print('Best Selling clicked');
            },
          ),
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

  DeliveryButton({
    required this.text,
    required this.color,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.icon = Icons.check,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
          Icon(icon, color: textColor, size: 10),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FilterOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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

  FilterOptionButton({
    required this.text,
    required this.onTap,
    this.color = Colors.grey,
    this.textColor = Colors.black,
    this.icon = Icons.adjust,
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
          Icon(icon, color: textColor, size: 16),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}

class ColorFilterSheet extends StatefulWidget {
  @override
  _ColorFilterSheetState createState() => _ColorFilterSheetState();
}

class _ColorFilterSheetState extends State<ColorFilterSheet> {
  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.cyan,
    Colors.yellow,
    Colors.purple,
  ];

  final Set<Color> selectedColors = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Colors', style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                final color = colors[index];
                final isSelected = selectedColors.contains(color);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedColors.remove(color);
                      } else {
                        selectedColors.add(color);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Rs. 789'),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16),
                    Text('4.9 (1k sold)'),
                  ],
                ),
                Text('Free Delivery'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
