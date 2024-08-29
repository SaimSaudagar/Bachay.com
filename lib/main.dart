import 'package:app/API/Bloc/Cart/Cart_Bloc.dart';
import 'package:app/API/Bloc/Order/Order_Bloc.dart';
import 'package:app/API/Bloc/Product/Product_Bloc.dart';
import 'package:app/API/Repository/Cart_Repo.dart';
import 'package:app/API/Repository/Order_Repo.dart';
import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/Screens/Home/Homepage.dart';
import 'package:app/Widgets/CP_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/Parenting/Feed/feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(cartRepository: CartRepository()),
        ),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(productRepository: ProductRepository()),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(orderRepository: OrderRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: Center(
          child: BouncingSvgLoader(
            svgAssetPath: 'assets/logo/progress_logo.svg',
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
