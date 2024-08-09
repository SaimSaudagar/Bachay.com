import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart'; // Adjust the import path based on your project structure

void main() {
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuestionsFollowing(),
    );
  }
}

class QuestionsFollowing extends StatefulWidget {
  const QuestionsFollowing({super.key});

  @override
  _QuestionsFollowingState createState() => _QuestionsFollowingState();
}

class _QuestionsFollowingState extends State<QuestionsFollowing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Question Following',
            style: interBold.copyWith(
              fontSize: getBigFontSize(context),
              color: Colors.black,
            )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getSpacing(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                title: Text('Anonymous User', style: interBold.copyWith(fontSize: getFontSize(context))),
                subtitle: Text('02 Days Ago', style: interRegular.copyWith(fontSize: getFontSize(context))),
                trailing: IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black),
                  onPressed: () {
                    // Add more options here if needed
                  },
                ),
              ),
              SizedBox(height: getSpacing(context)),
              Row(
                children: [
                  Image.asset('assets/images/Questions.png', width: 16, height: 16), // Question icon from assets
                  const SizedBox(width: 4),
                  Text(
                    'Question:',
                    style: interBold.copyWith(fontSize: getFontSize(context)),
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context)),
              Text('My pediatric suggested this medicine motions and digestion',
                  style: interBold.copyWith(
                    fontSize: getBigFontSize(context),
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: getSpacing(context)),
              Image.asset(
                'assets/images/temp.png', // Replace with your correct image path
                fit: BoxFit.cover,
              ),
              SizedBox(height: getSpacing(context) * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/up-arrow.png', width: 16, height: 16, color: Colors.pink),
                        onPressed: () {},
                      ),
                      SizedBox(width: getSpacing(context) / 2),
                      Text('17', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/Follow Question.png', width: 16, height: 16, color: Colors.blue),
                        onPressed: () {},
                      ),
                      SizedBox(width: getSpacing(context) / 2),
                      Text('Following', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/share.png', width: 16, height: 16, color: Colors.black),
                        onPressed: () {},
                      ),
                      SizedBox(width: getSpacing(context) / 2),
                      Text('Share', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context) * 2),
              Divider(color: Colors.grey),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    radius: 16,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Write what\'s in your mind...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset('assets/images/send.png', color: Colors.pinkAccent),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
