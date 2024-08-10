import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Utils/app_constants.dart';
import 'Profile_Parenting.dart';

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPosts(),
    );
  }
}

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  Future<List<Post>> _fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myPostsAppBar(context),
      body: FutureBuilder<List<Post>>(
        future: _fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return postWidget(context, snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class Post {
  final String author;
  final String timeAgo;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;
  final String profileImageUrl;

  Post({
    required this.author,
    required this.timeAgo,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.profileImageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      author: 'Samira Khan',
      timeAgo: '2 days ago',
      content: 'Our cutie Princess 👑',
      imageUrl: json['url'],
      likes: 24,
      comments: 5,
      profileImageUrl: 'https://via.placeholder.com/150/92c952',
    );
  }
}

PreferredSizeWidget myPostsAppBar(BuildContext context) {
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
          'My Posts',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: getBigFontSize(context)),
        ),
        Text(
          'posted on my feed',
          style: TextStyle(color: Colors.grey, fontSize: getFontSize(context)),
        ),
      ],
    ),
  );
}

Widget postWidget(BuildContext context, Post post) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        postHeader(context, post),
        postContent(context, post),
        postFooter(context, post),
        postCommentsSection(context),
        postCommentInput(context),
      ],
    ),
  );
}

Widget postHeader(BuildContext context, Post post) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(post.profileImageUrl),
    ),
    title: Text(post.author,
        style: interBold.copyWith(fontSize: getBigFontSize(context))),
    subtitle: Text('Mother - 2 Children\'s',
        style: interRegular.copyWith(fontSize: getFontSize(context))),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(post.timeAgo),
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
  );
}

Widget postContent(BuildContext context, Post post) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.content,
            style: contentC5.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Image.network(post.imageUrl),
      ],
    ),
  );
}

Widget postFooter(BuildContext context, Post post) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: getPadding(context), vertical: getSpacing(context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        postActionButton(context, 'assets/images/liked.png', '${post.likes}'),
        postActionButton(context, 'assets/images/comment.png', 'Comments'),
        postActionButton(context, 'assets/images/share.png', 'Share'),
        CircleAvatar(
          backgroundImage: NetworkImage(post.profileImageUrl),
          radius: 12,
        ),
        Text('Post for Kamran',
            style: interBold.copyWith(fontSize: getFontSize(context))),
      ],
    ),
  );
}

Widget postActionButton(BuildContext context, String iconPath, String label) {
  return Row(
    children: [
      Image.asset(iconPath, width: 24.0, height: 24.0),
      SizedBox(width: getSpacing(context)),
      Text(label,
          style: interRegular.copyWith(fontSize: getBigFontSize(context))),
    ],
  );
}

Widget postCommentsSection(BuildContext context) {
  return Column(
    children: [
      const Divider(),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getPadding(context), vertical: getSpacing(context)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://via.placeholder.com/150/92c952'),
              radius: 12,
            ),
            SizedBox(width: getPadding(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  postCommentHeader(context),
                  postCommentContent(context),
                  postCommentActions(context),
                ],
              ),
            ),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    ],
  );
}

Widget postCommentHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Fatima',
          style: interBold.copyWith(fontSize: getBigFontSize(context))),
      Text('01 Month Ago',
          style: interRegular.copyWith(
              fontSize: getFontSize(context), color: Colors.grey)),
    ],
  );
}

Widget postCommentContent(BuildContext context) {
  return Text(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
    style: interRegular.copyWith(fontSize: getFontSize(context)),
  );
}

Widget postCommentActions(BuildContext context) {
  return Row(
    children: [
      postActionIcon(context, 'assets/images/liked.png', '23'),
      postActionIcon(context, 'assets/images/reply.png', 'Reply'),
    ],
  );
}

Widget postActionIcon(BuildContext context, String iconPath, String label) {
  return Row(
    children: [
      Image.asset(iconPath, width: 16.0, height: 16.0),
      SizedBox(width: getSpacing(context)),
      Text(label, style: interRegular.copyWith(fontSize: getFontSize(context))),
      SizedBox(width: getSpacing(context)),
    ],
  );
}

Widget postCommentInput(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: getPadding(context), vertical: getSpacing(context)),
    child: Row(
      children: [
        const CircleAvatar(
          backgroundImage:
              NetworkImage('https://via.placeholder.com/150/92c952'),
          radius: 16,
        ),
        SizedBox(width: getPadding(context)),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
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
  );
}

Widget bottomSheet(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        bottomSheetOption(context, 'assets/images/edit.png', 'Edit Post'),
        bottomSheetOption(context, 'assets/images/pin.png', 'Pin Post'),
        bottomSheetOption(context, 'assets/images/notification-cancel.png',
            'Turn Off Notification for this Post'),
        bottomSheetOption(
            context, 'assets/images/delete.png', 'Delete this Post'),
      ],
    ),
  );
}

Widget bottomSheetOption(BuildContext context, String iconPath, String label) {
  return ListTile(
    leading: Image.asset(iconPath, width: 24.0, height: 24.0),
    title: Text(label),
    trailing: const Icon(Icons.arrow_forward_ios), // Added arrow icon
    onTap: () {
      Navigator.pop(context);
    },
  );
}
