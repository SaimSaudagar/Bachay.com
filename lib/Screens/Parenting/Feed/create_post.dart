import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utils/app_constants.dart';
import 'post_bottom_sheet.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  void _showPostForBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const PostForBottomSheet(), // Use the new widget here
    );
  }

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
        title: SvgPicture.asset(
          'assets/logo/Parenting.svg',
          height: getFontSize(context) * 3,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getPadding(context) * 0.5),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/images/search-icon.svg',
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
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Post',
              style: interBold.copyWith(fontSize: getBigFontSize(context)),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://your-image-url.com/fatima.jpg'),
                      radius: getFontSize(context) * 3,
                    ),
                    SizedBox(width: getSpacing(context) * 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fatima',
                          style: interBold.copyWith(
                              fontSize: getBigFontSize(context) * 0.9),
                        ),
                        Text(
                          'Mother - 2 Children\'s',
                          style: interRegular.copyWith(
                              fontSize: getFontSize(context)),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _showPostForBottomSheet(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: getSpacing(context) * 0.5,
                        horizontal: getSpacing(context) * 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(borderRadius * 5),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://your-image-url.com/kamran.jpg'),
                          radius: getFontSize(context) * 2,
                        ),
                        SizedBox(width: getSpacing(context)),
                        Text(
                          'Post for',
                          style: interRegular.copyWith(
                              fontSize: getFontSize(context)),
                        ),
                        SizedBox(width: getSpacing(context)),
                        Text(
                          'My Self',
                          style: interBold.copyWith(
                              fontSize: getFontSize(context)),
                        ),
                        Icon(Icons.arrow_drop_down,
                            size: getFontSize(context) * 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 2),
            TextField(
              decoration: InputDecoration(
                hintText: "Write what's in your mind...",
                border: InputBorder.none,
                hintStyle:
                    interRegular.copyWith(fontSize: getBigFontSize(context)),
              ),
              maxLines: null,
              style: interRegular.copyWith(fontSize: getBigFontSize(context)),
            ),
            SizedBox(height: getSpacing(context) * 2),
            GestureDetector(
              onTap: () {
                // Handle upload action
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(borderRadius * 2),
                dashPattern: [6, 3],
                color: Colors.grey,
                strokeWidth: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/Upload.svg',
                        width: getFontSize(context) * 2,
                        height: getFontSize(context) * 2,
                      ),
                      SizedBox(width: getSpacing(context) * 0.5),
                      Text(
                        '+ Upload Photo/Video',
                        style: interBold.copyWith(
                            fontSize: getFontSize(context), color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: getPadding(context)),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColorPink,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Handle post action
                  },
                  child: Text(
                    'Post',
                    style: interBold.copyWith(
                      fontSize: getFontSize(context),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
