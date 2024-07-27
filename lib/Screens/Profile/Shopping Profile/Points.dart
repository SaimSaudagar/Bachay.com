import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PointsAppBar(),
      body: Column(
        children: [
          PointsSummary(),
          TabBarWidget(),
          Expanded(child: TransactionList()),
        ],
      ),
    );
  }
}

class PointsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PointsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: Text('Points', style: interBold.copyWith(fontSize: getBigFontSize(context))),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            Positioned(
              right: 11,
              top: 11,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: const Text(
                  '02',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class PointsSummary extends StatelessWidget {
  const PointsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      margin: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/points.png', 
                width: getFontSize(context) * 4,
                height: getFontSize(context) * 4,
              ),
              SizedBox(width: getSpacing(context) * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Points', style: interBold.copyWith(fontSize: getFontSize(context))),
                  Text('2500', style: interBold.copyWith(fontSize: getBigFontSize(context))),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/currency.png', 
                width: getFontSize(context) * 3,
                height: getFontSize(context) * 3,
              ),
              Text('Rs. 25', style: interBold.copyWith(fontSize: getFontSize(context))),
            ],
          ),
        ],
      ),
    );
  }
}

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
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
    return TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: buttonColorPurple,
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'Earned'),
        Tab(text: 'Used'),
        Tab(text: 'Expired'),
      ],
    );
  }
}

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(getPadding(context)),
      children: const [
        TransactionItem(
          imagePath: 'assets/images/purchase.png',
          type: 'Purchase',
          date: '23:02, May 14 2024',
          points: '+240',
          status: 'Earned',
          color: Colors.green,
        ),
        TransactionItem(
          imagePath: 'assets/images/converted.png',
          type: 'Converted',
          date: '23:02, May 14 2024',
          points: '-1500',
          status: 'Subtract',
          color: Colors.red,
        ),
        TransactionItem(
          imagePath: 'assets/images/promotions.png',
          type: 'Promotions',
          date: '23:02, May 14 2024',
          points: '+150',
          status: 'Expired',
          color: Colors.grey,
        ),
        TransactionItem(
          imagePath: 'assets/images/converted.png',
          type: 'Converted',
          date: '23:02, May 14 2024',
          points: '-1500',
          status: 'Subtract',
          color: Colors.red,
        ),
        TransactionItem(
          imagePath: 'assets/images/promotions.png',
          type: 'Promotions',
          date: '23:02, May 14 2024',
          points: '+150',
          status: 'Expired',
          color: Colors.grey,
        ),
        TransactionItem(
          imagePath: 'assets/images/purchase.png',
          type: 'Purchase',
          date: '23:02, May 14 2024',
          points: '+240',
          status: 'Earned',
          color: Colors.green,
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String imagePath;
  final String type;
  final String date;
  final String points;
  final String status;
  final Color color;

  const TransactionItem({super.key, 
    required this.imagePath,
    required this.type,
    required this.date,
    required this.points,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getSpacing(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: getFontSize(context) * 2,
                height: getFontSize(context) * 2,
              ),
              SizedBox(width: getSpacing(context) * 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type, style: interBold.copyWith(fontSize: getFontSize(context))),
                  Text(date, style: interRegular.copyWith(fontSize: getFontSize(context) * 0.8, color: Colors.grey)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(points, style: interBold.copyWith(fontSize: getFontSize(context), color: color)),
              Text(status, style: interRegular.copyWith(fontSize: getFontSize(context) * 0.8, color: color)),
            ],
          ),
        ],
      ),
    );
  }
}
