class ListProductCard {
  final List<ProductCard> products;

  ListProductCard({
    required this.products,
  });

  factory ListProductCard.fromJson(List<dynamic> json) {
    List<ProductCard> products = [];
    products = json.map((product) => ProductCard.fromJson(product)).toList();

    return ListProductCard(
      products: products,
    );
  }

  List<Map<String, dynamic>> toJson() {
    return products.map((product) => product.toJson()).toList();
  }
}

class ProductCard {
  final int id;
  final String name;
  final List<String> images;
  final String thumbnail;
  final double unitPrice;
  final int discount;
  final String discountType;
  final double netPrice;
  final String rating;
  final dynamic? sold;
  final bool freeShipping;

  ProductCard({
    required this.id,
    required this.name,
    required this.images,
    required this.thumbnail,
    required this.unitPrice,
    required this.discount,
    required this.discountType,
    required this.netPrice,
    required this.rating,
    this.sold,
    required this.freeShipping,
  });

  factory ProductCard.fromJson(Map<String, dynamic> json) {
    return ProductCard(
      id: json['id'],
      name: json['name'],
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
      unitPrice: json['unit_price'].toDouble(),
      discount: json['discount'],
      discountType: json['discount_type'],
      netPrice: json['net_price'].toDouble(),
      rating: json['rating'],
      sold: json['sold'],
      freeShipping: json['free_shipping'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'thumbnail': thumbnail,
      'unit_price': unitPrice,
      'discount': discount,
      'discount_type': discountType,
      'net_price': netPrice,
      'rating': rating,
      'sold': sold,
      'free_shipping': freeShipping ? 1 : 0,
    };
  }
}
