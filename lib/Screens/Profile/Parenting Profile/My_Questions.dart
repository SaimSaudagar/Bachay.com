import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Utils/app_constants.dart';
import 'Profile_Parenting.dart';

class MyQuestions extends StatefulWidget {
  const MyQuestions({super.key});

  @override
  _MyQuestionsState createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  Future<List<Question>> _fetchQuestions() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Question.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load Questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyQuestionsAppBar(context),
      body: FutureBuilder<List<Question>>(
        future: _fetchQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return questionWidget(context, snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class Question {
  final String author;
  final String timeAgo;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;
  final String profileImageUrl;

  Question({
    required this.author,
    required this.timeAgo,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.profileImageUrl,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      author: 'Samira Khan',
      timeAgo: '2 days ago',
      content:
          'Hello doctor, shall we give head both daily for 6 month old baby?',
      imageUrl: json['url'],
      likes: 17,
      comments: 25,
      profileImageUrl: 'https://via.placeholder.com/150/92c952',
    );
  }
}

PreferredSizeWidget MyQuestionsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1.0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Parenting_Profile()),
        );
      },
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Questions',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: getBigFontSize(context)),
        ),
        Text(
          'Questions Questioned by me',
          style: TextStyle(color: Colors.grey, fontSize: getFontSize(context)),
        ),
      ],
    ),
  );
}

Widget questionWidget(BuildContext context, Question Question) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(Question.profileImageUrl),
            ),
            title: Text(Question.author,
                style: interBold.copyWith(fontSize: getBigFontSize(context))),
            subtitle: Text('Mother - 2 Children\'s',
                style: interRegular.copyWith(fontSize: getFontSize(context))),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Question.timeAgo),
                SizedBox(width: getSpacing(context)),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => bottomSheet(context),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Image.asset('assets/images/message-question.png'),
              const SizedBox(width: 8.0),
              Text(
                'Question:',
                style: interBold.copyWith(fontSize: getFontSize(context)),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(Question.content,
              style: interBold.copyWith(fontSize: getFontSize(context))),
          const Divider(),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/up-arrow.png',
                            width: 16, height: 16, color: Colors.pink),
                        const SizedBox(width: 4.0),
                        Text('${Question.likes}',
                            style: interRegular.copyWith(
                                fontSize: getFontSize(context))),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                      child: VerticalDivider(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/down-arrow.png',
                            width: 16, height: 16, color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/images/share.png',
                      width: 16, height: 16, color: Colors.black),
                  const SizedBox(width: 4.0),
                  Text('Share',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context))),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150/92c952'),
                    radius: 12,
                  ),
                  const SizedBox(width: 8.0),
                  Text('Question for Kamran',
                      style:
                          interBold.copyWith(fontSize: getFontSize(context))),
                ],
              ),
            ],
          ),
          const Divider(height: 32.0),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://via.placeholder.com/150/92c952'),
            ),
            title: Text('Fatima',
                style: interBold.copyWith(fontSize: getBigFontSize(context))),
            subtitle: Text('Mother - 1 Children\'s',
                style: interRegular.copyWith(fontSize: getFontSize(context))),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Just Now',
                  style: outfitRegular,
                ),
                SizedBox(width: getSpacing(context)),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/message-answer.png'),
                  const SizedBox(
                      width:
                          4.0), // Adding some space between the icon and the text
                  Text(
                    'Answer:',
                    style: interBold.copyWith(
                        fontSize: getFontSize(context), color: Colors.pink),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/images/heart.png',
                      width: 16, height: 16, color: Colors.pink),
                  const SizedBox(
                      width:
                          4.0), // Adding some space between the icon and the text
                  Text('${Question.comments}',
                      style: interRegular.copyWith(
                          fontSize: getFontSize(context))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'dear sir, a weight of 6.3 kg is a normal weight for age for your 7 months old baby, considering a birth weight of 2.1 kg. for healthy weight gain, you should give a homemade balanced diet having variety of food groups.',
            style: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
          const Divider(height: 32.0),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150/92c952'),
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
                        icon: Image.asset('assets/images/send.png',
                            color: Colors.pinkAccent),
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
  );
}

Widget bottomSheet(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        bottomSheetOption(context, 'assets/images/edit.png', 'Edit Question'),
        bottomSheetOption(context, 'assets/images/pin.png', 'Pin Question'),
        bottomSheetOption(context, 'assets/images/notification-cancel.png',
            'Turn Off Notification for this Question'),
        bottomSheetOption(
            context, 'assets/images/delete.png', 'Delete this Question'),
      ],
    ),
  );
}

Widget bottomSheetOption(BuildContext context, String iconPath, String label) {
  return ListTile(
    leading: Image.asset(iconPath, width: 24.0, height: 24.0),
    title: Text(label),
    onTap: () {
      Navigator.pop(context);
    },
  );
}
