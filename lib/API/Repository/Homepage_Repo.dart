import 'dart:convert';
import 'package:app/Models/Home/Alert_Banner.dart';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Deal_Banner.dart';
import 'package:app/Models/Home/Dsicount_Banner.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'package:app/Models/Home/Season_Banner.dart';
import 'package:app/Models/Home/Trends.dart';
import 'package:http/http.dart' as http;
import 'package:app/Utils/app_constants.dart';

class HomeRepository {
  Future<DiscountBannerList> fetchDiscountBanner() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}custom_page/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DiscountBannerList.fromJson(data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to fetch discount banner: ${e.toString()}');
    }
  }

  Future<BannerList> fetchBanners() async {
    final response = await http.get(Uri.parse('${baseUrl}main_banner/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return BannerList.fromJson(data);
    } else {
      throw Exception('Failed to load banners');
    }
  }

  Future<AlertBannerList> fetchAlertPromoBanners() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}promo-alert-banner/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AlertBannerList.fromJson(data);
      } else {
        throw Exception('Failed to load alert banners');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch alert banner: ${e.toString()}');
    }
  }

  Future<DealBannerList> fetchDealPromoBanners() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}promo-deal-banner/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return DealBannerList.fromJson(data);
      } else {
        throw Exception('Failed to load deal banners');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch deal banner: ${e.toString()}');
    }
  }

  Future<SeasonBannerList> fetchSeasonBanners() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}promo-season-banner/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SeasonBannerList.fromJson(data);
      } else {
        throw Exception('Failed to load season banners');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch season banner: ${e.toString()}');
    }
  }

  Future<CategoryList> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}categories-list/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return CategoryList.fromJson(data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to fetch categories: ${e.toString()}');
    }
  }

  Future<FeaturedProductList> fetchFeaturedProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}featured_products/'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return FeaturedProductList.fromJson(data);
      } else {
        throw Exception('Failed to featured products');
      }
    } catch (e) {
      throw Exception('Failed to featured products: ${e.toString()}');
    }
  }

  Future<TrendsBannerList> fetchTrendsBanner() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}trends-banner'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return TrendsBannerList.fromJson(data);
      } else {
        throw Exception('Failed to trends banner');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to trends banner: ${e.toString()}');
    }
  }
}
