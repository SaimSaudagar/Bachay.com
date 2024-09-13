import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Widgets/Botton_Nav_Bar.dart';
import '../../../Widgets/Post_widget.dart';
import '../Parenting_Appbar.dart';
import 'Create_Post.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> with TickerProviderStateMixin {
  TabController? _appBarTabController;
  TabController? _hashtagTabController;

  @override
  void initState() {
    super.initState();
    _appBarTabController = TabController(length: 5, vsync: this);
    _hashtagTabController = TabController(length: 5, vsync: this); // Independent TabController for hashtags
    _appBarTabController!.addListener(() {
      setState(() {
        // Triggers rebuild when the app bar tab is changed
      });
    });
  }

  @override
  void dispose() {
    _appBarTabController?.dispose();
    _hashtagTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ParentingAppBar(tabController: _appBarTabController!), // Use the custom AppBar
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Image Banner
                Image.asset(
                  'assets/images/MainBanner.png', // Replace with your image asset path
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                
                // Hashtag Tabs with Rounded Rectangular Borders
                TabBar(
                  controller: _hashtagTabController, // Independent TabController for hashtags
                  isScrollable: true,
                  labelColor: Colors.purple,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.transparent, // We'll manage the indicator ourselves
                  tabs: [
                    _buildHashtagTab("#boys"),
                    _buildHashtagTab("#cutest"),
                    _buildHashtagTab("#girls"),
                    _buildHashtagTab("#toddlers"),
                    _buildHashtagTab("#babies"),
                  ],
                ),
                
                // User Input Row
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/Celebrate.png'), // Replace with user's profile picture
                        radius: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Write what's on your mind...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/images/Upload.svg'), // Replace with your upload icon asset path
                        onPressed: () {
                          // Handle image upload
                        },
                      ),
                    ],
                  ),
                ),
                
                // Feed Content
                Column(
                  children: [
                    PostWidget(
                      profileImageUrl: 'https://via.placeholder.com/150',
                      userName: 'John Doe',
                      userRole: 'Parent',
                      postTime: '2 hrs ago',
                      postContent: 'Enjoying a beautiful day at the park!',
                      postImageUrl: 'https://via.placeholder.com/600',
                      likesCount: 120,
                      userComment: 'Looks great!',
                    ),
                    PostWidget(
                      profileImageUrl: 'https://via.placeholder.com/150',
                      userName: 'Jane Smith',
                      userRole: 'Teacher',
                      postTime: '4 hrs ago',
                      postContent: 'Our class had an amazing art session today.',
                      postImageUrl: 'https://via.placeholder.com/600',
                      likesCount: 230,
                      
                      userComment: 'So creative!',
                    ),
                    // Add more PostWidgets as needed
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CreatePostScreen()),
                                );
                
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.purple,
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
      
    );
  }

  // Method to build each hashtag tab with rounded rectangular border
  Widget _buildHashtagTab(String text) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.purple, width: 1),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
