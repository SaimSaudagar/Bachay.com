import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Widgets/Botton_Nav_Bar.dart';

class QAscreen extends StatefulWidget {
  @override
  _QAscreenState createState() => _QAscreenState();
}

class _QAscreenState extends State<QAscreen> with TickerProviderStateMixin {
  TabController? _appBarTabController;

  @override
  void initState() {
    super.initState();
    _appBarTabController = TabController(length: 5, vsync: this);
    _appBarTabController!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _appBarTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Example list of doctors for the ExpertPanelWidget
    final doctors = [
      Doctor(
        imageUrl: 'https://via.placeholder.com/150',
        name: 'Dr. Sameer Khan',
        qualifications: 'MBBS, MBA, P.scY',
        experience: '08 Years of Experience',
      ),
      Doctor(
        imageUrl: 'https://via.placeholder.com/150',
        name: 'Dr. Yasir Waleed',
        qualifications: 'MBBS, DPT',
        experience: '11 Years of Experience',
      ),
      Doctor(
        imageUrl: 'https://via.placeholder.com/150',
        name: 'Dr. Yasir Waleed',
        qualifications: 'MBBS, DPT',
        experience: '11 Years of Experience',
      ),      
      // Add more doctors as needed
    ];

    return Scaffold(
      body: Column(
        children: [
          // App Bar Tabs with Rounded Rectangular Borders
          TabBar(
            controller: _appBarTabController,
            isScrollable: true,
            labelColor: Colors.pinkAccent,
            unselectedLabelColor: Colors.black,
            // Remove the bottom divider or underline
            indicator: BoxDecoration(),
            tabs: [
              _buildAppBarTab("All"),
              _buildAppBarTab("#modelhunt"),
              _buildAppBarTab("#babyphoto"),
              _buildAppBarTab("#cutest"),
              _buildAppBarTab("#happy"),
            ],
          ),
          // Add the ExpertPanelWidget below the TabBar
           
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ExpertPanelWidget(doctors: doctors),
          ),
          Divider(),
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
                Divider(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (index) {
          if (index == 2) {
            // No additional action is needed since you're already on the Parenting screen
          } else {
            // Handle other tab selections if needed
          }
        },
        initialIndex: 2,  // Set the initial index to 2 for Parenting
      ),
    );
  }

  // Method to build each app bar tab with rounded rectangular border
  Widget _buildAppBarTab(String text) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.pinkAccent, width: 1),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

// Add the Doctor model and ExpertPanelWidget code here
// Doctor model
class Doctor {
  final String imageUrl;
  final String name;
  final String qualifications;
  final String experience;

  Doctor({
    required this.imageUrl,
    required this.name,
    required this.qualifications,
    required this.experience,
  });
}

// ExpertPanelWidget code
class ExpertPanelWidget extends StatefulWidget {
  final List<Doctor> doctors;

  const ExpertPanelWidget({required this.doctors});

  @override
  _ExpertPanelWidgetState createState() => _ExpertPanelWidgetState();
}

class _ExpertPanelWidgetState extends State<ExpertPanelWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.position.pixels - 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Expert Panel.png',
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Expert Panel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle View All tap
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 150, // Adjust height as necessary for the profile card
            child: Row(
              children: [
                // Left Arrow
                Container(
                  width: 30,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: _scrollLeft,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: widget.doctors.length,
                    itemBuilder: (context, index) {
                      return DoctorProfileCard(doctor: widget.doctors[index]);
                    },
                  ),
                ),
                // Right Arrow
                Container(
                  width: 30,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: _scrollRight,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorProfileCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfileCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(doctor.imageUrl),
          ),
          SizedBox(height: 8),
          Text(
            doctor.name,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            doctor.qualifications,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  doctor.experience,
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis, // Adds ellipsis if text overflows
                  maxLines: 1, // Ensures it stays on one line
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
