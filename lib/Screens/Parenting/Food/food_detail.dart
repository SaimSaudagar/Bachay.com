// food_detail.dart
import 'package:flutter/material.dart';
import '../../../Models/Food/Food.dart';

class FoodDetail extends StatelessWidget {
  final Food food; // Accept the Food object directly

  const FoodDetail({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with back button and actions
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Food Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Handle share action
              // You can use the 'share' package to implement this
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  // Handle notification action
                },
              ),
              Positioned(
                right: 11,
                top: 11,
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
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),

      // Body with food details
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  food.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      height: 200,
                      child: Icon(Icons.error, color: Colors.red, size: 50),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),

              // Food Name
              Text(
                food.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Nutrients
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nutrients: ${food.nutrients}",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
              SizedBox(height: 16),
              Divider(),

              // Additional Information
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),

              // List of Additional Info
              Column(
                children: food.additionalInfo.map((info) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon based on info type
                        Image.network(
                          info.icon,
                          width: 24,
                          height: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.info, color: Colors.grey);
                          },
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                info.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                info.description,
                                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
