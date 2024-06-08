import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Setup Your Account',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SetupAccountScreen(),
    );
  }
}

class SetupAccountScreen extends StatefulWidget {
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
      _passwordMatchError = _passwordController.text != _reEnterPasswordController.text;
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
                SizedBox(height: 40),
                Text(
                  'Setup Your Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Please setup your account.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Full Name'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _fullNameController,
                  onChanged: _validateFullName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    suffixIcon: _fullNameError ? Icon(Icons.error, color: Colors.red) : null,
                    hintText: 'Enter your Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: _fullNameError ? Colors.red : Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: _fullNameError ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _emailController,
                  onChanged: _validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    suffixIcon: _emailError ? Icon(Icons.error, color: Colors.red) : null,
                    hintText: 'example@company.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: _emailError ? Colors.red : Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: _emailError ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_outlined),
                    hintText: '+92 312-3456789',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  onChanged: (value) {
                    _checkPasswordStrength(value);
                    _validatePasswords();
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: 'Enter New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 5),
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
                        SizedBox(height: 5),
                        Text(
                          index == _passwordStrength - 1 ? _getStrengthText(index + 1) : "",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Re-enter Password'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _reEnterPasswordController,
                  obscureText: !_reEnterPasswordVisible,
                  onChanged: (value) => _validatePasswords(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: _passwordMatchError
                        ? Icon(Icons.error, color: Colors.red)
                        : IconButton(
                            icon: Icon(
                              _reEnterPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _reEnterPasswordVisible = !_reEnterPasswordVisible;
                              });
                            },
                          ),
                    hintText: 'Re-enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: _passwordMatchError ? Colors.red : Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: _passwordMatchError ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign in
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
