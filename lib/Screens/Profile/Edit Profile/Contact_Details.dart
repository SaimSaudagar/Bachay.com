import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // Add this package to pubspec.yaml
import '../../../Utils/app_constants.dart';

void main() {
  runApp(const MaterialApp(
    home: ContactDetailsScreen(),
  ));
}

class ContactDetailsScreen extends StatefulWidget {
  const ContactDetailsScreen({Key? key}) : super(key: key);

  @override
  _ContactDetailsScreenState createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool _showOTPMessage = false;
  bool _isEmailValid = false;
  bool _isMobileValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _mobileController.addListener(_validateMobile);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      _isEmailValid = EmailValidator.validate(_emailController.text);
    });
  }

  void _validateMobile() {
    setState(() {
      _isMobileValid = _mobileController.text.length == 11;
    });
  }

  void _verify() {
    if (_isEmailValid && _isMobileValid) {
      setState(() {
        _showOTPMessage = true;
      });
    } else {
      setState(() {
        _showOTPMessage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Contact Details',
        subtitle: 'Enter your contact information.',
        actionText: 'Edit',
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            emailInput(context),
            SizedBox(height: getSpacing(context) * 2),
            mobileNumberInput(context),
            if (_showOTPMessage) ...[
              SizedBox(height: getSpacing(context)),
              errorMessage(context),
              SizedBox(height: getSpacing(context) * 2),
              otpMessage(context),
              SizedBox(height: getSpacing(context) * 2),
            ],
            SizedBox(height: getSpacing(context) * 2),
            actionButtons(context),
            SizedBox(height: getSpacing(context) * 2),
            whyVerifyNumber(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget customAppBar(BuildContext context,
      {required String title, required String subtitle, required String actionText}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
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
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            actionText,
            style: interBold.copyWith(
              color: buttonColorPurple,
              fontSize: getFontSize(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget emailInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context)),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: 'company@example.com',
            hintStyle: const TextStyle(fontSize: 16),
            suffixIcon: Icon(
              _isEmailValid ? Icons.check_circle : Icons.cancel,
              color: _isEmailValid ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileNumberInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mobile No',
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context)),
        TextField(
          controller: _mobileController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: 'Enter Your Mobile Number',
            hintStyle: const TextStyle(fontSize: 16),
            suffixIcon: Icon(
              _isMobileValid ? Icons.check_circle : Icons.cancel,
              color: _isMobileValid ? Colors.green : Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget errorMessage(BuildContext context) {
    return Text(
      'Please check your mobile before clicking on verify & save.',
      style: interRegular.copyWith(color: Colors.red, fontSize: getFontSize(context)),
    );
  }

  Widget actionButtons(BuildContext context) {
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
            onPressed: _verify,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColorPurple,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              'Verify',
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

  Widget otpMessage(BuildContext context) {
    return Text(
      'A one time password (OTP) sent to the above mobile number and email address.',
      style: interRegular.copyWith(fontSize: getFontSize(context)),
    );
  }

  Widget whyVerifyNumber(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Why Should I Verify My Number?',
        style: interBold.copyWith(fontSize: getFontSize(context)),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Text(
            'Sorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos.',
            style: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
        ),
      ],
    );
  }
}
