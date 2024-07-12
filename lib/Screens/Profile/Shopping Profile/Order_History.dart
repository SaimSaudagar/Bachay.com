import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';
import 'Order_Details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderHistoryScreen(),
    );
  }
}

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Order History',
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: buttonColorPurple,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'To Pay'),
            Tab(text: 'To Ship'),
            Tab(text: 'To Receive'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OrderListView(),
          Center(child: Text('To Pay Orders')),
          Center(child: Text('To Ship Orders')),
          Center(child: Text('To Receive Orders')),
        ],
      ),
    );
  }
}

class OrderListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(getPadding(context)),
      children: [
        OrderCard(
          orderNo: '01254547',
          placedDate: '02 Jun 2024, 20:14:56',
          paidDate: '07 Jun 2024, 18:04:56',
          statuses: ['Paid', 'Delivered'],
          imageUrl: 'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg',
          title: 'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve Shirt',
          price: 850,
          originalPrice: 3999,
          quantity: 1,
          totalPrice: 850,
        ),
        SizedBox(height: getSpacing(context)),
        OrderCard(
          orderNo: '0855547',
          placedDate: '02 Jun 2024, 20:14:56',
          paidDate: '07 Jun 2024, 18:04:56',
          statuses: ['Unpaid', 'Processing'],
          imageUrl: 'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg',
          title: 'BUMZEE Interlock Half Sleeves Star Printed Tee & Shorts Set With Suspender - Beige & Navy Blue',
          price: 257,
          originalPrice: 3999,
          quantity: 4,
          totalPrice: 1445,
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
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

  OrderCard({
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailScreen(
              orderNo: orderNo,
              placedDate: placedDate,
              paidDate: paidDate,
              statuses: statuses,
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
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  SizedBox(width: 8),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Order:', style: interBold.copyWith(fontSize: getFontSize(context))),
                            Text('Rs. $totalPrice', style: interBold.copyWith(fontSize: getBigFontSize(context), color: buttonColorPurple)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getSpacing(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.grey.withOpacity(0.5),
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('Return Product', style: buttonTextStyle(context)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColorPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('Buy Again', style: buttonTextStyle(context)),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
}
