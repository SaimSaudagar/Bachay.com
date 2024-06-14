// import 'package:app/Widgets/App_Bar.dart';
// import 'package:app/Widgets/Botton_Nav_Bar.dart';
// import 'package:app/Widgets/Location_Bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   void _onTabSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               LocationButton(
//                 text: '',
//                 onTap: () {},
//               ),
//               SizedBox(height: 20),
//               // Text('Selected tab: ${_selectedIndex + 1}'),
//               SvgPicture.asset(
//                 'assets/images/view.svg',
//                 fit: BoxFit.contain,
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         onTabSelected: _onTabSelected,
//       ),
//     );
//   }
// }
import 'package:app/Widgets/App_Bar.dart';
import 'package:app/Widgets/Botton_Nav_Bar.dart';
import 'package:app/Widgets/Location_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LocationButton(
              text: "Select Location to see product availability",
              onTap: () {
                // Handle button tap
              },
            ),
            SizedBox(height: 20),
            SvgPicture.asset(
              'assets/images/view.svg',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
