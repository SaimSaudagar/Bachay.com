// import 'package:flutter/material.dart';
// import '../../../Utils/app_constants.dart';

// class OrderDetailScreen extends StatelessWidget {
//   final String orderNo;
//   final String placedDate;
//   final String paidDate;
//   final List<String> statuses;
//   final String imageUrl;
//   final String title;
//   final double price;
//   final double originalPrice;
//   final int quantity;
//   final double totalPrice;

//   OrderDetailScreen({
//     required this.orderNo,
//     required this.placedDate,
//     required this.paidDate,
//     required this.statuses,
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.originalPrice,
//     required this.quantity,
//     required this.totalPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Order Details',
//           style: TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
//         ),
//         actions: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.notifications, color: Colors.black),
//                 onPressed: () {},
//               ),
//               Positioned(
//                 right: 10,
//                 top: 10,
//                 child: Container(
//                   padding: EdgeInsets.all(1),
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   constraints: BoxConstraints(
//                     minWidth: 12,
//                     minHeight: 12,
//                   ),
//                   child: Text(
//                     '02',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: getFontSize(context),
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(getPadding(context)),
//         child: ListView(
//           children: [
//             SizedBox(height: getSpacing(context)),
//             Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
//               child: Padding(
//                 padding: EdgeInsets.all(getPadding(context)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset('assets/images/cash.png'),
//                         SizedBox(width: getSpacing(context)),
//                         Text('Cash on Delivery', style: interBold.copyWith(fontSize: getFontSize(context))),
//                       ],
//                     ),
//                     Divider(),
//                     Text('Talha Ahmed', style: interBold.copyWith(fontSize: getFontSize(context))),
//                     SizedBox(width: getSpacing(context)),
//                     Text('03048987785', style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey)),
//                     SizedBox(height: getSpacing(context)),
//                     Text('Street No 05, Sector 19', style: interRegular.copyWith(fontSize: getFontSize(context))),
//                     Text('Karachi – Clifton, Sindh, Pakistan', style: interRegular.copyWith(fontSize: getFontSize(context))),
//                     Divider(),
//                     Text('Standard Shipping', style: interBold.copyWith(fontSize: getFontSize(context))),
//                     Text('Rs. 150 (Estimated time Jun 19 - Jun 24)', style: interRegular.copyWith(fontSize: getFontSize(context))),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: getSpacing(context)),
//             Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
//               child: Padding(
//                 padding: EdgeInsets.all(getPadding(context)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Order No: $orderNo', style: interBold.copyWith(fontSize: getFontSize(context))),
//                             Text('Placed on $placedDate', style: interRegular.copyWith(fontSize: getFontSize(context))),
//                             Text('Paid on $paidDate', style: interRegular.copyWith(fontSize: getFontSize(context))),
//                           ],
//                         ),
//                         Row(
//                           children: statuses.map((status) => _buildStatusChip(status, context)).toList(),
//                         ),
//                       ],
//                     ),
//                     Divider(),
//                     Row(
//                       children: [
//                         Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
//                         SizedBox(width: getSpacing(context)),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(title, style: interBold.copyWith(fontSize: getFontSize(context))),
//                               Row(
//                                 children: [
//                                   Text('Rs. $price', style: TextStyle(color: buttonColorPurple, fontSize: getBigFontSize(context))),
//                                   SizedBox(width: 4),
//                                   Text('Rs. $originalPrice', style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: getFontSize(context))),
//                                 ],
//                               ),
//                               Text('Quantity: $quantity', style: interRegular.copyWith(fontSize: getFontSize(context))),
//                             ],
//                           ),
//                         ),
//                         Icon(Icons.support, color: Colors.grey),
//                       ],
//                     ),
//                     SizedBox(height: getSpacing(context)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.black, backgroundColor: Colors.white,
//                               side: BorderSide(color: Colors.black),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//                               padding: EdgeInsets.symmetric(vertical: getSpacing(context), horizontal: getPadding(context)),
//                             ),
//                             child: Text('Return Product', style: buttonTextStyle(context).copyWith(color: Colors.black)),
//                           ),
//                         ),
//                         SizedBox(width: getSpacing(context)),
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.orange,
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//                               padding: EdgeInsets.symmetric(vertical: getSpacing(context), horizontal: getPadding(context)),
//                             ),
//                             child: Text('Review Product', style: buttonTextStyle(context)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: getSpacing(context)),
//             Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
//               child: Padding(
//                 padding: EdgeInsets.all(getPadding(context)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildOrderSummaryRow('Subtotal:', 'Rs. $totalPrice', context),
//                     _buildOrderSummaryRow('Coupon Code: FIRSTORDER1', '- Rs. 180', context, isCoupon: true),
//                     _buildOrderSummaryRow('Delivery Fee:', 'FREE', context, isDelivery: true),
//                     Divider(),
//                     _buildOrderSummaryRow('Total Order:', 'Rs. ${totalPrice - 180}', context, isTotal: true),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatusChip(String status, BuildContext context) {
//     Color color;
//     switch (status) {
//       case 'Paid':
//         color = Colors.green;
//         break;
//       case 'Delivered':
//         color = buttonColorPurple;
//         break;
//       case 'Unpaid':
//         color = Colors.red;
//         break;
//       case 'Processing':
//         color = Colors.orange;
//         break;
//       default:
//         color = Colors.grey;
//     }
//     return Container(
//       margin: EdgeInsets.only(left: 4),
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(borderRadius),
//         border: Border.all(color: color),
//       ),
//       child: Text(status, style: TextStyle(color: color, fontSize: getFontSize(context), fontWeight: FontWeight.bold)),
//     );
//   }

//   Widget _buildOrderSummaryRow(String label, String value, BuildContext context, {bool isCoupon = false, bool isDelivery = false, bool isTotal = false}) {
//     Color valueColor = Colors.black;
//     TextDecoration? decoration;

//     if (isCoupon) {
//       valueColor = Colors.red;
//     } else if (isDelivery) {
//       valueColor = Colors.green;
//       decoration = TextDecoration.lineThrough;
//     } else if (isTotal) {
//       valueColor = buttonColorPurple;
//     }

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: interBold.copyWith(fontSize: getFontSize(context))),
//           Text(
//             value,
//             style: TextStyle(color: valueColor, decoration: decoration, fontSize: getFontSize(context)),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'Refund/Refund_Request.dart';
import '../../../Utils/app_constants.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderNo;
  final String placedDate;
  final String paidDate;
  final List<String> statuses;
  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;
  final int quantity;
  final double totalPrice;

  OrderDetailScreen({
    required this.orderNo,
    required this.placedDate,
    required this.paidDate,
    required this.statuses,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Order Details',
          style: TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
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
            SizedBox(height: getSpacing(context)),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              child: Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/cash.png'),
                        SizedBox(width: getSpacing(context)),
                        Text('Cash on Delivery', style: interBold.copyWith(fontSize: getFontSize(context))),
                      ],
                    ),
                    Divider(),
                    Text('Talha Ahmed', style: interBold.copyWith(fontSize: getFontSize(context))),
                    SizedBox(width: getSpacing(context)),
                    Text('03048987785', style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey)),
                    SizedBox(height: getSpacing(context)),
                    Text('Street No 05, Sector 19', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    Text('Karachi – Clifton, Sindh, Pakistan', style: interRegular.copyWith(fontSize: getFontSize(context))),
                    Divider(),
                    Text('Standard Shipping', style: interBold.copyWith(fontSize: getFontSize(context))),
                    Text('Rs. 150 (Estimated time Jun 19 - Jun 24)', style: interRegular.copyWith(fontSize: getFontSize(context))),
                  ],
                ),
              ),
            ),
            SizedBox(height: getSpacing(context)),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              child: Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order No: $orderNo', style: interBold.copyWith(fontSize: getFontSize(context))),
                            Text('Placed on $placedDate', style: interRegular.copyWith(fontSize: getFontSize(context))),
                            Text('Paid on $paidDate', style: interRegular.copyWith(fontSize: getFontSize(context))),
                          ],
                        ),
                        Row(
                          children: statuses.map((status) => _buildStatusChip(status, context)).toList(),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                        SizedBox(width: getSpacing(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: interBold.copyWith(fontSize: getFontSize(context))),
                              Row(
                                children: [
                                  Text('Rs. $price', style: TextStyle(color: buttonColorPurple, fontSize: getBigFontSize(context))),
                                  SizedBox(width: 4),
                                  Text('Rs. $originalPrice', style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: getFontSize(context))),
                                ],
                              ),
                              Text('Quantity: $quantity', style: interRegular.copyWith(fontSize: getFontSize(context))),
                            ],
                          ),
                        ),
                        Icon(Icons.support, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: getSpacing(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReturnRequestScreen(
                                    orderNo: orderNo,
                                    imageUrl: imageUrl,
                                    title: title,
                                    price: price,
                                    originalPrice: originalPrice,
                                    quantity: quantity,
                                    totalPrice: totalPrice,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black, backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                              padding: EdgeInsets.symmetric(vertical: getSpacing(context), horizontal: getPadding(context)),
                            ),
                            child: Text('Return Product', style: buttonTextStyle(context).copyWith(color: Colors.black)),
                          ),
                        ),
                        SizedBox(width: getSpacing(context)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                              padding: EdgeInsets.symmetric(vertical: getSpacing(context), horizontal: getPadding(context)),
                            ),
                            child: Text('Review Product', style: buttonTextStyle(context)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getSpacing(context)),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              child: Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderSummaryRow('Subtotal:', 'Rs. $totalPrice', context),
                    _buildOrderSummaryRow('Coupon Code: FIRSTORDER1', '- Rs. 180', context, isCoupon: true),
                    _buildOrderSummaryRow('Delivery Fee:', 'FREE', context, isDelivery: true),
                    Divider(),
                    _buildOrderSummaryRow('Total Order:', 'Rs. ${totalPrice - 180}', context, isTotal: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status, BuildContext context) {
    Color color;
    switch (status) {
      case 'Paid':
        color = Colors.green;
        break;
      case 'Delivered':
        color = buttonColorPurple;
        break;
      case 'Unpaid':
        color = Colors.red;
        break;
      case 'Processing':
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
      margin: EdgeInsets.only(left: 4),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: color),
      ),
      child: Text(status, style: TextStyle(color: color, fontSize: getFontSize(context), fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildOrderSummaryRow(String label, String value, BuildContext context, {bool isCoupon = false, bool isDelivery = false, bool isTotal = false}) {
    Color valueColor = Colors.black;
    TextDecoration? decoration;

    if (isCoupon) {
      valueColor = Colors.red;
    } else if (isDelivery) {
      valueColor = Colors.green;
      decoration = TextDecoration.lineThrough;
    } else if (isTotal) {
      valueColor = buttonColorPurple;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: interBold.copyWith(fontSize: getFontSize(context))),
          Text(
            value,
            style: TextStyle(color: valueColor, decoration: decoration, fontSize: getFontSize(context)),
          ),
        ],
      ),
    );
  }
}
