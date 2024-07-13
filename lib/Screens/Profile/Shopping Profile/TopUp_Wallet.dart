// import 'package:flutter/material.dart';
// import '../../../Utils/app_constants.dart';
// import 'Wallet.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TopUpWalletScreen(),
//     );
//   }
// }

// class TopUpWalletScreen extends StatefulWidget {
//   @override
//   _TopUpWalletScreenState createState() => _TopUpWalletScreenState();
// }

// class _TopUpWalletScreenState extends State<TopUpWalletScreen> {
//   Future<Map<String, dynamic>> _fetchData() async {
//     // Simulating network request delay
//     await Future.delayed(Duration(seconds: 2));

//     // Simulated response data
//     return {
//       "amounts": [2000, 4000, 6000],
//       "paymentMethods": [
//         {"type": "Visa", "last4": "0215"},
//         {"type": "MasterCard", "last4": "9834"}
//       ],
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Top Up Wallet'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => WalletScreen()),
//             );
//           },
//         ),
//       ),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: _fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             return TopUpWalletContent(data: snapshot.data!);
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }

// class TopUpWalletContent extends StatefulWidget {
//   final Map<String, dynamic> data;

//   TopUpWalletContent({required this.data});

//   @override
//   _TopUpWalletContentState createState() => _TopUpWalletContentState();
// }

