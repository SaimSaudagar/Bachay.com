import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  QuizAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // removes default back button
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/logo/close.svg'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SvgPicture.asset(
              'assets/logo/bachay_education.svg',
              height: 40,
            ),
            const Spacer(),
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/boy-icon.png'), // replace with your image asset
                  radius: 20,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Kamran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_drop_down),
                SizedBox(width: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}