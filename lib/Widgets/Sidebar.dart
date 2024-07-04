import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/app_constants.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75, // Adjust the width as needed
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
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
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        ),
                        child: Text(
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
            _buildCategoryItem(context, Icons.chat, 'Parenting', Colors.pink.shade100),
            _buildCategoryItem(context, Icons.school, 'Education', Colors.yellow.shade100),
            _buildCategoryItem(context, Icons.explore, 'Explore', Colors.orange.shade100),
            Divider(),
            _buildMenuSectionTitle('Menu'),
            _buildMenuItemWithBackground(context, 'assets/icons/shop_by_category.svg', 'Shop by Category', Colors.pink.shade100),
            _buildMenuItemWithBackground(context, 'assets/icons/offer_zone.svg', 'Offer Zone', Colors.orange.shade100),
            _buildMenuItemWithBackground(context, 'assets/icons/gifts_cards.svg', 'Gifts & Cards', Colors.purple.shade100),
            _buildMenuItemWithBackground(context, 'assets/icons/sell_with_us.svg', 'Sell With Us', Colors.blue.shade100),
            _buildMenuItemWithBackground(context, 'assets/icons/customer_service.svg', 'Customer Service', Colors.lightBlue.shade100),
            Divider(),
            _buildMenuSectionTitle('My Activity'),
            _buildMenuItem(context, Icons.favorite, 'My Favorites'),
            _buildMenuItem(context, Icons.account_circle, 'Account'),
            _buildMenuItem(context, Icons.child_friendly, 'Children\'s'),
            _buildMenuItem(context, Icons.help, 'Help & Support'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language, color: Colors.black),
      title: Text('Language', style: outfitRegular.copyWith(color: Colors.black)),
      trailing: Text('English', style: outfitRegular.copyWith(color: Colors.black)),
      onTap: () {},
    );
  }

  Widget _buildCategoryItem(BuildContext context, IconData icon, String title, Color color) {
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
            child: Icon(icon, color: Colors.black),
          ),
          title: Text(title, style: outfitRegular.copyWith(color: Colors.black, fontSize: getFontSize(context))),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: outfitRegular.copyWith(color: Colors.black, fontSize: getFontSize(context))),
      onTap: () {},
    );
  }

  Widget _buildMenuItemWithBackground(BuildContext context, String iconPath, String title, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: SvgPicture.asset(iconPath, width: 24, height: 24),
      ),
      title: Text(title, style: outfitRegular.copyWith(color: Colors.black, fontSize: getFontSize(context))),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
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
