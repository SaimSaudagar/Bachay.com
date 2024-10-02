import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import 'vaccine widgets/FAQ_widget/FAQ_widget.dart';
import 'vaccine widgets/tracket_widget.dart';

class VaccineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getPadding(context)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getPadding(context) / 2),
              child: Image.asset(
                'assets/images/placeholder.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: getSpacing(context) * 4),
            _buildChildButton(
              context: context,
              avatarImage: 'assets/images/child1.png',
              childName: 'John Doe',
              childAge: '2 years',
            ),
            SizedBox(height: getSpacing(context) * 2),
            _buildChildButton(
              context: context,
              avatarImage: 'assets/images/child2.png',
              childName: 'Jane Doe',
              childAge: '4 years',
            ),
            SizedBox(height: getSpacing(context) * 4),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add child functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  padding: buttonPadding,
                ),
                child: Text('+ Add Child', style: buttonTextStyle(context)),
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Go to child settings functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    side: BorderSide(color: Colors.grey),
                  ),
                  padding: buttonPadding,
                ),
                child: Text(
                  'Go to Child Settings',
                  style: buttonTextStyle(context).copyWith(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: getSpacing(context) * 4),
            VaccinationTrackerWidget(),
            SizedBox(height: getSpacing(context) * 4),
            FAQWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildChildButton({
    required BuildContext context,
    required String avatarImage,
    required String childName,
    required String childAge,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Add navigation or action here
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: buttonPadding,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatarImage),
              radius: getFontSize(context) * 1.5,
            ),
            SizedBox(width: getPadding(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    childName,
                    style: outfitBold.copyWith(fontSize: getFontSize(context)),
                  ),
                  Text(
                    childAge,
                    style: outfitRegular.copyWith(fontSize: getFontSize(context) * 0.8),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: getFontSize(context)),
          ],
        ),
      ),
    );
  }
}
