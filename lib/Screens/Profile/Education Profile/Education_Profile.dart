import 'package:flutter/material.dart';

import '../../../Utils/app_constants.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: getSpacing(context) * 4),
            Text('Features', style: interBold.copyWith(fontSize: getBigFontSize(context))),
            SizedBox(height: getSpacing(context)),
            _buildFeatureButtonsRow(context),
            SizedBox(height: getSpacing(context) * 4),
            const Divider(thickness: 1.0),
            SizedBox(height: getSpacing(context) * 4),
            _buildQuizCard(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {},
      ),
      title: Image.asset('assets/logo/LogoEducation.png', height: getBigFontSize(context) * 2),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: getBigFontSize(context) * 2,
          backgroundImage: const AssetImage('assets/images/Celebrate.png'),
        ),
        SizedBox(width: getSpacing(context) * 3.2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Samira',
                style: interBold.copyWith(fontSize: getBigFontSize(context)),
              ),
              Text(
                'Welcome to Bachay Education',
                style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Image.asset('assets/images/edit.png', width: getBigFontSize(context), height: getBigFontSize(context)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFeatureButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFeatureButton(context, 'assets/images/settings-child.png', 'Add Child'),
        _buildFeatureButton(context, 'assets/images/points.png', 'Points'),
        _buildFeatureButton(context, 'assets/images/wallet.png', 'Wallet'),
        _buildFeatureButton(context, 'assets/images/bachay_club.png', 'Bachay Club'),
      ],
    );
  }

  Widget _buildFeatureButton(BuildContext context, String iconPath, String label) {
    return Column(
      children: [
        Image.asset(iconPath, height: getBigFontSize(context), width: getBigFontSize(context)),
        SizedBox(height: getSpacing(context)),
        Text(label, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }

  Widget _buildQuizCard(BuildContext context) {
    return Card(
      color: Colors.orange.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ListTile(
        leading: Image.asset('assets/images/Quiz.png', height: getBigFontSize(context), width: getBigFontSize(context)),
        title: Text('Quizzes', style: interBold.copyWith(fontSize: getBigFontSize(context))),
        subtitle: Text('Your Child Quizzes.', style: interRegular.copyWith(fontSize: getFontSize(context))),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: () {},
      ),
    );
  }
}
