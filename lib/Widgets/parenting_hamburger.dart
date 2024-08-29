import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/app_constants.dart';

class ParentingHamburger extends StatelessWidget {
  const ParentingHamburger({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.50, // Adjust the width as needed
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/logo/Parenting.svg', height: 40), // Replace with your logo
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            child: Icon(Icons.person, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getSpacing(context)),
                  Text(
                    'Welcome to Bachay Parenting',
                    style: outfitBold.copyWith(
                      color: Colors.black,
                      fontSize: getBigFontSize(context),
                    ),
                  ),
                ],
              ),
            ),
            _buildLanguageSelector(context),
            _buildCategoryItem(context, 'assets/images/home/shopping-active.png', 'Shopping', Colors.pink.shade100),
            _buildCategoryItem(context, 'assets/images/home/education-active.png', 'Education', Colors.yellow.shade100),
            _buildCategoryItem(context, 'assets/images/home/explore-active.png', 'Explore', Colors.orange.shade100),
            const Divider(),
            _buildMenuSectionTitle('Featured'),
            _buildMenuItemWithBackground(context, 'assets/images/settings-child.png', 'Add Child'),
            _buildMenuItemWithBackground(context, 'assets/images/food.png', 'Food & Nutrients'),
            _buildMenuItemWithBackground(context, 'assets/images/Expert Panel.png', 'Expert Panel'),
            _buildMenuItemWithBackground(context, 'assets/images/Expert Follow.png', 'Follow Expert'),
            const Divider(),
            _buildMenuSectionTitle('My Activity'),
            _buildMenuItem(context, 'assets/images/posts.png', 'Create Post'),
            _buildMenuItem(context, 'assets/images/Video.svg', 'Popular Articles'),
            _buildMenuItem(context, 'assets/images/children.png', 'Video Articles'),
            _buildMenuItem(context, 'assets/images/24-support.png', 'Ask Questions'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Image.asset('assets/images/language.png', color: Colors.black),
          title: Text('Language', style: outfitRegular.copyWith(color: Colors.black)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('English', style: outfitRegular.copyWith(color: Colors.black)),
              const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String iconPath, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color,
            child: Image.asset(iconPath),
          ),
          title: Text(title, style: outfitRegular.copyWith(color: Colors.black, fontSize: getFontSize(context))),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String iconPath, String title) {
    return ListTile(
      leading: Image.asset(iconPath, color: Colors.black),
      title: Text(title, style: outfitRegular.copyWith(color: Colors.black, fontSize: getFontSize(context))),
      onTap: () {},
    );
  }

  Widget _buildMenuItemWithBackground(BuildContext context, String iconPath, String title) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.asset(iconPath, width: 24, height: 24),
      ),
      title: Text(title, style: outfitRegular.copyWith(color: Colors.black, fontSize: getFontSize(context))),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
      onTap: () {},
    );
  }

  Widget _buildMenuSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: outfitBold.copyWith(color: Colors.black),
      ),
    );
  }
}
