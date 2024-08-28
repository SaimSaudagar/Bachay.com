import 'package:flutter/material.dart';

class ArticleCardSmall extends StatelessWidget {
  final String imageUrl;
  final String sourceImageUrl;
  final String sourceName;
  final bool isVerified;
  final String title;
  final String description;
  final String date;

  const ArticleCardSmall({
    required this.imageUrl,
    required this.sourceImageUrl,
    required this.sourceName,
    this.isVerified = false,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(sourceImageUrl),
                        radius: 12,
                      ),
                      SizedBox(width: 8),
                      Text(
                        sourceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      if (isVerified) ...[
                        SizedBox(width: 4),
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              width: 120, // Constrain the width to avoid infinite size
              height: 120, // Constrain the height to avoid infinite size
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),

        ],
      ),
    
    );
  }
}
