import 'dart:convert';

class FeaturedProductList {
  final List<FeaturedProduct> products;

  FeaturedProductList({required this.products});

  factory FeaturedProductList.fromJson(Map<String, dynamic> json) {
    return FeaturedProductList(
      products: List<FeaturedProduct>.from(
        (json['featured_products'] as List)
            .map((x) => FeaturedProduct.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "featured_products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
  }
}

class FeaturedProduct {
  int id;
  String addedBy;
  int userId;
  String name;
  String slug;
  String gender;
  String productType;
  List<CategoryId> categoryIds;
  int categoryId;
  int? subCategoryId;
  int? subSubCategoryId;
  int brandId;
  String unit;
  int minQty;
  bool refundable;
  List<String> images;
  List<ColorImage> colorImages;
  String thumbnail;
  bool featured;
  List<String> colors;
  List<ChoiceOption> choiceOptions;
  List<Variation> variations;

  FeaturedProduct({
    required this.id,
    required this.addedBy,
    required this.userId,
    required this.name,
    required this.slug,
    required this.gender,
    required this.productType,
    required this.categoryIds,
    required this.categoryId,
    this.subCategoryId,
    this.subSubCategoryId,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.images,
    required this.colorImages,
    required this.thumbnail,
    required this.featured,
    required this.colors,
    required this.choiceOptions,
    required this.variations,
  });

  factory FeaturedProduct.fromJson(Map<String, dynamic> json) {
    return FeaturedProduct(
      id: int.parse(json['id'].toString()),
      addedBy: json['added_by'],
      userId: int.parse(json['user_id'].toString()),
      name: json['name'],
      slug: json['slug'],
      gender: json['gender'],
      productType: json['product_type'],
      categoryIds: (jsonDecode(json['category_ids']) as List)
          .map((x) => CategoryId.fromJson(x))
          .toList(),
      categoryId: int.parse(json['category_id'].toString()),
      subCategoryId: json['sub_category_id'] != null
          ? int.parse(json['sub_category_id'].toString())
          : null,
      subSubCategoryId: json['sub_sub_category_id'] != null
          ? int.parse(json['sub_sub_category_id'].toString())
          : null,
      brandId: int.parse(json['brand_id'].toString()),
      unit: json['unit'],
      minQty: int.parse(json['min_qty'].toString()),
      refundable: json['refundable'] == 1,
      images: List<String>.from(jsonDecode(json['images'])),
      colorImages: (jsonDecode(json['color_image']) as List)
          .map((x) => ColorImage.fromJson(x))
          .toList(),
      thumbnail: json['thumbnail'],
      featured: json['featured'] == 1,
      colors: List<String>.from(jsonDecode(json['colors'])),
      choiceOptions: (json['choice_options'] as List)
          .map((x) => ChoiceOption.fromJson(x))
          .toList(),
      variations: (jsonDecode(json['variation']) as List)
          .map((x) => Variation.fromJson(x))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'added_by': addedBy,
      'user_id': userId,
      'name': name,
      'slug': slug,
      'gender': gender,
      'product_type': productType,
      'category_ids': jsonEncode(categoryIds.map((x) => x.toJson()).toList()),
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'sub_sub_category_id': subSubCategoryId,
      'brand_id': brandId,
      'unit': unit,
      'min_qty': minQty,
      'refundable': refundable ? 1 : 0,
      'images': jsonEncode(images),
      'color_image': jsonEncode(colorImages.map((x) => x.toJson()).toList()),
      'thumbnail': thumbnail,
      'featured': featured ? 1 : 0,
      'colors': jsonEncode(colors),
      'choice_options':
          jsonEncode(choiceOptions.map((x) => x.toJson()).toList()),
      'variation': jsonEncode(variations.map((x) => x.toJson()).toList()),
    };
  }
}

class CategoryId {
  int id;
  int position;

  CategoryId({required this.id, required this.position});

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: int.parse(json['id'].toString()),
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'position': position,
    };
  }
}

class ColorImage {
  String color;
  String imageName;

  ColorImage({
    required this.color,
    required this.imageName,
  });

  factory ColorImage.fromJson(Map<String, dynamic> json) {
    return ColorImage(
      color: json['color'],
      imageName: json['image_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'image_name': imageName,
    };
  }
}

class ChoiceOption {
  String name;
  String title;
  List<String> options;

  ChoiceOption({
    required this.name,
    required this.title,
    required this.options,
  });

  factory ChoiceOption.fromJson(Map<String, dynamic> json) {
    return ChoiceOption(
      name: json['name'],
      title: json['title'],
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'options': options,
    };
  }
}

class Variation {
  String type;
  double price;
  String sku;
  int qty;

  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      type: json['type'],
      price: double.parse(json['price'].toString()),
      sku: json['sku'],
      qty: int.parse(json['qty'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
      'sku': sku,
      'qty': qty,
    };
  }
}
