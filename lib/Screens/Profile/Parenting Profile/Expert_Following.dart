// main.dart
import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import 'Profile_Parenting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpertFollowingScreen(),
    );
  }
}

class ExpertFollowingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Parenting_Profile()),
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expert Following',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getBigFontSize(context)),
            ),
            Text(
              'Specialist Doctors',
              style: TextStyle(color: Colors.grey, fontSize: getFontSize(context)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/Celebrate.png'),
              ),
              title: Text(
                'Dr. Sameer Khan', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: getBigFontSize(context))
              ),
              subtitle: Text(
                'Child Specialist, MBA, P.scY', 
                style: TextStyle(fontSize: getFontSize(context))
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text('Unfollow'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ),
            SizedBox(height: getSpacing(context)),
            ElevatedButton(
              onPressed: () {},
              child: Text('See Our Panel of Experts'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.pink, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.pink),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2, 
                  vertical: getPadding(context)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
