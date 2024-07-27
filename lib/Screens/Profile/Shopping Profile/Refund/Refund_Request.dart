import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';
import 'Refund_Status.dart';

class ReturnRequestScreen extends StatefulWidget {
  final String orderNo;
  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;
  final int quantity;
  final double totalPrice;

  const ReturnRequestScreen({super.key, 
    required this.orderNo,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  _ReturnRequestScreenState createState() => _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends State<ReturnRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedReason = '';
  bool _showReasonSelection = false;
  List<ReturnRequest> returnRequests = [];

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
          'Return Request (1/2)',
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.network(
                  widget.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  widget.title,
                  style: TextStyle(fontSize: getFontSize(context)),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rs. ${widget.price}  Rs. ${widget.originalPrice}'),
                    Text('Quantity: ${widget.quantity}'),
                    const Text('Total Order:'),
                    Text('Rs. ${widget.totalPrice}'),
                  ],
                ),
              ),
              SizedBox(height: getSpacing(context) * 4),
              _buildReasonButton(context),
              SizedBox(height: getSpacing(context) * 4),
              _buildUploadImagesButton(context),
              SizedBox(height: getSpacing(context) * 4),
              _buildCommentsField(context),
              SizedBox(height: getSpacing(context) * 4),
              Text('By submitting this form, I accepted the return Policy.', style: interRegular.copyWith(fontSize: getFontSize(context))),
              SizedBox(height: getSpacing(context) * 8),
              _buildTotalRefund(context),
              SizedBox(height: getSpacing(context) * 2),
              _buildContinueButton(context),
            ],
          ),
        ),
      ),
      bottomSheet: _showReasonSelection ? _buildReasonSelection(context) : const SizedBox.shrink(),
    );
  }

  Widget _buildReasonButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _showReasonSelection = true;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: const BorderSide(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(vertical: getPadding(context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _selectedReason.isEmpty ? 'Return Reason' : _selectedReason,
            style: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildUploadImagesButton(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.upload_file, size: 40, color: Colors.grey),
            Text('+ Upload Images', style: TextStyle(color: Colors.grey, fontSize: getFontSize(context))),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsField(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Let us know more...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  Widget _buildTotalRefund(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total Refund:', style: interBold.copyWith(fontSize: getBigFontSize(context))),
        Text('Rs. ${widget.totalPrice}', style: interBold.copyWith(fontSize: getBigFontSize(context), color: buttonColorPurple)),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_selectedReason.isNotEmpty) {
          returnRequests.add(ReturnRequest(
            orderNo: widget.orderNo,
            initiatedDate: '02 Jun 2024, 20:14:56',
            refundDate: '',
            imageUrl: widget.imageUrl,
            title: widget.title,
            price: widget.price,
            originalPrice: widget.originalPrice,
            quantity: widget.quantity,
            reason: _selectedReason,
            status: 'Pending',
            refundAmount: widget.totalPrice,
            refundMethod: 'Wallet',
            refundTime: 'Up to 2 Working Days',
            attachedImage: 'Image',
            requestedDate: '11 Apr 2023',
            sellerName: 'Bachay.com',
            productImageUrl: widget.imageUrl,
            productTitle: widget.title,
            productQuantity: widget.quantity,
          ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductReturnScreen(returnRequests: returnRequests)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a return reason.')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColorPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.symmetric(vertical: getPadding(context)),
      ),
      child: Text('Continue', style: buttonTextStyle(context)),
    );
  }

  Widget _buildReasonSelection(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(getPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Return Reason', style: interBold.copyWith(fontSize: getBigFontSize(context))),
          SizedBox(height: getSpacing(context)),
          Text('Please select return reason accurately so the customer service team can assist you better.', style: interRegular.copyWith(fontSize: getFontSize(context))),
          ...[
            'Item is defective or not working.',
            'Component or accessory is missing from the item.',
            'Item is damaged/broken/has dent or scratches.',
            'Item has missing freebie.',
            'Item does not match description or picture.',
            'I did not order this size.',
            'I received wrong item.'
          ].map((reason) => RadioListTile<String>(
                title: Text(reason, style: interRegular.copyWith(fontSize: getFontSize(context))),
                value: reason,
                groupValue: _selectedReason,
                onChanged: (value) {
                  setState(() {
                    _selectedReason = value!;
                    _showReasonSelection = false;
                  });
                },
              )),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showReasonSelection = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              padding: EdgeInsets.symmetric(vertical: getPadding(context)),
            ),
            child: Center(
              child: Text('Confirm', style: buttonTextStyle(context).copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
