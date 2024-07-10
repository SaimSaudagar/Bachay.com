import 'package:flutter/material.dart';

import 'Wallet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopUpWalletScreen(),
    );
  }
}

class TopUpWalletScreen extends StatefulWidget {
  @override
  _TopUpWalletScreenState createState() => _TopUpWalletScreenState();
}

class _TopUpWalletScreenState extends State<TopUpWalletScreen> {
  Future<Map<String, dynamic>> _fetchData() async {
    // Simulating network request delay
    await Future.delayed(Duration(seconds: 2));

    // Simulated response data
    return {
      "amounts": [2000, 4000, 6000],
      "paymentMethods": [
        {"type": "Visa", "last4": "0215"},
        {"type": "MasterCard", "last4": "9834"}
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up Wallet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => WalletScreen()),
            );
          },
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return TopUpWalletContent(data: snapshot.data!);
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class TopUpWalletContent extends StatefulWidget {
  final Map<String, dynamic> data;

  TopUpWalletContent({required this.data});

  @override
  _TopUpWalletContentState createState() => _TopUpWalletContentState();
}

class _TopUpWalletContentState extends State<TopUpWalletContent> {
  int? _selectedAmount;
  String _customAmount = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select or enter deposit amount',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: widget.data['amounts'].map<Widget>((amount) {
                    return Expanded(
                      child: _buildAmountButton(amount),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'PKR',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _customAmount = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deposit Amount\nPKR ${_customAmount.isNotEmpty ? _customAmount : _selectedAmount ?? ''}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showPaymentMethodsSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAmountButton(int amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedAmount = amount;
          _customAmount = '';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedAmount == amount ? Colors.purple : Colors.grey,
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text(
        'PKR $amount',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  void _showPaymentMethodsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return PaymentMethodsSheet(paymentMethods: widget.data['paymentMethods']);
      },
    );
  }
}

class PaymentMethodsSheet extends StatefulWidget {
  final List<dynamic> paymentMethods;

  PaymentMethodsSheet({required this.paymentMethods});

  @override
  _PaymentMethodsSheetState createState() => _PaymentMethodsSheetState();
}

class _PaymentMethodsSheetState extends State<PaymentMethodsSheet> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Payment Method',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Saved Methods',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ...widget.paymentMethods.map((method) {
              return ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      value: method['last4'],
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value;
                        });
                      },
                      activeColor: Colors.purple,
                    ),
                    method['type'] == 'Visa'
                        ? Image.asset('assets/images/visa.png', height: 24)
                        : Image.asset('assets/images/Mastercard.png', height: 24),
                  ],
                ),
                title: Text('${method['type']} **** ${method['last4']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                    IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                  ],
                ),
              );
            }).toList(),
            Divider(),
            Text(
              'Other Methods',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Row(
                children: [
                  Text('Add Card'),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset('assets/images/visa.png', height: 24),
                      Image.asset('assets/images/Mastercard.png', height: 24),
                      Image.asset('assets/images/AmericanExpress.png', height: 24),
                      // Image.asset('assets/images/Mastercard2.png', height: 24),
                      // Image.asset('assets/images/Visa-verified.png', height: 24),
                    ],
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Pay With Jazz Cash'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
