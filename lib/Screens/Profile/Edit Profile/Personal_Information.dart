import 'package:app/Screens/Profile/Edit%20Profile/Edit_Profile.dart';
import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

void main() {
  runApp(const MaterialApp(
    home: PersonalInformationScreen(),
  ));
}

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Personal Information',
        subtitle: 'Enter your personal details.',
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            const UserProfileSection(),
            SizedBox(height: getSpacing(context) * 4),
            const FullNameInput(),
            SizedBox(height: getSpacing(context) * 2),
            const ParentStatusChips(),
            SizedBox(height: getSpacing(context) * 4),
            const ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditProfileScreen()),
          );
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: interBold.copyWith(
              color: Colors.black,
              fontSize: getBigFontSize(context),
            ),
          ),
          Text(
            subtitle,
            style: interRegular.copyWith(
              color: Colors.grey,
              fontSize: getFontSize(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: getFontSize(context) * 4,
          backgroundImage: const AssetImage('assets/images/Celebrate.png'), // Adjust the asset path
        ),
        SizedBox(width: getPadding(context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Samira Khan',
              style: interBold.copyWith(fontSize: getBigFontSize(context)),
            ),
            Text(
              'Mother of 03',
              style: interRegular.copyWith(color: Colors.grey, fontSize: getFontSize(context)),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Change Profile',
            style: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
        ),
      ],
    );
  }
}

class FullNameInput extends StatelessWidget {
  const FullNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name',
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context)),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: 'Enter Your Name',
            hintStyle: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
        ),
      ],
    );
  }
}

class ParentStatusChips extends StatefulWidget {
  const ParentStatusChips({super.key});

  @override
  _ParentStatusChipsState createState() => _ParentStatusChipsState();
}

class _ParentStatusChipsState extends State<ParentStatusChips> {
  String selectedStatus = 'Mother';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: getPadding(context),
      runSpacing: getSpacing(context),
      children: [
        _buildChip(context, 'Mother'),
        _buildChip(context, 'Father'),
        _buildChip(context, 'Guardian'),
        _buildChip(context, 'Expecting'),
        _buildChip(context, 'Trying to Conceive'),
      ],
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    bool isSelected = selectedStatus == label;
    return ChoiceChip(
      label: Text(
        label,
        style: interRegular.copyWith(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: getFontSize(context),
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedStatus = label;
        });
      },
      selectedColor: Colors.black,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Cancel',
              style: interBold.copyWith(
                color: Colors.black,
                fontSize: getFontSize(context),
              ),
            ),
          ),
        ),
        SizedBox(width: getPadding(context)),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColorPurple,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Save',
              style: interBold.copyWith(
                color: Colors.white,
                fontSize: getFontSize(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
