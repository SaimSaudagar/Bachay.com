import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CouponScreen(),
    );
  }
}

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Coupons',
            style: interBold.copyWith(fontSize: getFontSize(context) * 2)),
      ),
      body: Column(
        children: [
          const TabBarWidget(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nothing.png',
                    width: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.grey,
                  ),
                  SizedBox(height: getSpacing(context) * 20),
                  Text(
                    'Nothing Here Available',
                    style: interRegular.copyWith(
                      fontSize: getBigFontSize(context),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
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

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        Tab(text: 'Unused'),
        Tab(text: 'Used'),
        Tab(text: 'Expired'),
      ],
    );
  }
}
