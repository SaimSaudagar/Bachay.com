class ProductList {
  final List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Product> productList = list.map((i) => Product.fromJson(i)).toList();
    return ProductList(products: productList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  int? id;
  String? name;
  String? slug;
  int? categoryId;
  int? subCategoryId;
  int? subSubCategoryId;
  String? thumbnail;
  List<String>? images;
  bool? published;
  double? unitPrice;
  String? details;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({
    this.id,
    this.name,
    this.slug,
    this.categoryId,
    this.subCategoryId,
    this.subSubCategoryId,
    this.thumbnail,
    this.images,
    this.published,
    this.unitPrice,
    this.details,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      subSubCategoryId: json['sub_sub_category_id'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
      published: json['published'] == 1,
      unitPrice: json['unit_price']?.toDouble(),
      details: json['details'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'sub_sub_category_id': subSubCategoryId,
      'thumbnail': thumbnail,
      'images': images,
      'published': published! ? 1 : 0,
      'unit_price': unitPrice,
      'details': details,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
