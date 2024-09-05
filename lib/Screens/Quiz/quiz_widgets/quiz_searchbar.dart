import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class QuizSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15), // Updated to match rounded edges
        border: Border.all(
          color:
              Colors.black.withOpacity(1), // Adjusted to give a subtle border
          width: 1.5, // Border thickness matching the UI
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1), // Adjusted shadow color
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // Subtle shadow for depth
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/logo/search.svg'),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/logo/filter.svg'),
          ),
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.grey.shade600, // Hint text color to match the UI
            fontWeight:
                FontWeight.w500, // Adjust font weight for better visibility
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}