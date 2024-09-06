import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';  // Import HTML parser to parse and clean up the text

class ArticleCardSmall extends StatelessWidget {
  final String imageUrl;
  final String sourceImageUrl;
  final String sourceName;
  final bool isVerified;
  final String title;
  final String description;  // HTML text
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

  // Helper function to strip HTML tags and return plain text
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement?.text ?? '';
    return parsedString;
  }

  // Helper function to limit text to 3 lines or a certain number of characters
  String _getFirstThreeLines(String text, {int maxLines = 3, int maxCharsPerLine = 100}) {
    List<String> lines = text.split('\n');  // Split by lines
    String truncatedText = '';

    for (int i = 0; i < maxLines && i < lines.length; i++) {
      // If the line is too long, truncate it and add ellipsis
      if (lines[i].length > maxCharsPerLine) {
        truncatedText += lines[i].substring(0, maxCharsPerLine) + '... ';
      } else {
        truncatedText += lines[i] + ' ';
      }
    }

    // Add ellipsis if there is more content
    if (lines.length > maxLines) {
      truncatedText += '...';
    }

    return truncatedText.trim();
  }

  @override
  Widget build(BuildContext context) {
    // Clean up HTML and limit to first 3 lines of text
    final plainTextDescription = _parseHtmlString(description);
    final limitedDescription = _getFirstThreeLines(plainTextDescription);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Left side: Text content
          Expanded(
            flex: 2,
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
                      Expanded(
                        child: Text(
                          sourceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,  // Truncate with ellipsis
                          maxLines: 1,  // Ensure it stays on a single line
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
                    limitedDescription,  // Display the truncated description
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 3,  // This ensures it's 3 lines in case of overflow
                    overflow: TextOverflow.ellipsis,  // Add ellipsis if content overflows
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
          // Right side: Image thumbnail
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Container(
                height: 120, // Ensure height consistency
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity, // Make the image fill the right side
                  height: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
