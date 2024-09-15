import 'package:app/API/Bloc/Profile/Profile_Event.dart';
import 'package:app/API/Bloc/Profile/Profile_State.dart';
import 'package:app/API/Bloc/Profile/Profile_Bloc.dart';
import 'package:app/API/Repository/Profile_Repo.dart';
import 'package:app/Widgets/App_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Utils/app_constants.dart';

class PersonalInformationScreen extends StatelessWidget {
  final String username;
  final String phone;

  const PersonalInformationScreen(
      {super.key, required this.username, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(profileRepository: ProfileRepository()),
      child: Scaffold(
        appBar: const CustomAppBar(
          state: 1,
        ),
        body: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileUpdated) {
                // Show a success message when profile is updated
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully!')),
                );
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              } else if (state is ProfileUpdateError) {
                // Show an error message if the profile update failed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Failed to update profile: ${state.message}')),
                );
              }
            },
            child: buildProfileForm(
                context, username), // Use the provided username
          ),
        ),
      ),
    );
  }

  Widget buildProfileForm(BuildContext context, String username) {
    // Create a TextEditingController to pass to the ActionButtons
    final TextEditingController fullNameController =
        TextEditingController(text: username);

    return ListView(
      children: [
        UserProfileSection(username: username),
        SizedBox(height: getSpacing(context) * 4),
        FullNameInput(
            controller:
                fullNameController), // Pass the controller to FullNameInput
        SizedBox(height: getSpacing(context) * 2),
        const ParentStatusChips(),
        SizedBox(height: getSpacing(context) * 4),
        ActionButtons(
          controller: fullNameController,
          phone: phone,
        ), // Pass the same controller to ActionButtons
      ],
    );
  }
}

class UserProfileSection extends StatelessWidget {
  final String username;

  const UserProfileSection({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: getFontSize(context) * 4,
          backgroundImage: const AssetImage('assets/images/Celebrate.png'),
        ),
        SizedBox(width: getPadding(context)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: interBold.copyWith(fontSize: getBigFontSize(context)),
            ),
            Text(
              'Mother of 03',
              style: interRegular.copyWith(
                  color: Colors.grey, fontSize: getFontSize(context)),
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

// Updated FullNameInput to accept a TextEditingController
class FullNameInput extends StatelessWidget {
  final TextEditingController controller;

  const FullNameInput({super.key, required this.controller});

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
          controller: controller, // Use the passed controller
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

// Pass the controller to the ActionButtons
class ActionButtons extends StatelessWidget {
  final TextEditingController controller;
  final String phone;

  const ActionButtons(
      {super.key, required this.controller, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
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
            onPressed: () {
              // Use the passed controller to get the full name and update the profile
              final fullName = controller.text;
              context
                  .read<ProfileBloc>()
                  .add(UpdateProfile(name: fullName, phone: phone));
            },
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
