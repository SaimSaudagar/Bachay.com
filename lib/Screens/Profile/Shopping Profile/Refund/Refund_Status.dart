import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';
import 'Return_Detail.dart';

class ProductReturnScreen extends StatelessWidget {
  final List<ReturnRequest> returnRequests;

  ProductReturnScreen({required this.returnRequests});

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
          'Product Return',
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
                    '24',
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
      body: ListView.builder(
        padding: EdgeInsets.all(getPadding(context)),
        itemCount: returnRequests.length,
        itemBuilder: (context, index) {
          final returnRequest = returnRequests[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReturnDetailsScreen(
                    refundStatus: returnRequest.status,
                    refundAmount: returnRequest.refundAmount,
                    refundMethod: returnRequest.refundMethod,
                    refundTime: returnRequest.refundTime,
                    attachedImage: returnRequest.attachedImage,
                    orderNo: returnRequest.orderNo,
                    requestedDate: returnRequest.requestedDate,
                    sellerName: returnRequest.sellerName,
                    productImageUrl: returnRequest.productImageUrl,
                    productTitle: returnRequest.productTitle,
                    productPrice: returnRequest.price,
                    productOriginalPrice: returnRequest.originalPrice,
                    productQuantity: returnRequest.quantity,
                    reason: returnRequest.reason,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: getSpacing(context) * 2),
              child: Card(
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
                              Text('Order No: ${returnRequest.orderNo}', style: interBold.copyWith(fontSize: getFontSize(context))),
                              Text('Initiated Refund on ${returnRequest.initiatedDate}', style: interRegular.copyWith(fontSize: getFontSize(context))),
                              if (returnRequest.status == 'Approved')
                                Text('Refunded on ${returnRequest.refundDate}', style: interRegular.copyWith(fontSize: getFontSize(context))),
                              if (returnRequest.status == 'Canceled')
                                Text('Refund Cancel', style: interRegular.copyWith(fontSize: getFontSize(context))),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: returnRequest.status == 'Approved' ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: returnRequest.status == 'Approved' ? Colors.green : Colors.red),
                            ),
                            child: Text(
                              returnRequest.status == 'Approved' ? 'Refund Approved' : 'Refund Canceled',
                              style: interBold.copyWith(
                                color: returnRequest.status == 'Approved' ? Colors.green : Colors.red,
                                fontSize: getFontSize(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getSpacing(context)),
                      Row(
                        children: [
                          Image.network(
                            returnRequest.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: getSpacing(context)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(returnRequest.title, style: interBold.copyWith(fontSize: getFontSize(context))),
                                Row(
                                  children: [
                                    Text('Rs. ${returnRequest.price}', style: TextStyle(color: buttonColorPurple, fontSize: getBigFontSize(context))),
                                    SizedBox(width: 4),
                                    Text('Rs. ${returnRequest.originalPrice}', style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: getFontSize(context))),
                                  ],
                                ),
                                Text('Quantity: ${returnRequest.quantity}', style: interRegular.copyWith(fontSize: getFontSize(context))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getSpacing(context)),
                      if (returnRequest.reason.isNotEmpty)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: Text(
                            'Reason: ${returnRequest.reason}',
                            style: interRegular.copyWith(fontSize: getFontSize(context), color: Colors.grey),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReturnRequest {
  final String orderNo;
  final String initiatedDate;
  final String refundDate;
  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;
  final int quantity;
  final String reason;
  final String status;
  final double refundAmount;
  final String refundMethod;
  final String refundTime;
  final String attachedImage;
  final String requestedDate;
  final String sellerName;
  final String productImageUrl;
  final String productTitle;
  final int productQuantity;

  ReturnRequest({
    required this.orderNo,
    required this.initiatedDate,
    required this.refundDate,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.reason,
    required this.status,
    required this.refundAmount,
    required this.refundMethod,
    required this.refundTime,
    required this.attachedImage,
    required this.requestedDate,
    required this.sellerName,
    required this.productImageUrl,
    required this.productTitle,
    required this.productQuantity,
  });
}
