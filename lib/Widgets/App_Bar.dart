// import 'package:app/Screens/Product/All_Producst_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../Utils/app_constants.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   final Size preferredSize;

//   const CustomAppBar({super.key}) : preferredSize = const Size.fromHeight(60.0);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 1,
//       leading: IconButton(
//         icon: Icon(Icons.menu,
//             color: Colors.black, size: getFontSize(context) * 1.5),
//         onPressed: () {},
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () => _showBottomSheet(context),
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/boy-icon.png'),
//                   radius: getFontSize(context) * 2,
//                 ),
//                 SizedBox(width: getSpacing(context)),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Shop for",
//                       style: interRegular.copyWith(
//                         color: Colors.black,
//                         fontSize: getFontSize(context),
//                       ),
//                     ),
//                     Text(
//                       "All",
//                       style: interBold.copyWith(
//                         color: Colors.black,
//                         fontSize: getFontSize(context),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               // onTap: () => _showBottomSheet(context),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: SvgPicture.asset(
//                   'assets/logo/Logo.svg',
//                   height: getBigFontSize(context) * 10, width: getBigFontSize(context)*10,
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: SvgPicture.asset('assets/images/search-normal.svg',
//                     height: getFontSize(context) * 1.5),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => AllProductsScreen()));
//                 },
//                 padding: EdgeInsets.all(0), // Remove default padding
//                 constraints: BoxConstraints(), // Remove default constraints
//               ),
//               SizedBox(
//                   width: getSpacing(context) / 2), // Adjust spacing as needed
//               IconButton(
//                 icon: SvgPicture.asset('assets/images/favorites.svg',
//                     height: getFontSize(context) * 1.5),
//                 onPressed: () {},
//                 padding: EdgeInsets.all(0), // Remove default padding
//                 constraints: BoxConstraints(), // Remove default constraints
//               ),
//               SizedBox(
//                   width: getSpacing(context) / 2), // Adjust spacing as needed
//               IconButton(
//                 icon: SvgPicture.asset('assets/images/notification.svg',
//                     height: getFontSize(context) * 1.5),
//                 onPressed: () {},
//                 padding: EdgeInsets.all(0), // Remove default padding
//                 constraints: BoxConstraints(), // Remove default constraints
//               ),
//               SizedBox(
//                   width: getSpacing(context) / 2), // Adjust spacing as needed
//               IconButton(
//                 icon: SvgPicture.asset('assets/images/shopping-cart.svg',
//                     height: getFontSize(context) * 1.5),
//                 onPressed: () {},
//                 padding: EdgeInsets.all(0), // Remove default padding
//                 constraints: BoxConstraints(), // Remove default constraints
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             left: 10,
//             right: 10,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Who are you Shopping for today?",
//                       style: TextStyle(
//                           fontSize: getBigFontSize(context),
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 20),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           _buildAvatar(context, 'Add Child', Icons.add),
//                           _buildAvatar(
//                               context, 'All', 'assets/images/shop_for_all.svg'),
//                           _buildAvatar(
//                               context, 'Boy', 'assets/images/boy-icon.png'),
//                           _buildAvatar(
//                               context, 'Girl', 'assets/images/girl-icon.png'),
//                           _buildAvatar(
//                               context, 'Girl', 'assets/images/girl-icon.png'),
//                           _buildAvatar(
//                               context, 'Girl', 'assets/images/girl-icon.png'),
//                           _buildAvatar(
//                               context, 'Girl', 'assets/images/girl-icon.png'),
//                           _buildAvatar(
//                               context, 'Girl', 'assets/images/girl-icon.png'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle the button press
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: buttonColorPurple,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         padding: EdgeInsets.symmetric(vertical: 12),
//                       ),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: Text(
//                           "Go to Child Settings",
//                           textAlign: TextAlign.center,
//                           style: buttonTextStyle(context),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAvatar(BuildContext context, String label, dynamic image) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 24,
//             backgroundColor: Colors.grey[200],
//             backgroundImage: image is String ? AssetImage(image) : null,
//             child: image is IconData ? Icon(image, size: 24) : null,
//           ),
//           SizedBox(height: 8),
//           Text(label),
//         ],
//       ),
//     );
//   }
// }







import 'package:app/Screens/Product/All_Producst_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int state;

  CustomAppBar({super.key, required this.state}) : preferredSize = const Size.fromHeight(60.0);

  @override
  final Size preferredSize;

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
          if (state == 3)
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
                          fontSize: getFontSize(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: GestureDetector(
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/logo/Logo.svg',
                  height: getBigFontSize(context) * 10,
                  width: getBigFontSize(context) * 10,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state >= 2)
                IconButton(
                  icon: SvgPicture.asset('assets/images/search-normal.svg', height: getFontSize(context) * 1.5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllProductsScreen()),
                    );
                  },
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                ),
              if (state == 3) ...[
                SizedBox(width: getSpacing(context) / 2),
                IconButton(
                  icon: SvgPicture.asset('assets/images/favorites.svg', height: getFontSize(context) * 1.5),
                  onPressed: () {},
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                ),
              ],
              if (state >= 2) ...[
                SizedBox(width: getSpacing(context) / 2),
                IconButton(
                  icon: SvgPicture.asset('assets/images/notification.svg', height: getFontSize(context) * 1.5),
                  onPressed: () {},
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                ),
              ],
              if (state == 3) ...[
                SizedBox(width: getSpacing(context) / 2),
                IconButton(
                  icon: SvgPicture.asset('assets/images/shopping-cart.svg', height: getFontSize(context) * 1.5),
                  onPressed: () {},
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(),
                ),
              ],
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
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Who are you Shopping for today?",
                      style: TextStyle(
                        fontSize: getBigFontSize(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColorPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Go to Child Settings",
                          textAlign: TextAlign.center,
                          style: buttonTextStyle(context),
                        ),
                      ),
                    ),
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
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            backgroundImage: image is String ? AssetImage(image) : null,
            child: image is IconData ? Icon(image, size: 24) : null,
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
