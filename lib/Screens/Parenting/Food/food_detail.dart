import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Utils/app_constants.dart';

class FoodDetail extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final List<String> nutrients;
  final Map<String, bool> tags;

  const FoodDetail({
    Key? key,
    required this.imageUrl,
    required this.foodName,
    required this.nutrients,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  leading: Padding(
    padding: EdgeInsets.only(left: getPadding(context) * 0.5),
    child: IconButton(
      icon: SvgPicture.asset('assets/images/Back-Button.svg'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset(
        'assets/logo/Parenting.svg',
        height: getFontSize(context) * 3,
      ),
    ],
  ),
  centerTitle: false, // Set this to false
  actions: [
    Padding(
      padding: EdgeInsets.only(right: getPadding(context) * 0.5),
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/images/share.svg',
          color: Colors.black,
          width: getFontSize(context) * 2,
          height: getFontSize(context) * 2,
        ),
        onPressed: () {
          // Handle search action
        },
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: getPadding(context) * 0.5),
      child: IconButton(
        icon: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/notification.svg',
              color: Colors.black,
              width: getFontSize(context) * 2,
              height: getFontSize(context) * 2,
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  '02',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFontSize(context) * 0.8,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          // Handle notification action
        },
      ),
    ),
  ],
),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              foodName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Nutrients: ${nutrients.join(', ')}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Divider(),
            _buildTagsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tags.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Icon(
                entry.value ? Icons.check_circle : Icons.remove_circle,
                color: entry.value ? Colors.green : Colors.yellow,
              ),
              SizedBox(width: 8),
              Text(
                entry.key,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
