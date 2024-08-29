// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//     _tabController!.addListener(() {
//       setState(() {
//         // Triggers rebuild when the tab is changed
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             IconButton(
//               icon: SvgPicture.asset('assets/images/hamburger.svg'),
//               onPressed: () {},
//             ),
//             Expanded(
//               child: Center(
//                 child: SvgPicture.asset(
//                   'assets/logo/Parenting.svg', // Replace with your logo asset path
//                   height: 40,
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Image.asset(
//                 'assets/images/bachay_club.png',
//                 height: 24,
//                 width: 24,
//               ),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: SvgPicture.asset(
//                 'assets/images/search-icon.svg',
//                 height: 24,
//                 width: 24,
//               ),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: SvgPicture.asset(
//                 'assets/images/notification.svg',
//                 height: 24,
//                 width: 24,
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         bottom: TabBar(
//           controller: _tabController,
//           isScrollable: true,
//           labelColor: Colors.purple,
//           unselectedLabelColor: Colors.black,
//           indicatorColor: Colors.transparent, // No default indicator, we're using custom ones
//           tabs: [
//             Tab(
//               child: _buildTab("Feeds", 'assets/images/feeds.svg', 0),
//             ),
//             Tab(
//               child: _buildTab("Articles", 'assets/images/Video.svg', 1),
//             ),
//             Tab(
//               child: _buildTab("Q/A", 'assets/images/qa.svg', 2),
//             ),
//             Tab(
//               child: _buildTab("Vaccine", 'assets/images/vaccine.svg', 3),
//             ),
//             Tab(
//               child: _buildTab("Food", 'assets/images/food.svg', 4),
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           Center(child: Text("Feeds Content")),
//           Center(child: Text("Articles Content")),
//           Center(child: Text("Q/A Content")),
//           Center(child: Text("Vaccine Content")),
//           Center(child: Text("Food Content")),
//         ],
//       ),
//     );
//   }

//   Widget _buildTab(String text, String svgIconPath, int index) {
//     bool isSelected = _tabController?.index == index;
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: isSelected ? Colors.purple.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             svgIconPath,
//             color: isSelected ? Colors.purple : Colors.black,
//             height: 24, // Adjust the height as needed
//             width: 24,  // Adjust the width as needed
//           ),
//           SizedBox(width: 8),
//           Text(text),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParentingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  ParentingAppBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/images/hamburger.svg'),
            onPressed: () {},
          ),
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assets/logo/Parenting.svg', // Replace with your logo asset path
                height: 40,
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/bachay_club.png',
              height: 24,
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/search-icon.svg',
              height: 24,
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/notification.svg',
              height: 24,
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottom: TabBar(
        controller: tabController,
        isScrollable: true,
        labelColor: Colors.purple,
        unselectedLabelColor: Colors.black,
        indicatorColor:
            Colors.transparent, // No default indicator, we're using custom ones
        tabs: [
          Tab(
            child: _buildTab("Feeds", 'assets/images/feeds.svg', 0),
            
          ),
          Tab(
            child: _buildTab("Articles", 'assets/images/Video.svg', 1),
          ),
          Tab(
            child: _buildTab("Q/A", 'assets/images/qa.svg', 2),
          ),
          Tab(
            child: _buildTab("Vaccine", 'assets/images/vaccine.svg', 3),
          ),
          Tab(
            child: _buildTab("Food", 'assets/images/food.svg', 4),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, String svgIconPath, int index) {
    bool isSelected = tabController.index == index;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected
            ? Colors.purple.withOpacity(0.2)
            : Colors.grey.withOpacity(0.2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIconPath,
            color: isSelected ? Colors.purple : Colors.black,
            height: 24, // Adjust the height as needed
            width: 24, // Adjust the width as needed
          ),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
