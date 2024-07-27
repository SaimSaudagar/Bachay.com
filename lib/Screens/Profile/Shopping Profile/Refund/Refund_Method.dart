import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';

class SelectRefundMethodScreen extends StatelessWidget {
  const SelectRefundMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Return Request (2/2)',
          style: TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    '02',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getFontSize(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network(
                'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                'BUMZEE Interlock Half Sleeves Star Printed Tee & Shorts Set With Suspender - Beige & Navy Blue',
                style: TextStyle(fontSize: getFontSize(context)),
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rs. 257  Rs. 3999'),
                  Text('Quantity: 04'),
                  Text('Total Order:'),
                  Text('Rs. 1,445'),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 4),
            Text('Selected Refund Method', style: interBold.copyWith(fontSize: getBigFontSize(context))),
            ListTile(
              leading: Radio(
                value: 'refund_via_wallet',
                groupValue: 'refund_via_wallet',
                onChanged: (value) {},
              ),
              title: Text('Refund via Bachay Wallet', style: interRegular.copyWith(fontSize: getFontSize(context))),
              subtitle: Text('Refund timeline: 30 Mins after the return quality check is completed by Bachay.com teams.', style: interRegular.copyWith(fontSize: getFontSize(context))),
            ),
            const Divider(),
            _buildRefundDetails(context),
            SizedBox(height: getSpacing(context) * 8),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRefundDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Refund Details:', style: interBold.copyWith(fontSize: getFontSize(context))),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Item Price + Cash Payment Fee', style: interRegular.copyWith(fontSize: getFontSize(context))),
            Text('Rs. 1950', style: interRegular.copyWith(fontSize: getFontSize(context))),
          ],
        ),
        SizedBox(height: getSpacing(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee:', style: interRegular.copyWith(fontSize: getFontSize(context))),
            Text('Rs. 149', style: interRegular.copyWith(fontSize: getFontSize(context))),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Refund Amount:', style: interBold.copyWith(fontSize: getBigFontSize(context))),
            Text('Rs. 2099', style: interBold.copyWith(fontSize: getBigFontSize(context), color: buttonColorPurple)),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle submit action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.symmetric(vertical: getPadding(context)),
      ),
      child: Text('Submit', style: buttonTextStyle(context).copyWith(color: Colors.white)),
    );
  }
}
