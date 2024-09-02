import 'package:app/Screens/Home/Homepage.dart';
import 'package:app/Screens/Profile/Profile_Initial.dart';
import 'package:flutter/material.dart';

import '../Screens/Explore/Explore.dart';
import '../Screens/Parenting/Feed/feed.dart';
import '../Screens/Parenting/parenting.dart';
import '../Screens/Quiz/quiz_loading.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   final ValueChanged<int> onTabSelected;

//   const CustomBottomNavigationBar({super.key, required this.onTabSelected});

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
//     _navigateToScreen(index);
//   }

//   void _navigateToScreen(int index) {
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => const HomePage()));
//         break;
//       case 1:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Explore()));
//         break;
//       case 2:
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => ParentingApp()));
//         break;
//       case 3:
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => QuizLoading()));
//         break;
//       case 4:
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) => const ProfileScreen()));
//         break;
//     }
//   }

//   List<BottomNavigationBarItem> _buildBottomNavBarItems() {
//     return [
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
//         padding: const EdgeInsets.all(8),
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

class CustomBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final int initialIndex; // Add this parameter

  const CustomBottomNavigationBar({
    super.key,
    required this.onTabSelected,
    this.initialIndex = 0, // Default to 0 if not provided
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Initialize the selected index
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle the action based on the selected index
    switch (index) {
      case 0:
        _navigateToHome();
        break;
      case 1:
        _navigateToExplore();
        break;
      case 2:
        _navigateToParenting();
        break;
      case 3:
        _navigateToEducation();
        break;
      case 4:
        _navigateToProfile();
        break;
      default:
        break;
    }

    widget.onTabSelected(index);
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void _navigateToExplore() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Explore()));
  }

  void _navigateToParenting() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ParentingApp()));
  }

  void _navigateToEducation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuizLoading()));
  }

  void _navigateToProfile() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
      icon: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            _selectedIndex == index ? activeIconPath : iconPath,
          ),
        ),
      ),
      label: label,
    );
  }
}
