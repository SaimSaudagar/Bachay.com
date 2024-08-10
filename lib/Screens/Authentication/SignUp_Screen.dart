import 'package:app/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SignUp-Flow/AddImage_Screen.dart';

class SetupAccountScreen extends StatefulWidget {
  const SetupAccountScreen({super.key});

  @override
  _SetupAccountScreenState createState() => _SetupAccountScreenState();
}

class _SetupAccountScreenState extends State<SetupAccountScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reEnterPasswordController = TextEditingController();

  bool _fullNameError = false;
  bool _emailError = false;
  bool _passwordVisible = false;
  bool _reEnterPasswordVisible = false;
  bool _passwordMatchError = false;

  int _passwordStrength = 0;

  void _validateFullName(String value) {
    setState(() {
      _fullNameError = value.trim().split(' ').length < 2;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _emailError = !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
    });
  }

  void _validatePasswords() {
    setState(() {
      _passwordMatchError =
          _passwordController.text != _reEnterPasswordController.text;
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Setup Your Account',
                  style: outfitBold.copyWith(
                      fontSize: getBigFontSize(context) * 2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please setup your account.',
                  style:
                      contentC5.copyWith(fontSize: getFontSize(context) * 1.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Full Name', style: outfitBold),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _fullNameController,
                  onChanged: _validateFullName,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    suffixIcon: _fullNameError
                        ? const Icon(Icons.error, color: Colors.red)
                        : null,
                    hintText: 'Enter your Full Name',
                    hintStyle: contentC5.copyWith(
                        fontSize: getFontSize(context) * 1.5, color: fontcolor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: _fullNameError ? Colors.red : Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: _fullNameError ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email', style: outfitBold),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _emailController,
                  onChanged: _validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: _emailError
                        ? const Icon(Icons.error, color: Colors.red)
                        : null,
                    hintText: 'example@company.com',
                    hintStyle: contentC5.copyWith(
                        fontSize: getFontSize(context) * 1.5, color: fontcolor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: _emailError ? Colors.red : Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: _emailError ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone', style: outfitBold),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone_outlined),
                    hintText: '+92 312-3456789',
                    hintStyle: contentC5.copyWith(
                        fontSize: getFontSize(context) * 1.5, color: fontcolor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password', style: outfitBold),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  onChanged: (value) {
                    _checkPasswordStrength(value);
                    _validatePasswords();
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: 'Enter New Password',
                    hintStyle: contentC5.copyWith(
                        fontSize: getFontSize(context) * 1.5, color: fontcolor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    return Column(
                      children: [
                        Container(
                          height: 3,
                          width: 60,
                          color: index < _passwordStrength
                              ? _getStrengthColor(_passwordStrength)
                              : Colors.grey.shade300,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          index == _passwordStrength - 1
                              ? _getStrengthText(index + 1)
                              : "",
                          style: const TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Re-enter Password', style: outfitBold),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: _reEnterPasswordController,
                  obscureText: !_reEnterPasswordVisible,
                  onChanged: (value) => _validatePasswords(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: _passwordMatchError
                        ? const Icon(Icons.error, color: Colors.red)
                        : IconButton(
                            icon: Icon(
                              _reEnterPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _reEnterPasswordVisible =
                                    !_reEnterPasswordVisible;
                              });
                            },
                          ),
                    hintText: 'Re-enter Password',
                    hintStyle: contentC5.copyWith(
                        fontSize: getFontSize(context) * 1.5, color: fontcolor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:
                              _passwordMatchError ? Colors.red : Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color:
                              _passwordMatchError ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePhotoScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColorPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(roundBorderRadius),
                      ),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * buttonWidth,
                      child: const Padding(
                        padding: buttonPadding,
                        child: Center(
                          child: Text(
                            'Sign in',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
