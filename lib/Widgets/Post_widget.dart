import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Utils/app_constants.dart';

class PostWidget extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String userRole;
  final String postTime;
  final String postContent;
  final String postImageUrl;
  final int likesCount;
  final String userComment;

  const PostWidget({
    Key? key,
    required this.profileImageUrl,
    required this.userName,
    required this.userRole,
    required this.postTime,
    required this.postContent,
    required this.postImageUrl,
    required this.likesCount,
    required this.userComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getPadding(context)),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
                radius: getFontSize(context) * 2.5,
              ),
              title: Text(
                userName,
                style: interBold.copyWith(fontSize: getBigFontSize(context)),
              ),
              subtitle: Row(
                children: [
                  Text(userRole, style: interRegular.copyWith(fontSize: getFontSize(context))),
                  SizedBox(width: getSpacing(context)),
                  Text('•', style: interRegular.copyWith(fontSize: getFontSize(context))),
                  SizedBox(width: getSpacing(context)),
                  Text('2 Children\'s', style: interRegular.copyWith(fontSize: getFontSize(context))),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(postTime, style: interRegular.copyWith(fontSize: getFontSize(context))),
                  SizedBox(height: getSpacing(context)),
                  Icon(Icons.more_horiz, size: getFontSize(context) * 1.5),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
              child: Text(
                postContent,
                style: interRegular.copyWith(fontSize: getBigFontSize(context)),
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            if (postImageUrl.isNotEmpty)
              Image.network(postImageUrl),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getPadding(context), vertical: getSpacing(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/like.svg',
                        width: getFontSize(context) * 2,
                        height: getFontSize(context) * 2,
                      ),
                      SizedBox(width: getSpacing(context)),
                      Text('$likesCount', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/comment.svg',
                        width: getFontSize(context) * 2,
                        height: getFontSize(context) * 2,
                      ),
                      SizedBox(width: getSpacing(context)),
                      Text('Comments', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/share.svg',
                        width: getFontSize(context) * 2,
                        height: getFontSize(context) * 2,
                      ),
                      SizedBox(width: getSpacing(context)),
                      Text('Share', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(profileImageUrl),
                        radius: getFontSize(context) * 2.5,
                      ),
                      SizedBox(width: getSpacing(context) * 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Post for',
                            style: interRegular.copyWith(fontSize: getFontSize(context)),
                          ),
                          Text(
                            'Kamran',
                            style: interBold.copyWith(
                              fontSize: getBigFontSize(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profileImageUrl),
                radius: getFontSize(context) * 2.5,
              ),
              title: Text(
                userComment,
                style: interRegular.copyWith(fontSize: getFontSize(context)),
              ),
              trailing: Text(
                '01 Month Ago',
                style: interRegular.copyWith(fontSize: getFontSize(context)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getPadding(context)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write what's in your mind...",
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(getPadding(context)),
                          child: Image.asset(
                            'assets/images/send.png',
                            width: getFontSize(context) * 2.5,
                            height: getFontSize(context) * 2.5,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(borderRadius*5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
          ],
        ),
      ),
    );
  }
}
