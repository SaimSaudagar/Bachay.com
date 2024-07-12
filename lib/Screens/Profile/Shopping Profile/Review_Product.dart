import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../Utils/app_constants.dart';

class ReviewProductScreen extends StatefulWidget {
  @override
  _ReviewProductScreenState createState() => _ReviewProductScreenState();
}

class _ReviewProductScreenState extends State<ReviewProductScreen> {
  double trueToSizeRating = 5;
  double trueToQualityRating = 4;
  double colorAsImageRating = 5;
  double convenienceRating = 4;
  double accuracyRating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Review Product',
          style: TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network(
                'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve Shirt',
                style: TextStyle(fontSize: getFontSize(context)),
              ),
            ),
            Divider(),
            _buildRatingRow(context, 'True to Size', trueToSizeRating, (rating) {
              setState(() {
                trueToSizeRating = rating;
              });
            }),
            _buildRatingRow(context, 'True to Quality', trueToQualityRating, (rating) {
              setState(() {
                trueToQualityRating = rating;
              });
            }),
            _buildRatingRow(context, 'Color as Image', colorAsImageRating, (rating) {
              setState(() {
                colorAsImageRating = rating;
              });
            }),
            _buildRatingRow(context, 'Convenience', convenienceRating, (rating) {
              setState(() {
                convenienceRating = rating;
              });
            }),
            _buildRatingRow(context, 'Accuracy', accuracyRating, (rating) {
              setState(() {
                accuracyRating = rating;
              });
            }),
            SizedBox(height: getSpacing(context) * 4),
            Text('Leave a review (Optional)', style: interBold.copyWith(fontSize: getFontSize(context))),
            SizedBox(height: getSpacing(context)),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Let us know more...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            Text('Upload Images (Optional)', style: interBold.copyWith(fontSize: getFontSize(context))),
            SizedBox(height: getSpacing(context)),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, size: 40, color: Colors.grey),
                    Text('+ Upload Images', style: TextStyle(color: Colors.grey, fontSize: getFontSize(context))),
                  ],
                ),
              ),
            ),
            SizedBox(height: getSpacing(context) * 4),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                padding: EdgeInsets.symmetric(vertical: getPadding(context)),
              ),
              child: Text('Submit Review', style: buttonTextStyle(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(BuildContext context, String title, double rating, Function(double) onRatingUpdate) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSpacing(context) * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: interRegular.copyWith(fontSize: getFontSize(context))),
          Row(
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: getBigFontSize(context) * 1.5,
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.orange),
                onRatingUpdate: onRatingUpdate,
              ),
              SizedBox(width: getSpacing(context)),
              Text(rating.toInt().toString(), style: interBold.copyWith(fontSize: getFontSize(context))),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReviewProductScreen(),
    );
  }
}
