// import 'package:flutter/material.dart';

// class LocationButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: () {
//           // Handle button tap
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15.0),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.location_on,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     "Select Location to see product availability",
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Location Button Example')),
//         body: Center(
//           child: LocationButton(),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onTap;

  LocationButton({
    required this.text,
    this.leadingIcon = Icons.location_on,
    this.trailingIcon = Icons.keyboard_arrow_down,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.textColor = Colors.grey,
    this.iconColor = Colors.grey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    leadingIcon,
                    color: iconColor,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Icon(
                trailingIcon,
                color: iconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Location Button Example')),
        body: Center(
          child: LocationButton(
            text: "Select Location to see product availability",
            onTap: () {
              // Handle button tap
              print("Location button tapped");
            },
          ),
        ),
      ),
    );
  }
}
