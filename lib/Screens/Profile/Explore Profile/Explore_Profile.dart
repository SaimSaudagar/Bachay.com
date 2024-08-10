import 'package:app/Screens/Profile/Profile_Initial.dart';
import 'package:flutter/material.dart';

class ExploreProfileScreen extends StatelessWidget {
  const ExploreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
        ),
        title: Image.asset('assets/logo/LogoExplore.png', height: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/Celebrate.png'),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Samira Khan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('My Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAccountButton(context, 'assets/images/following.png', 'Following', () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingScreen()));
                }),
                _buildAccountButton(context, 'assets/images/saved.png', 'Saved', () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SavedScreen()));
                }),
                _buildAccountButton(context, 'assets/images/liked.png', 'Liked', () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LikedScreen()));
                }),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1.0),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton(context, 'Recently View'),
                _buildTabButton(context, 'Recently Saved'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountButton(BuildContext context, String iconPath, String label, VoidCallback onPressed) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Image.asset(iconPath, height: 32, width: 32),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(BuildContext context, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: label == 'Recently View' ? Colors.white : Colors.black,
        backgroundColor: label == 'Recently View' ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.black),
        ),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
