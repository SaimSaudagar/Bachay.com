// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   final ValueChanged<int> onTabSelected;

//   CustomBottomNavigationBar({required this.onTabSelected});

//   @override
//   _CustomBottomNavigationBarState createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     widget.onTabSelected(index);
//   }

//   List<BottomNavigationBarItem> _buildBottomNavBarItems() {
//     return [a
//       _buildBottomNavItem('Shopping', 'assets/images/home/shopping.png',
//           'assets/images/home/shopping-active.png', 0),
//       _buildBottomNavItem('Explore', 'assets/images/home/explore.png',
//           'assets/images/home/explore-active.png', 1),
//       _buildBottomNavItem('Parenting', 'assets/images/home/parenting.png',
//           'assets/images/home/parenting-active.png', 2),
//       _buildBottomNavItem('Education', 'assets/images/home/education.png',
//           'assets/images/home/education-active.png', 3),
//       _buildBottomNavItem('Profile', 'assets/images/home/profile.png',
//           'assets/images/home/profile-active.png', 4),
//     ];
//   }

//   BottomNavigationBarItem _buildBottomNavItem(
//       String label, String iconPath, String activeIconPath, int index) {
//     return BottomNavigationBarItem(
//       icon: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: EdgeInsets.all(8),
//         child: Image.asset(
//           _selectedIndex == index ? activeIconPath : iconPath,
//         ),
//       ),
//       label: label,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: _buildBottomNavBarItems(),
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//       type: BottomNavigationBarType.fixed,
//       showUnselectedLabels: true,
//     );
//   }
// }




import 'package:app/Screens/Home/Homepage.dart';
import 'package:app/Screens/Profile/Profile_Initial.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const CustomBottomNavigationBar({super.key, required this.onTabSelected});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabSelected(index);
    _navigateToScreen(index);
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      // case 1:
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => ExploreScreen()));
      //   break;
      // case 2:
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => ParentingScreen()));
      //   break;
      // case 3:
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => EducationScreen()));
      //   break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
    }
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      _buildBottomNavItem('Shopping', 'assets/images/home/shopping.png',
          'assets/images/home/shopping-active.png', 0),
      _buildBottomNavItem('Explore', 'assets/images/home/explore.png',
          'assets/images/home/explore-active.png', 1),
      _buildBottomNavItem('Parenting', 'assets/images/home/parenting.png',
          'assets/images/home/parenting-active.png', 2),
      _buildBottomNavItem('Education', 'assets/images/home/education.png',
          'assets/images/home/education-active.png', 3),
      _buildBottomNavItem('Profile', 'assets/images/home/profile.png',
          'assets/images/home/profile-active.png', 4),
    ];
  }

  BottomNavigationBarItem _buildBottomNavItem(
      String label, String iconPath, String activeIconPath, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
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

