import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

void main() {
  runApp(WalletApp());
}

class WalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WalletScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Wallet', style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet, size: 40.0),
                        SizedBox(width: getPadding(context)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance', style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
                            Text('Rs. 1,456', style: outfitBold.copyWith(fontSize: getBigFontSize(context))),
                          ],
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Top up'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: getSpacing(context) * 6, thickness: 1.0),
                    _buildInfoRow(
                      context,
                      icon: Icons.info,
                      title: 'How to Use',
                      description: '• Earn money o your wallet by completing the offer & challenged\n'
                          '• Convert your loyalty points into wallet money\n'
                          '• Admin also rewards their top customers with wallet money\n'
                          '• Send your wallet money while order',
                    ),
                    Divider(height: getSpacing(context) * 6, thickness: 1.0),
                    _buildTransactionHistory(context),
                    Divider(height: getSpacing(context) * 6, thickness: 1.0),
                    _buildPaymentSecurity(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24.0),
            SizedBox(width: getPadding(context)),
            Text(title, style: outfitBold.copyWith(fontSize: getFontSize(context))),
          ],
        ),
        SizedBox(height: getSpacing(context) * 2),
        Text(description, style: interRegular.copyWith(fontSize: getFontSize(context))),
      ],
    );
  }

  Widget _buildTransactionHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.history, size: 24.0),
            SizedBox(width: getPadding(context)),
            Text('Transaction History', style: outfitBold.copyWith(fontSize: getFontSize(context))),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('All Transactions', style: TextStyle(color: Colors.green, fontSize: getFontSize(context))),
            ),
          ],
        ),
        SizedBox(height: getSpacing(context) * 2),
        _buildTransactionItem(context, 'Refund', '22:03, May 14 2024', '240', true),
        _buildTransactionItem(context, 'Gift Rewards', '20:17, May 14 2024', '100', false),
        _buildTransactionItem(context, 'Refund', '23:02, May 14 2024', '240', true),
      ],
    );
  }

  Widget _buildTransactionItem(BuildContext context, String title, String date, String amount, bool success) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSpacing(context) * 2),
      child: Row(
        children: [
          Icon(success ? Icons.check_circle : Icons.cancel, color: success ? Colors.green : Colors.red),
          SizedBox(width: getPadding(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: outfitBold.copyWith(fontSize: getFontSize(context))),
              Text(date, style: interRegular.copyWith(fontSize: getFontSize(context))),
            ],
          ),
          Spacer(),
          Text(amount, style: outfitBold.copyWith(fontSize: getFontSize(context))),
        ],
      ),
    );
  }

  Widget _buildPaymentSecurity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.lock, size: 24.0),
            SizedBox(width: getPadding(context)),
            Text('Payment Security', style: outfitBold.copyWith(fontSize: getFontSize(context))),
          ],
        ),
        SizedBox(height: getSpacing(context) * 2),
        Text(
          'Bachay.com is committed to protecting your payment information and only shares your credit card information with our payment service providers who agreed to safeguard your information.',
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context) * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/visa.png', height: getBigFontSize(context) * 1.2), // Replace with actual image URLs
            Image.asset('assets/images/Mastercard.png', height: getBigFontSize(context) * 1.2),
            Image.asset('assets/images/AmericanExpress.png', height: getBigFontSize(context) * 1.2),
            Image.asset('assets/images/Mastercard2.png', height: getBigFontSize(context) * 1.2),
            Image.asset('assets/images/Visa-verified.png', height: getBigFontSize(context) * 1.2),
          ],
        ),
      ],
    );
  }
}
