import 'package:app/API/Bloc/Articles/Articles_Bloc.dart';
import 'package:app/API/Bloc/Cart/Cart_Bloc.dart';
import 'package:app/API/Bloc/Login/Login_Bloc.dart';
import 'package:app/API/Bloc/Order/Order_Bloc.dart';
import 'package:app/API/Bloc/Product/Product_Bloc.dart';
import 'package:app/API/Bloc/Profile/Profile_Bloc.dart';
import 'package:app/API/Repository/Cart_Repo.dart';
import 'package:app/API/Repository/Order_Repo.dart';
import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/API/Repository/Profile_Repo.dart';
import 'package:app/Screens/Authentication/Login_Screen.dart';
import 'package:app/Screens/Home/Homepage.dart';
import 'package:app/Screens/Onboarding/Loading_Screen.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:app/Widgets/CP_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'API/Bloc/Articles/Articles_Event.dart';
import 'API/Bloc/Quiz/Quiz_Bloc.dart';
import 'API/Repository/Articles_Repo.dart';
import 'API/Repository/Quiz_Repo.dart';
import 'Screens/Parenting/Feed/Feed.dart';
import 'Screens/Parenting/Parenting.dart';
import 'Screens/Quiz/Quiz_Home.dart';
import 'package:app/API/Repository/Login_Repo.dart';

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
        BlocProvider<QuizCategoryBloc>(
            create: (context) => QuizCategoryBloc(QuizCategoryRepository())),
        BlocProvider<QuizBannerBloc>(
            create: (context) => QuizBannerBloc(QuizBannerRepository())),
        BlocProvider<LatestArticleBloc>(
            create: (context) => LatestArticleBloc(LatestArticlesRepository())
              ..add(FetchLatestArticles())),
        BlocProvider<ArticleBloc>(
            create: (context) =>
                ArticleBloc(ArticleRepository())..add(FetchArticles())),
        BlocProvider<ProductBloc>(
          create: (context) =>
              ProductBloc(productRepository: ProductRepository()),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(orderRepository: OrderRepository()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginRepository: LoginRepository()),
        ),
        BlocProvider(
          create: (context) => ArticleCategoryBloc(
            repository: ArticleCategoryRepository(),
          ),
        ),
        BlocProvider(
            create: (context) => ArticleByCategoryBloc(
                  repository: ArticleByCategoryRepository(),
                )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        // home: BouncingSvgLoader(
        //   svgAssetPath: 'assets/logo/progress_logo.svg',
        //   size: 10.0,
        // ),
        home: mainPage(),
      ),
    );
  }

  FutureBuilder<String> mainPage() {
    return FutureBuilder(
      future: getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
