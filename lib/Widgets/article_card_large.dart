import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticleCardLarge extends StatelessWidget {
  final String imageUrl;
  final String sourceImageUrl;
  final String sourceName;
  final bool isVerified;
  final String title;
  final String date;

  const ArticleCardLarge({
    required this.imageUrl,
    required this.sourceImageUrl,
    required this.sourceName,
    this.isVerified = false,
    required this.title,
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
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
                    Spacer(),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Icon(
              Icons.bookmark_outline,
              color: Colors.black87,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
