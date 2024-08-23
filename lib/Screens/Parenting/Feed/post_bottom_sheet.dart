import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

class PostForBottomSheet extends StatelessWidget {
  const PostForBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Who are you Posting for today?',
                style: interBold.copyWith(fontSize: getBigFontSize(context)),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(height: getSpacing(context) * 2),
          Row(
            children: [
              _buildChildAvatar(
                context,
                icon: Icons.add,
                label: 'Add Child',
                isAddChild: true,
              ),
              SizedBox(width: getSpacing(context) * 2),
              _buildChildAvatar(
                context,
                imageUrl: 'https://your-image-url.com/kamran.jpg',
                label: 'Kamran',
              ),
              SizedBox(width: getSpacing(context) * 2),
              _buildChildAvatar(
                context,
                imageUrl: 'https://your-image-url.com/ali.jpg',
                label: 'Ali',
              ),
            ],
          ),
          SizedBox(height: getSpacing(context) * 4),
          Divider(thickness: 1, color: Colors.grey[300]),
          SizedBox(height: getSpacing(context)),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey[100],
              minimumSize: Size(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.07,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.black),
              ),
            ),
            onPressed: () {
              // Handle Go to Child Settings action
            },
            child: Text(
              'Go to Child Settings',
              style: interBold.copyWith(
                fontSize: getFontSize(context),
                color: Colors.black,
              ),
            ),
          ),
        ],      ),
    );
  }

  Widget _buildChildAvatar(BuildContext context,
      {String? imageUrl, IconData? icon, required String label, bool isAddChild = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: getFontSize(context) * 2.5,
          backgroundColor: isAddChild ? Colors.grey[200] : null,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          child: isAddChild
              ? Icon(icon, size: getFontSize(context) * 2, color: Colors.black)
              : null,
        ),
        SizedBox(height: getSpacing(context)),
        Text(
          label,
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
      ],
    );
  }
}
