import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';

class ReturnDetailsScreen extends StatelessWidget {
  final String refundStatus;
  final double refundAmount;
  final String refundMethod;
  final String refundTime;
  final String attachedImage;
  final String orderNo;
  final String requestedDate;
  final String sellerName;
  final String productImageUrl;
  final String productTitle;
  final double productPrice;
  final double productOriginalPrice;
  final int productQuantity;
  final String reason;

  ReturnDetailsScreen({
    required this.refundStatus,
    required this.refundAmount,
    required this.refundMethod,
    required this.refundTime,
    required this.attachedImage,
    required this.orderNo,
    required this.requestedDate,
    required this.sellerName,
    required this.productImageUrl,
    required this.productTitle,
    required this.productPrice,
    required this.productOriginalPrice,
    required this.productQuantity,
    required this.reason,
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
          'Return Details',
          style: TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    refundStatus == 'Canceled' ? 'assets/images/cancelled.png' : 'assets/images/approved.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: getSpacing(context) * 8),
                  Text(
                    'Refund $refundStatus.',
                    style: TextStyle(fontSize: getBigFontSize(context), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: getSpacing(context) * 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatusIndicator(context, 'Initiated', Colors.purple, true),
                        _buildConnectorLine(context, isActive: true),
                        _buildStatusIndicator(context, 'Processing', Colors.purple, refundStatus == 'Processing' || refundStatus == 'Approved'),
                        _buildConnectorLine(context, isActive: refundStatus == 'Processing' || refundStatus == 'Approved'),
                        _buildStatusIndicator(context, 'Canceled', Colors.red, refundStatus == 'Canceled'),
                      ],
                    ),
                  ),
                  SizedBox(height: getSpacing(context) * 8),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(getPadding(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thanks you for choosing.',
                            style: TextStyle(fontSize: getFontSize(context), fontWeight: FontWeight.bold),
                          ),
                          _buildDetailItem(context, 'Refund Amount:', 'Rs. ${refundAmount.toString()}', Icons.info_outline),
                          _buildDetailItem(context, 'Refund Method:', refundMethod, Icons.info_outline, iconData: Icons.account_balance_wallet, iconColor: Colors.purple),
                          _buildDetailItem(context, 'Refund Time:', refundTime, Icons.access_time),
                          _buildDetailItem(context, 'Attached Image:', attachedImage, Icons.image),
                          SizedBox(height: getSpacing(context) * 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Track Progress'),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                              padding: buttonPadding,
                              textStyle: buttonTextStyle(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 8),
            _buildProductDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(BuildContext context, String status, Color color, bool isActive) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: BoxDecoration(
            color: isActive ? color : Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: getFontSize(context),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConnectorLine(BuildContext context, {required bool isActive}) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.purple : Colors.grey,
        margin: EdgeInsets.symmetric(horizontal: getSpacing(context)),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String title, String value, IconData trailingIcon, {IconData? iconData, Color? iconColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSpacing(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: getFontSize(context), color: Colors.grey),
              ),
              Icon(
                trailingIcon,
                size: getFontSize(context),
                color: Colors.grey,
              ),
            ],
          ),
          Row(
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  size: getFontSize(context),
                  color: iconColor,
                ),
              Text(
                value,
                style: TextStyle(fontSize: getFontSize(context), color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Details', style: TextStyle(fontSize: getBigFontSize(context), fontWeight: FontWeight.bold)),
            SizedBox(height: getSpacing(context) * 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network(
                productImageUrl,
                width: getSpacing(context) * 10,
                height: getSpacing(context) * 10,
                fit: BoxFit.cover,
              ),
              title: Text(productTitle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rs. $productPrice  Rs. $productOriginalPrice'),
                  Text('Quantity: $productQuantity'),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 8),
            Text('Order No: $orderNo'),
            Text('Requested Date: $requestedDate'),
            Text('Seller Name: $sellerName'),
            Text('Reason: $reason'),
          ],
        ),
      ),
    );
  }
}
