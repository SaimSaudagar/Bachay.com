import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black, size: getFontSize(context) * 1.5),
        onPressed: () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/boy-icon.png'),
                  radius: getFontSize(context) * 2,
                ),
                SizedBox(width: getSpacing(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shop for",
                      style: interRegular.copyWith(
                        color: Colors.black,
                        fontSize: getFontSize(context),
                      ),
                    ),
                    Text(
                      "All",
                      style: interBold.copyWith(
                        color: Colors.black,
                        fontSize: getFontSize(context) ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              // onTap: () => _showBottomSheet(context),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/logo/Logo.svg',
                  height: getFontSize(context) * 2.5,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: SvgPicture.asset('assets/images/search-normal.svg', height: getFontSize(context) * 1.5),
                onPressed: () {},
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),
              SizedBox(width: getSpacing(context) / 2), // Adjust spacing as needed
              IconButton(
                icon: SvgPicture.asset('assets/images/favorites.svg', height: getFontSize(context) * 1.5),
                onPressed: () {},
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),
              SizedBox(width: getSpacing(context) / 2), // Adjust spacing as needed
              IconButton(
                icon: SvgPicture.asset('assets/images/notification.svg', height: getFontSize(context) * 1.5),
                onPressed: () {},
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),
              SizedBox(width: getSpacing(context) / 2), // Adjust spacing as needed
              IconButton(
                icon: SvgPicture.asset('assets/images/shopping-cart.svg',height: getFontSize(context) * 1.5),
                onPressed: () {},
                padding: EdgeInsets.all(0), // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Column(
                  children: [
                    Text(
                      "Who are you Shopping for today?",
                      style: interBold.copyWith(
                        fontSize: getBigFontSize(context),
                      ),
                    ),
                    SizedBox(height: getSpacing(context) * 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildAvatar(context, 'Add Child', Icons.add),
                          _buildAvatar(context, 'All', 'assets/images/shop_for_all.svg'),  
                          _buildAvatar(context, 'Boy', 'assets/images/boy-icon.png'),
                          _buildAvatar(context, 'Girl', 'assets/images/girl-icon.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: getSpacing(context) * 4),
                    ElevatedButton(
                      onPressed: () {
                        // Handle child settings action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: buttonPadding,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),
                      child: Text(
                        "Go to Child Settings",
                        style: buttonTextStyle(context),
                      ),
                    ),
                    SizedBox(height: getSpacing(context) * 4),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAvatar(BuildContext context, String label, dynamic image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSpacing(context)),
      child: Column(
        children: [
          CircleAvatar(
            radius: getFontSize(context) * 1.2,
            backgroundColor: Colors.grey[200],
            backgroundImage: image is String ? AssetImage(image) : null,
            child: image is IconData ? Icon(image, size: getFontSize(context) * 1.2) : null,
          ),
          SizedBox(height: getSpacing(context)),
          Text(
            label,
            style: interRegular.copyWith(fontSize: getFontSize(context)),
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
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Text('Content goes here'),
        ),
      ),
    );
  }
}
