import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Utils/app_constants.dart';

void main() {
  runApp(MaterialApp(
    home: PasswordChangeScreen(),
  ));
}

class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _reEnterPasswordController = TextEditingController();

  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _reEnterPasswordVisible = false;
  bool _passwordMatchError = false;
  int _passwordStrength = 0;

  void _validatePasswords() {
    setState(() {
      _passwordMatchError =
          _newPasswordController.text != _reEnterPasswordController.text;
    });
  }

  void _checkPasswordStrength(String password) {
    int strength = 0;

    if (password.length < 8) {
      strength = 1; // Extremely Weak
    } else {
      bool hasUpper = password.contains(RegExp(r'[A-Z]'));
      bool hasLower = password.contains(RegExp(r'[a-z]'));
      bool hasDigit = password.contains(RegExp(r'[0-9]'));
      bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      if ((hasUpper && hasLower) ||
          (hasUpper && hasDigit) ||
          (hasUpper && hasSpecial) ||
          (hasLower && hasDigit) ||
          (hasLower && hasSpecial) ||
          (hasDigit && hasSpecial)) {
        strength = 3; // Normal
      }
      if ((hasUpper && hasLower && hasDigit) ||
          (hasUpper && hasLower && hasSpecial) ||
          (hasUpper && hasDigit && hasSpecial) ||
          (hasLower && hasDigit && hasSpecial)) {
        strength = 4; // Strong
      }
      if (hasUpper && hasLower && hasDigit && hasSpecial) {
        strength = 5; // Very Strong
      }
      if (strength == 0) {
        strength = 2; // Weak
      }
    }

    setState(() {
      _passwordStrength = strength;
    });
  }

  Color _getStrengthColor(int strength) {
    switch (strength) {
      case 1:
        return Colors.red.shade900;
      case 2:
        return Colors.red;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.green;
      case 5:
        return Colors.green.shade900;
      default:
        return Colors.grey;
    }
  }

  String _getStrengthText(int strength) {
    switch (strength) {
      case 1:
        return "Extremely Weak";
      case 2:
        return "Weak";
      case 3:
        return "Normal";
      case 4:
        return "Strong";
      case 5:
        return "Very Strong";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Change',
              style: interBold.copyWith(color: Colors.black),
            ),
            Text(
              'Change your password & security.',
              style: interRegular.copyWith(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildPasswordField(
              context,
              label: 'Current Password',
              controller: _currentPasswordController,
              visible: _currentPasswordVisible,
              onVisibilityToggle: () {
                setState(() {
                  _currentPasswordVisible = !_currentPasswordVisible;
                });
              },
            ),
            SizedBox(height: 20),
            _buildPasswordField(
              context,
              label: 'New Password',
              controller: _newPasswordController,
              visible: _newPasswordVisible,
              onChanged: (value) {
                _checkPasswordStrength(value);
                _validatePasswords();
              },
              onVisibilityToggle: () {
                setState(() {
                  _newPasswordVisible = !_newPasswordVisible;
                });
              },
            ),
            SizedBox(height: 10),
            _buildPasswordStrengthIndicator(),
            SizedBox(height: 20),
            _buildPasswordField(
              context,
              label: 'Re-enter Password',
              controller: _reEnterPasswordController,
              visible: _reEnterPasswordVisible,
              onChanged: (value) => _validatePasswords(),
              onVisibilityToggle: () {
                setState(() {
                  _reEnterPasswordVisible = !_reEnterPasswordVisible;
                });
              },
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Save action
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required bool visible,
    VoidCallback? onVisibilityToggle,
    ValueChanged<String>? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: !visible,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: 'Enter $label',
            hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                visible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: onVisibilityToggle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordStrengthIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return Expanded(
          child: Container(
            height: 3,
            margin: EdgeInsets.symmetric(horizontal: 2),
            color: index < _passwordStrength
                ? _getStrengthColor(_passwordStrength)
                : Colors.grey.shade300,
          ),
        );
      }),
    );
  }
}
