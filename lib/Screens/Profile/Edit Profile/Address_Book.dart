import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

void main() {
  runApp(const MaterialApp(
    home: AddressBookScreen(),
  ));
}

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Address Book',
        subtitle: 'Add or Change your billing address.',
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add, color: Colors.white),
                    SizedBox(width: getSpacing(context)),
                    Text(
                      'Add Address',
                      style: interBold.copyWith(
                        color: Colors.white,
                        fontSize: getFontSize(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget customAppBar(BuildContext context,
      {required String title, required String subtitle}) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: interBold.copyWith(
              color: Colors.black,
              fontSize: getBigFontSize(context),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: interRegular.copyWith(
              color: Colors.grey,
              fontSize: getFontSize(context),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
