import 'package:app/Models/Products/Product_Card.dart';
import 'package:app/Models/Products/Single_Product.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Models/Products/Products.dart';

class ProductRepository {
  Future<AllProduct> fetchAllProducts(List<String> colors, List<String> ages,
      {String? nextPageUrl}) async {
    try {
      String agesQuery =
          ages.isNotEmpty ? ages.map((age) => "'$age'").join(', ') : '';
      String url = nextPageUrl ??
          '${baseUrl}all_products?&sizes=[$agesQuery]'; // Use nextPageUrl if provided

      print("Loading products with URL: $url");
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AllProduct.fromJson(data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch products: ${e.toString()}');
    }
  }

  Future<SingleProduct> fetchSingleproduct(int productId) async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}products/single/$productId'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SingleProduct.fromJson(data);
      } else {
        throw Exception('Failed to single product');
      }
    } catch (e) {
      throw Exception('Failed to fetch single product: ${e.toString()}');
    }
  }

  Future<String> addToCart(int productId, int quantity) async {
    try {
      final response = await http.post(Uri.parse('${baseUrl}cart/add'),
          body: {'id': productId.toString(), 'quantity': quantity.toString()},
          headers: {'Authorization': await getToken()});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'];
      } else {
        throw Exception('Failed to add to cart');
      }
    } catch (e) {
      throw Exception('Failed to add to cart: ${e.toString()}');
    }
  }

  Future<ListProductCard> fetchRecommendedProducts(int productId) async {
    try {
      final response = await http
          .get(Uri.parse('${baseUrl}products/related-products/$productId'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ListProductCard.fromJson(data);
      } else {
        throw Exception('Failed to recommended products');
      }
    } catch (e) {
      throw Exception('Failed to fetch recommended products: ${e.toString()}');
    }
  }

  Future<ListProductCard> fetchMostPopularProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}products/most-searching'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ListProductCard.fromJson(data);
      } else {
        throw Exception('Failed to most popular products');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch most popular products: ${e.toString()}');
    }
  }

  Future<ListProductCard> fetchBestSellingProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}products/best-sellings'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ListProductCard.fromJson(data);
      } else {
        throw Exception('Failed to best selling products');
      }
    } catch (e) {
      throw Exception('Failed to fetch best selling products: ${e.toString()}');
    }
  }

  Future<ListProductCard> fetchTopRatedProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${baseUrl}products/top-rated'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ListProductCard.fromJson(data);
      } else {
        throw Exception('Failed to top rated products');
      }
    } catch (e) {
      throw Exception('Failed to fetch top rated products: ${e.toString()}');
    }
  }
}
