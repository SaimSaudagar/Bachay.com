import 'package:app/Screens/Profile/Parenting%20Profile/Profile_Parenting.dart';
import 'package:flutter/material.dart';

import '../../../Utils/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FollowingScreen(),
    );
  }
}

class FollowingScreen extends StatelessWidget {
  final List<User> users = [
    User('Fatima', 'Mother - 2 Children\'s', 'assets/images/Celebrate.png'),
    User('Alya Saera', 'Mother - 2 Children\'s', 'assets/images/Celebrate.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Following',
          style: outfitBold.copyWith(
            fontSize: getBigFontSize(context),
           
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Parenting_Profile()));
    },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: getSpacing(context)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(users[index].imagePath),
                  radius: getBigFontSize(context) * 1.5,
                ),
                title: Text(
                  users[index].name,
                  style: outfitBold.copyWith(
                    fontSize: getFontSize(context) * 1.5,
                   
                  ),
                ),
                subtitle: Text(
                  users[index].description,
                  style: outfitRegular.copyWith(
                    fontSize: getFontSize(context),
                  
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Handle unfollow button press
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ), 
                    backgroundColor: buttonColorPurple,
                    padding: EdgeInsets.symmetric(
                      vertical: buttonPaddingValue,
                      horizontal: getBarWidth(context) * 0.1,
                    ),
                  ),
                  child: Text(
                    'Unfollow',
                    style: buttonTextStyle(context),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String description;
  final String imagePath;

  User(this.name, this.description, this.imagePath);
}
