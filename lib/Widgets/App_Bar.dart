// import 'package:app/Screens/Product/All_Producst_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../Utils/app_constants.dart';
// import 'Sidebar.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final int state;

//   CustomAppBar({super.key, required this.state})
//       : preferredSize = const Size.fromHeight(60.0);

//   @override
//   final Size preferredSize;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double iconSize = constraints.maxWidth *
//             0.05; // Adjust icon size based on screen width
//         double logoSize = constraints.maxWidth *
//             0.07; // Adjust logo size based on screen width

//         return AppBar(
//           backgroundColor: Colors.white,
//           elevation: 1,
//           titleSpacing: 0,
//           leading: IconButton(
//             icon: Image.asset('assets/images/hamburger.png'),    
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => CustomDrawer()),
//                             );
//                           },
//                       ),          title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () => _showBottomSheet(context),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage('assets/images/boy-icon.png'),
//                       radius: iconSize / 1.5,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Shop for",
//                           style: interRegular.copyWith(
//                             color: Colors.black,
//                             fontSize: iconSize * 0.6,
//                           ),
//                         ),
//                         Text(
//                           "All",
//                           style: interBold.copyWith(
//                             color: Colors.black,
//                             fontSize: iconSize * 0.6,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SvgPicture.asset(
//                 'assets/logo/Logo.svg',
//                 height: logoSize,
//                 width: logoSize,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.08,
//                 child: IconButton(
//                   icon: SvgPicture.asset('assets/images/search-normal.svg',
//                       height: iconSize),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AllProductsScreen()));
//                   },
//                   // Remove default constraints
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.08,
//                 child: IconButton(
//                   icon: SvgPicture.asset('assets/images/favorites.svg',
//                       height: iconSize),
//                   onPressed: () {},
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.08,
//                 child: IconButton(
//                   icon: SvgPicture.asset('assets/images/notification.svg',
//                       height: iconSize),
//                   onPressed: () {},
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.08,
//                 child: IconButton(
//                   icon: SvgPicture.asset('assets/images/shopping-cart.svg',
//                       height: iconSize),
//                   onPressed: () {},
//                   // Remove default constraints
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
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
//                         fontSize: getBigFontSize(context),
//                         fontWeight: FontWeight.bold,
//                       ),
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
//                     ),
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









import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Screens/Product/All_Producst_Screen.dart';
import '../Utils/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int state;

  CustomAppBar({super.key, required this.state})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double iconSize = constraints.maxWidth *
            0.05; // Adjust icon size based on screen width
        double logoSize = constraints.maxWidth *
            0.07; // Adjust logo size based on screen width

        return AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          titleSpacing: 0,
          leading: IconButton(
            icon: Image.asset('assets/images/hamburger.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _showBottomSheet(context),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/boy-icon.png'),
                      radius: iconSize / 1.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shop for",
                          style: interRegular.copyWith(
                            color: Colors.black,
                            fontSize: iconSize * 0.6,
                          ),
                        ),
                        Text(
                          "All",
                          style: interBold.copyWith(
                            color: Colors.black,
                            fontSize: iconSize * 0.6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/logo/Logo.svg',
                height: logoSize,
                width: logoSize,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/search-normal.svg',
                      height: iconSize),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllProductsScreen()));
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/favorites.svg',
                      height: iconSize),
                  onPressed: () {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/notification.svg',
                      height: iconSize),
                  onPressed: () {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                child: IconButton(
                  icon: SvgPicture.asset('assets/images/shopping-cart.svg',
                      height: iconSize),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
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
                          _buildAvatar(
                              context, 'All', 'assets/images/shop_for_all.svg'),
                          _buildAvatar(
                              context, 'Boy', 'assets/images/boy-icon.png'),
                          _buildAvatar(
                              context, 'Girl', 'assets/images/girl-icon.png'),
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