// class _TopUpWalletContentState extends State<TopUpWalletContent> {
//   int? _selectedAmount;
//   String _customAmount = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(getPadding(context)),
//       child: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Select or enter deposit amount',
//                     style: interBold.copyWith(
//                       fontSize: getFontSize(context),
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: getSpacing(context) * 2),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: widget.data['amounts'].map<Widget>((amount) {
//                       return Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                           child: _buildAmountButton(context, amount),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(height: getSpacing(context) * 2),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'PKR Custom',
//                             hintStyle: interRegular.copyWith(
//                               color: Colors.grey,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide: BorderSide(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.all(14.0),
//                               child: Text(
//                                 'PKR',
//                                 style: interRegular.copyWith(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               _customAmount = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: getSpacing(context) * 2),
//                   Text(
//                     'Select pre defined amount or enter custom amount to top up your wallet and use on Bachay.com to purchase.',
//                     style: interRegular.copyWith(
//                       fontSize: getFontSize(context),
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(getPadding(context)),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Deposit Amount\nPKR ${_customAmount.isNotEmpty ? _customAmount : _selectedAmount ?? ''}',
//                   style: interBold.copyWith(
//                     fontSize: getBigFontSize(context),
//                     color: buttonColorPurple,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _showPaymentMethodsSheet(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(roundBorderRadius),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       horizontal: getPadding(context) * 1.5,
//                       vertical: getPadding(context),
//                     ),
//                   ),
//                   child: Text(
//                     'Confirm',
//                     style: buttonTextStyle(context),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAmountButton(BuildContext context, int amount) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           _selectedAmount = amount;
//           _customAmount = '';
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: _selectedAmount == amount ? Colors.white : Colors.grey[200],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           side: BorderSide(
//             color: _selectedAmount == amount ? buttonColorPurple : Colors.grey,
//           ),
//         ),
//         padding: EdgeInsets.symmetric(vertical: getPadding(context) * 2),
//       ),
//       child: Text(
//         'PKR $amount',
//         style: interRegular.copyWith(
//           fontSize: getFontSize(context),
//           color: _selectedAmount == amount ? buttonColorPurple : Colors.black,
//         ),
//       ),
//     );
//   }

//   void _showPaymentMethodsSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return PaymentMethodsSheet(paymentMethods: widget.data['paymentMethods']);
//       },
//     );
//   }
// }

// class PaymentMethodsSheet extends StatefulWidget {
//   final List<dynamic> paymentMethods;

//   PaymentMethodsSheet({required this.paymentMethods});

//   @override
//   _PaymentMethodsSheetState createState() => _PaymentMethodsSheetState();
// }

// class _PaymentMethodsSheetState extends State<PaymentMethodsSheet> {
//   String? _selectedPaymentMethod;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(getPadding(context)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Select Payment Method',
//                   style: interBold.copyWith(fontSize: getBigFontSize(context)),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.close),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: getSpacing(context)),
//             Text(
//               'Saved Methods',
//               style: interBold.copyWith(fontSize: getFontSize(context)),
//             ),
//             SizedBox(height: getSpacing(context)),
//             ...widget.paymentMethods.map((method) {
//               return ListTile(
//                 leading: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Radio<String>(
//                       value: method['last4'],
//                       groupValue: _selectedPaymentMethod,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedPaymentMethod = value;
//                         });
//                       },
//                       activeColor: buttonColorPurple,
//                     ),
//                     method['type'] == 'Visa'
//                         ? Image.asset('assets/images/visa.png', height: 24)
//                         : Image.asset('assets/images/Mastercard.png', height: 24),
//                   ],
//                 ),
//                 title: Text('${method['type']} **** ${method['last4']}'),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(icon: Icon(Icons.edit), onPressed: () {}),
//                     IconButton(
//                         icon: Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {}),
//                   ],
//                 ),
//               );
//             }).toList(),
//             Divider(),
//             Text(
//               'Other Methods',
//               style: interBold.copyWith(fontSize: getFontSize(context)),
//             ),
//             ListTile(
//               leading: Icon(Icons.add),
//               title: Row(
//                 children: [
//                   Text('Add Card'),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Image.asset('assets/images/visa.png', height: 24),
//                       Image.asset('assets/images/Mastercard.png', height: 24),
//                       Image.asset('assets/images/AmericanExpress.png', height: 24),
//                     ],
//                   ),
//                 ],
//               ),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: Icon(Icons.phone_android),
//               title: Text('Pay With Jazz Cash'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

















import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
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
    return Padding(
      padding: EdgeInsets.all(getPadding(context)),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select or enter deposit amount',
                    style: interBold.copyWith(
                      fontSize: getFontSize(context),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: getSpacing(context) * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.data['amounts'].map<Widget>((amount) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: _buildAmountButton(context, amount),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: getSpacing(context) * 2),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'PKR Custom',
                            hintStyle: interRegular.copyWith(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'PKR',
                                style: interRegular.copyWith(color: Colors.black),
                              ),
                            ),
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
                  SizedBox(height: getSpacing(context) * 2),
                  Text(
                    'Select pre defined amount or enter custom amount to top up your wallet and use on Bachay.com to purchase.',
                    style: interRegular.copyWith(
                      fontSize: getFontSize(context),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(getPadding(context)),
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
                  style: interBold.copyWith(
                    fontSize: getBigFontSize(context),
                    color: buttonColorPurple,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showPaymentMethodsSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(roundBorderRadius),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: getPadding(context) * 1.5,
                      vertical: getPadding(context),
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: buttonTextStyle(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountButton(BuildContext context, int amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedAmount = amount;
          _customAmount = '';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedAmount == amount ? Colors.white : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(
            color: _selectedAmount == amount ? buttonColorPurple : Colors.grey,
          ),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: getPadding(context) * 2),
      ),
      child: Text(
        'PKR $amount',
        style: interRegular.copyWith(
          fontSize: getFontSize(context),
          color: _selectedAmount == amount ? buttonColorPurple : Colors.black,
        ),
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
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Payment Method',
                  style: interBold.copyWith(fontSize: getBigFontSize(context)),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: getSpacing(context)),
            Text(
              'Saved Methods',
              style: interBold.copyWith(fontSize: getFontSize(context)),
            ),
            SizedBox(height: getSpacing(context)),
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
                      activeColor: buttonColorPurple,
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
                    IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {}),
                  ],
                ),
              );
            }).toList(),
            Divider(),
            Text(
              'Other Methods',
              style: interBold.copyWith(fontSize: getFontSize(context)),
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
