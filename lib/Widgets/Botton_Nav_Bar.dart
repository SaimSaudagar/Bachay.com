// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   @override
//   _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   List<BottomNavigationBarItem> _buildBottomNavBarItems() {
//     return [
//       _buildBottomNavItem('Shopping', 'images/shopping.svg', 'images/shopping-active.svg', 0),
//       _buildBottomNavItem('Explore', 'images/explore.svg', 'images/explore-active.svg', 1),
//       _buildBottomNavItem('Parenting', 'images/parenting.svg', 'images/parenting-active.svg', 2),
//       _buildBottomNavItem('Education', 'images/education.svg', 'images/education-active.svg', 3),
//       _buildBottomNavItem('Profile', 'images/profile.svg', 'images/profile-active.svg', 4),
//     ];
//   }

//   BottomNavigationBarItem _buildBottomNavItem(String label, String iconPath, String activeIconPath, int index) {
//     return BottomNavigationBarItem(
//       icon: Container(
//         decoration: BoxDecoration(
//           // color: _selectedIndex == index
//           //     ? Colors.grey.shade200 // Selected background color
//           //     : Colors.transparent, // Default background color
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.all(8),
//         child: SvgPicture.asset(
//           _selectedIndex == index ? activeIconPath : iconPath,
//           // color: _selectedIndex == index ? Colors.black : Colors.grey,
//         ),
//       ),
//       label: label,
//       // backgroundColor: Colors.transparent,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Center(
//       //   child: Text('Selected tab: ${_selectedIndex + 1}'),
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: _buildBottomNavBarItems(),
//         currentIndex: _selectedIndex,
//         // selectedItemColor: Colors.black,
//         // unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CustomBottomNavigationBar(),
//     );
//   }
// }






// custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  CustomBottomNavigationBar({required this.onTabSelected});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      _buildBottomNavItem('Shopping', 'images/shopping.svg', 'images/shopping-active.svg', 0),
      _buildBottomNavItem('Explore', 'images/explore.svg', 'images/explore-active.svg', 1),
      _buildBottomNavItem('Parenting', 'images/parenting.svg', 'images/parenting-active.svg', 2),
      _buildBottomNavItem('Education', 'images/education.svg', 'images/education-active.svg', 3),
      _buildBottomNavItem('Profile', 'images/profile.svg', 'images/profile-active.svg', 4),
    ];
  }

  BottomNavigationBarItem _buildBottomNavItem(String label, String iconPath, String activeIconPath, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          _selectedIndex == index ? activeIconPath : iconPath,
        ),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _buildBottomNavBarItems(),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    );
  }
}
