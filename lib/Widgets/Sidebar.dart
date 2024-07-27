import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/app_constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75, // Adjust the width as needed
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
                      SvgPicture.asset('assets/logo/Logo.svg', height: 40), // Replace with your logo
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColorPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getSpacing(context)),
                  Text(
                    'Welcome to Bachay.com',
                    style: outfitBold.copyWith(
                      color: Colors.black,
                      fontSize: getBigFontSize(context),
                    ),
                  ),
                ],
              ),
            ),
            _buildLanguageSelector(context),
            _buildCategoryItem(context, 'assets/images/home/parenting-active.png', 'Parenting', Colors.pink.shade100),
            _buildCategoryItem(context, 'assets/images/home/education-active.png', 'Education', Colors.yellow.shade100),
            _buildCategoryItem(context, 'assets/images/home/explore-active.png', 'Explore', Colors.orange.shade100),
            const Divider(),
            _buildMenuSectionTitle('Menu'),
            _buildMenuItemWithBackground(context, 'assets/images/shop_by_category.png', 'Shop by Category', Colors.pink.shade100),
            _buildMenuItemWithBackground(context, 'assets/images/offer_zone.png', 'Offer Zone', Colors.orange.shade100),
            _buildMenuItemWithBackground(context, 'assets/images/gifts_cards.png', 'Gifts & Cards', Colors.purple.shade100),
            _buildMenuItemWithBackground(context, 'assets/images/sell_with_us.png', 'Sell With Us', Colors.blue.shade100),
            _buildMenuItemWithBackground(context, 'assets/images/customer_service.png', 'Customer Service', Colors.lightBlue.shade100),
            const Divider(),
            _buildMenuSectionTitle('My Activity'),
            _buildMenuItem(context, 'assets/images/favorites.png', 'My Favorites'),
            _buildMenuItem(context, 'assets/images/account.png', 'Account'),
            _buildMenuItem(context, 'assets/images/children.png', 'Children\'s'),
            _buildMenuItem(context, 'assets/images/24-support.png', 'Help & Support'),
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
          borderRadius: BorderRadius.circular(8),
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

  Widget _buildMenuItemWithBackground(BuildContext context, String iconPath, String title, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
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
