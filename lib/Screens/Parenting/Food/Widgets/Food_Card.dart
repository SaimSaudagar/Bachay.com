// food_card.dart
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl; // Image URL from backend
  final String foodName; // Food name from backend
  final List<String> nutrients; // List of nutrients from backend
  final Map<String, bool> tags; // Tags with true (check) or false (remove)
  final VoidCallback onTap; // Callback when the card is tapped

  const FoodCard({
    Key? key,
    required this.imageUrl,
    required this.foodName,
    required this.nutrients,
    required this.tags,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to detail on tap
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food image and name
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Rounded corners for image
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    color: Colors.black54,
                    child: Text(
                      foodName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              // Nutrients and Tags
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nutrients: ${nutrients.join(', ')}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: tags.entries.map((entry) {
                        return Chip(
                          avatar: Icon(
                            entry.value
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: entry.value ? Colors.green : Colors.red,
                            size: 16,
                          ),
                          label: Text(entry.key),
                          backgroundColor:
                              entry.value ? Colors.green[50] : Colors.red[50],
                          labelStyle: TextStyle(
                            color:
                                entry.value ? Colors.green[800] : Colors.red[800],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
