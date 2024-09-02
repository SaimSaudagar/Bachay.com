import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParentingAppBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;

  ParentingAppBar({required this.tabController});

  @override
  _ParentingAppBarState createState() => _ParentingAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}

class _ParentingAppBarState extends State<ParentingAppBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  void _handleTabSelection() {
    if (mounted) {
      setState(() {});
    }
  }

@override
Widget build(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, // Disable the default drawer icon
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side - hamburger icon
        IconButton(
          icon: SvgPicture.asset('assets/images/hamburger.svg'),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // This opens the drawer
          },
        ),
        // Center - logo
        Center(
          child: SvgPicture.asset(
            'assets/logo/Parenting.svg', // Replace with your logo asset path
            height: 40,
          ),
        ),
        // Right side - icons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 16), // Add space between logo and first icon
            IconButton(
              icon: Image.asset(
                'assets/images/bachay_club.png',
                height: 20, // Reduced height
                width: 20, // Reduced width
              ),
              onPressed: () {},
            ),
            SizedBox(width: 1), // Space between icons
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/search-icon.svg',
                height: 20, // Reduced height
                width: 20, // Reduced width
              ),
              onPressed: () {},
            ),
            SizedBox(width: 1), // Space between icons
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/notification.svg',
                height: 20, // Reduced height
                width: 20, // Reduced width
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
    bottom: TabBar(
      controller: widget.tabController,
      isScrollable: true,
      labelColor: Colors.purple,
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.transparent, // No default indicator, we're using custom ones
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
    bool isSelected = widget.tabController.index == index;

    return GestureDetector(
      onTap: () {
        widget.tabController.animateTo(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? Colors.purple.withOpacity(0.5)
              : Colors.grey.withOpacity(0.2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIconPath,
              color: isSelected ? Colors.white : Colors.black,
              height: 24, // Adjust the height as needed
              width: 24, // Adjust the width as needed
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
