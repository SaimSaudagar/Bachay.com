import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comments',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total 03 Comments',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Divider(thickness: 1, color: Colors.grey[300]),
          Expanded(
            child: ListView(
              children: [
                _buildComment(
                  context,
                  name: 'Fatima',
                  time: '01 Hour Ago',
                  content:
                      'Porem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                  likes: 24,
                  isReply: false,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: _buildComment(
                    context,
                    name: 'Hamza',
                    time: 'Just Now',
                    content:
                        'Porem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                    likes: 24,
                    isReply: true,
                  ),
                ),
                _buildComment(
                  context,
                  name: 'Fatima',
                  time: '01 Month Ago',
                  content:
                      'Porem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                  likes: 23,
                  isReply: false,
                ),
              ],
            ),
          ),
          Divider(thickness: 1, color: Colors.grey[300]),
          _buildCommentInputField(context),
        ],
      ),
    );
  }

  Widget _buildComment(
    BuildContext context, {
    required String name,
    required String time,
    required String content,
    required int likes,
    bool isReply = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://your-image-url.com/avatar.jpg'), // Replace with actual image URL
            radius: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Icon(Icons.more_horiz, size: 16, color: Colors.grey),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  content,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.thumb_up_alt_outlined, size: 16, color: Colors.grey),
                        SizedBox(width: 5),
                        Text('$likes', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 20),
                    if (!isReply)
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Reply',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInputField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://your-image-url.com/avatar.jpg'), // Replace with actual image URL
            radius: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Write what's in your mind...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.pink),
            onPressed: () {
              // Handle send action
            },
          ),
        ],
      ),
    );
  }
}
