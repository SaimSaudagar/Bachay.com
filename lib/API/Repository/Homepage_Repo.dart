import 'dart:convert';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  // Future<BannerList> fetchBanners() async {
  //   final url = Uri.parse('https://bachay.com/api/v1/main_banner/');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);

  //     return BannerList.fromJson(data);
  //   } else {
  //     throw Exception('Failed to load banners');
  //   }
  // }

  Future<BannerList> fetchBanners() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Hardcoded data
    return BannerList(mainBanner: [
      MainBanner(
          id: 23,
          photo:
              "https://bachay.com/storage/app/public/banner/2024-03-20-65fa694231da7.webp",
          mobilePhoto: "https://bachay.com/storage/app/public/banner",
          bannerType: "Main Banner",
          theme: "theme_fashion",
          published: 1,
          createdAt: DateTime.parse("2024-03-20T04:42:42.000000Z"),
          updatedAt: DateTime.parse("2024-04-29T06:08:56.000000Z"),
          url:
              "https://bachay.com/storage/app/public/banner/2024-03-20-65fa694231da7.webp",
          resourceType: "product",
          resourceId: 1,
          title: "#F9F5FD",
          backgroundColor: "#f9f5fd"),
      MainBanner(
          id: 22,
          photo:
              "https://bachay.com/storage/app/public/banner/2024-03-13-65f17cc7eecb9.webp",
          mobilePhoto: "https://bachay.com/storage/app/public/banner",
          bannerType: "Main Banner",
          theme: "theme_fashion",
          published: 1,
          createdAt: DateTime.parse("2024-03-13T10:15:36.000000Z"),
          updatedAt: DateTime.parse("2024-04-19T07:36:06.000000Z"),
          url:
              "https://bachay.com/storage/app/public/banner/2024-03-13-65f17cc7eecb9.webp",
          resourceType: "product",
          resourceId: 1,
          title: "#C5EBE0",
          subTitle: "Discover Endless Possibilities at 6valley",
          buttonText: "Shop Now",
          backgroundColor: "#c5ebe0"),
      MainBanner(
          id: 21,
          photo:
              "https://bachay.com/storage/app/public/banner/2024-03-13-65f17c655823d.webp",
          mobilePhoto: "https://bachay.com/storage/app/public/banner",
          bannerType: "Main Banner",
          theme: "theme_fashion",
          published: 1,
          createdAt: DateTime.parse("2024-03-13T10:13:57.000000Z"),
          updatedAt: DateTime.parse("2024-04-19T07:36:33.000000Z"),
          url:
              "https://bachay.com/storage/app/public/banner/2024-03-13-65f17c655823d.webp",
          resourceType: "product",
          resourceId: 1,
          title: "dsdsd",
          subTitle: "Discover Endless Possibilities at 6valley",
          buttonText: "Shop Now",
          backgroundColor: "#e5f7fb"),
      MainBanner(
          id: 20,
          photo:
              "https://bachay.com/storage/app/public/banner/2024-03-13-65f17bfe2c4c5.webp",
          mobilePhoto: "https://bachay.com/storage/app/public/banner",
          bannerType: "Main Banner",
          theme: "theme_fashion",
          published: 1,
          createdAt: DateTime.parse("2024-03-13T10:12:14.000000Z"),
          updatedAt: DateTime.parse("2024-04-19T07:36:48.000000Z"),
          url:
              "https://bachay.com/storage/app/public/banner/2024-03-13-65f17bfe2c4c5.webp",
          resourceType: "product",
          resourceId: 1,
          title: "HBJN",
          subTitle: "Browse, Click, and Transform Your World Today",
          buttonText: "Shop Now",
          backgroundColor: "#f9f5fd")
    ]);
  }

  final String _baseUrl = 'https://bachay.com/api/v1/categories-list/';

  Future<CategoryList> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
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
}
