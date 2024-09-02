import 'package:app/API/Bloc/Order/Order_Bloc.dart';
import 'package:app/API/Bloc/Order/Order_Event.dart';
import 'package:app/API/Bloc/Order/Order_State.dart';
import 'package:app/API/Repository/Order_Repo.dart';
import 'package:app/Models/Order/Order_List.dart';
import 'package:app/Screens/Profile/Shopping%20Profile/Refund/Refund_Request.dart';
import 'package:app/Screens/Profile/Shopping%20Profile/Refund/Refund_Status.dart';
import 'package:app/Widgets/CP_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Utils/app_constants.dart';
import 'Order_Details.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>
    with SingleTickerProviderStateMixin {
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Order History',
          style:
              TextStyle(color: Colors.black, fontSize: getBigFontSize(context)),
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: buttonColorPurple,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
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
          orderListView(),
          Center(child: Text('To Pay Orders')),
          Center(child: Text('To Ship Orders')),
          Center(child: Text('To Receive Orders')),
        ],
      ),
    );
  }
}

Widget orderListView() {
  return BlocProvider(
    create: (context) =>
        OrderBloc(orderRepository: OrderRepository())..add(AllOrder()),
    child: BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is AllOrderLoading) {
          return const Center(
            child: BouncingSvgLoader(
              svgAssetPath: 'assets/logo/progress_logo.svg',
              size: 100.0,
            ),
          );
        } else if (state is AllOrderLoaded) {
          return buildOrderListView(context, state.orderList);
        } else if (state is AllOrderError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    ),
  );
}

Widget buildOrderListView(BuildContext context, OrderList orderList) {
  return ListView.builder(
    padding: EdgeInsets.all(getPadding(context)),
    itemCount: orderList.orders.length,
    itemBuilder: (context, index) {
      final order = orderList.orders[index];
      final orderDetail = order.details.first;

      return Column(
        children: [
          OrderCard(
            orderNo: order.id.toString(),
            placedDate: order.createdAt!,
            paidDate: order.updatedAt!,
            statuses: [order.paymentStatus!, order.orderStatus!],
            imageUrl: orderDetail.product.thumbnail!,
            title: orderDetail.product.name!,
            price: orderDetail.price,
            originalPrice: orderDetail.product.unitPrice.toDouble(),
            quantity: orderDetail.qty,
            totalPrice: order.orderAmount.toDouble(),
          ),
          SizedBox(height: getSpacing(context)),
        ],
      );
    },
  );
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

  const OrderCard({
    super.key,
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
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
                      Text('Order No: $orderNo',
                          style: interBold.copyWith(
                              fontSize: getFontSize(context))),
                      Text('Placed on $placedDate',
                          style: interRegular.copyWith(
                              fontSize: getFontSize(context))),
                      Text('Paid on $paidDate',
                          style: interRegular.copyWith(
                              fontSize: getFontSize(context))),
                    ],
                  ),
                  Row(
                    children: statuses
                        .map((status) => _buildStatusChip(status, context))
                        .toList(),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    height: 10,
                    child: Image.network(imageUrl,
                        width: 10, height: 10, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: interBold.copyWith(
                                fontSize: getFontSize(context))),
                        Row(
                          children: [
                            Text('Rs. $price',
                                style: TextStyle(
                                    color: buttonColorPurple,
                                    fontSize: getBigFontSize(context))),
                            const SizedBox(width: 4),
                            Text('Rs. $originalPrice',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: getFontSize(context))),
                          ],
                        ),
                        Text('Quantity: $quantity',
                            style: interRegular.copyWith(
                                fontSize: getFontSize(context))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Order:',
                                style: interBold.copyWith(
                                    fontSize: getFontSize(context))),
                            Text('Rs. $totalPrice',
                                style: interBold.copyWith(
                                    fontSize: getBigFontSize(context),
                                    color: buttonColorPurple)),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReturnRequestScreen(
                                      orderNo: orderNo,
                                      imageUrl: imageUrl,
                                      title: title,
                                      price: price,
                                      quantity: quantity,
                                      totalPrice: totalPrice,
                                      originalPrice: originalPrice,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('Return Product',
                          style: buttonTextStyle(context)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColorPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
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
      margin: const EdgeInsets.only(left: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: color),
      ),
      child: Text(status,
          style: TextStyle(
              color: color,
              fontSize: getFontSize(context),
              fontWeight: FontWeight.bold)),
    );
  }
}
