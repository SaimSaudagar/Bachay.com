import 'dart:convert';

class ProductResponse {
  final int currentPage;
  final List<Product> data;

  ProductResponse({
    required this.currentPage,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      currentPage: json['current_page'],
      data: List<Product>.from(json['data'].map((product) => Product.fromJson(product))),
    );
  }
}
class Product {
  final int id;
  final String addedBy;
  final int userId;
  final String name;
  final String slug;
  final String gender;
  final String productType;
  final String categoryIds;
  final int categoryId;
  final int? subCategoryId;
  final int? subSubCategoryId;
  final int brandId;
  final String unit;
  final int minQty;
  final int refundable;
  final String? digitalProductType;
  final String? digitalFileReady;
  final List<String> images;
  final List<ColorImage> colorImage;
  final String thumbnail;
  final String? videoProvider;
  final String? videoUrl;
  final List<String> colors;
  final List<String>? sizes;
  final int variantProduct;
  final List<String> attributes;
  final List<ChoiceOption> choiceOptions;
  final List<Variation> variation;
  final int published;
  final int unitPrice;
  final int purchasePrice;
  final int tax;
  final String taxType;
  final String taxModel;
  final int discount;
  final String discountType;
  final int currentStock;
  final int minimumOrderQty;
  final String details;
  final int freeShipping;
  final String? attachment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int featuredStatus;
  final String? metaTitle;
  final String? metaDescription;
  final String metaImage;
  final int requestStatus;
  final String? deniedNote;
  final int shippingCost;
  final int multiplyQty;
  final int? tempShippingCost;
  final int? isShippingCostUpdated;
  final String code;
  final String orderDetailsSumQty;
  final int reviewsCount;
  final int flashDealStatus;
  final int flashDealEndDate;
  final Category category;
  final List<dynamic> reviews;
  final List<dynamic> flashDealProducts;
  final List<dynamic> wishList;
  final List<dynamic> translations;

  Product({
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
    this.digitalProductType,
    this.digitalFileReady,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    this.videoProvider,
    this.videoUrl,
    required this.colors,
    this.sizes,
    required this.variantProduct,
    required this.attributes,
    required this.choiceOptions,
    required this.variation,
    required this.published,
    required this.unitPrice,
    required this.purchasePrice,
    required this.tax,
    required this.taxType,
    required this.taxModel,
    required this.discount,
    required this.discountType,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.details,
    required this.freeShipping,
    this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    this.tempShippingCost,
    this.isShippingCostUpdated,
    required this.code,
    required this.orderDetailsSumQty,
    required this.reviewsCount,
    required this.flashDealStatus,
    required this.flashDealEndDate,
    required this.category,
    required this.reviews,
    required this.flashDealProducts,
    required this.wishList,
    required this.translations,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      addedBy: json['added_by'] ?? '',
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      gender: json['gender'] ?? '',
      productType: json['product_type'] ?? '',
      categoryIds: json['category_ids'] ?? '',
      categoryId: json['category_id'] ?? 0,
      subCategoryId: json['sub_category_id'],
      subSubCategoryId: json['sub_sub_category_id'],
      brandId: json['brand_id'] ?? 0,
      unit: json['unit'] ?? '',
      minQty: json['min_qty'] ?? 0,
      refundable: json['refundable'] ?? 0,
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: List<String>.from(jsonDecode(json['images']) ?? []),
      colorImage: List<ColorImage>.from(jsonDecode(json['color_image'] ?? []).map((colorImage) => ColorImage.fromJson(colorImage))),
      thumbnail: json['thumbnail'] ?? '',
      videoProvider: json['video_provider'],
      videoUrl: json['video_url'],
      colors: List<String>.from(jsonDecode(json['colors']) ?? []),
      sizes: json['sizes'] != null ? List<String>.from(jsonDecode(json['sizes'])) : null,
      variantProduct: json['variant_product'] ?? 0,
      attributes: List<String>.from(jsonDecode(json['attributes']) ?? []),
      choiceOptions: List<ChoiceOption>.from(jsonDecode(json['choice_options'] ?? []).map((choiceOption) => ChoiceOption.fromJson(choiceOption))),
      variation: List<Variation>.from(jsonDecode(json['variation'] ?? []).map((variation) => Variation.fromJson(variation))),
      published: json['published'] ?? 0,
      unitPrice: json['unit_price'] ?? 0,
      purchasePrice: json['purchase_price'] ?? 0,
      tax: json['tax'] ?? 0,
      taxType: json['tax_type'] ?? '',
      taxModel: json['tax_model'] ?? '',
      discount: json['discount'] ?? 0,
      discountType: json['discount_type'] ?? '',
      currentStock: json['current_stock'] ?? 0,
      minimumOrderQty: json['minimum_order_qty'] ?? 0,
      details: json['details'] ?? '',
      freeShipping: json['free_shipping'] ?? 0,
      attachment: json['attachment'],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
      status: json['status'] ?? 0,
      featuredStatus: json['featured_status'] ?? 0,
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaImage: json['meta_image'] ?? '',
      requestStatus: json['request_status'] ?? 0,
      deniedNote: json['denied_note'],
      shippingCost: json['shipping_cost'] ?? 0,
      multiplyQty: json['multiply_qty'] ?? 0,
      tempShippingCost: json['temp_shipping_cost'],
      isShippingCostUpdated: json['is_shipping_cost_updated'],
      code: json['code'] ?? '',
      orderDetailsSumQty: json['order_details_sum_qty'] ?? '',
      reviewsCount: json['reviews_count'] ?? 0,
      flashDealStatus: json['flash_deal_status'] ?? 0,
      flashDealEndDate: json['flash_deal_end_date'] ?? 0,
      category: Category.fromJson(json['category'] ?? {}),
      reviews: List<dynamic>.from(json['reviews'] ?? []),
      flashDealProducts: List<dynamic>.from(json['flash_deal_products'] ?? []),
      wishList: List<dynamic>.from(json['wish_list'] ?? []),
      translations: List<dynamic>.from(json['translations'] ?? []),
    );
  }
}

// class Product {
//   final int id;
//   final String addedBy;
//   final int userId;
//   final String name;
//   final String slug;
//   final String gender;
//   final String productType;
//   final String categoryIds;
//   final int categoryId;
//   final int? subCategoryId;
//   final int? subSubCategoryId;
//   final int brandId;
//   final String unit;
//   final int minQty;
//   final int refundable;
//   final String? digitalProductType;
//   final String? digitalFileReady;
//   final List<String> images;
//   final List<ColorImage> colorImage;
//   final String thumbnail;
//   final String? videoProvider;
//   final String? videoUrl;
//   final List<String> colors;
//   final List<String>? sizes;
//   final int variantProduct;
//   final List<String> attributes;
//   final List<ChoiceOption> choiceOptions;
//   final List<Variation> variation;
//   final int published;
//   final int unitPrice;
//   final int purchasePrice;
//   final int tax;
//   final String taxType;
//   final String taxModel;
//   final int discount;
//   final String discountType;
//   final int currentStock;
//   final int minimumOrderQty;
//   final String details;
//   final int freeShipping;
//   final String? attachment;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int status;
//   final int featuredStatus;
//   final String? metaTitle;
//   final String? metaDescription;
//   final String metaImage;
//   final int requestStatus;
//   final String? deniedNote;
//   final int shippingCost;
//   final int multiplyQty;
//   final int? tempShippingCost;
//   final int? isShippingCostUpdated;
//   final String code;
//   final String orderDetailsSumQty;
//   final int reviewsCount;
//   final int flashDealStatus;
//   final int flashDealEndDate;
//   final Category category;
//   final List<dynamic> reviews;
//   final List<dynamic> flashDealProducts;
//   final List<dynamic> wishList;
//   final List<dynamic> translations;

//   Product({
//     required this.id,
//     required this.addedBy,
//     required this.userId,
//     required this.name,
//     required this.slug,
//     required this.gender,
//     required this.productType,
//     required this.categoryIds,
//     required this.categoryId,
//     this.subCategoryId,
//     this.subSubCategoryId,
//     required this.brandId,
//     required this.unit,
//     required this.minQty,
//     required this.refundable,
//     this.digitalProductType,
//     this.digitalFileReady,
//     required this.images,
//     required this.colorImage,
//     required this.thumbnail,
//     this.videoProvider,
//     this.videoUrl,
//     required this.colors,
//     this.sizes,
//     required this.variantProduct,
//     required this.attributes,
//     required this.choiceOptions,
//     required this.variation,
//     required this.published,
//     required this.unitPrice,
//     required this.purchasePrice,
//     required this.tax,
//     required this.taxType,
//     required this.taxModel,
//     required this.discount,
//     required this.discountType,
//     required this.currentStock,
//     required this.minimumOrderQty,
//     required this.details,
//     required this.freeShipping,
//     this.attachment,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.status,
//     required this.featuredStatus,
//     this.metaTitle,
//     this.metaDescription,
//     required this.metaImage,
//     required this.requestStatus,
//     this.deniedNote,
//     required this.shippingCost,
//     required this.multiplyQty,
//     this.tempShippingCost,
//     this.isShippingCostUpdated,
//     required this.code,
//     required this.orderDetailsSumQty,
//     required this.reviewsCount,
//     required this.flashDealStatus,
//     required this.flashDealEndDate,
//     required this.category,
//     required this.reviews,
//     required this.flashDealProducts,
//     required this.wishList,
//     required this.translations,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       addedBy: json['added_by'],
//       userId: json['user_id'],
//       name: json['name'],
//       slug: json['slug'],
//       gender: json['gender'],
//       productType: json['product_type'],
//       categoryIds: json['category_ids'],
//       categoryId: json['category_id'],
//       subCategoryId: json['sub_category_id'],
//       subSubCategoryId: json['sub_sub_category_id'],
//       brandId: json['brand_id'],
//       unit: json['unit'],
//       minQty: json['min_qty'],
//       refundable: json['refundable'],
//       digitalProductType: json['digital_product_type'],
//       digitalFileReady: json['digital_file_ready'],
//       images: List<String>.from(jsonDecode(json['images'])),
//       colorImage: List<ColorImage>.from(jsonDecode(json['color_image']).map((colorImage) => ColorImage.fromJson(colorImage))),
//       thumbnail: json['thumbnail'],
//       videoProvider: json['video_provider'],
//       videoUrl: json['video_url'],
//       colors: List<String>.from(jsonDecode(json['colors'])),
//       sizes: json['sizes'] != null ? List<String>.from(jsonDecode(json['sizes'])) : null,
//       variantProduct: json['variant_product'],
//       attributes: List<String>.from(jsonDecode(json['attributes'])),
//       choiceOptions: List<ChoiceOption>.from(jsonDecode(json['choice_options']).map((choiceOption) => ChoiceOption.fromJson(choiceOption))),
//       variation: List<Variation>.from(jsonDecode(json['variation']).map((variation) => Variation.fromJson(variation))),
//       published: json['published'],
//       unitPrice: json['unit_price'],
//       purchasePrice: json['purchase_price'],
//       tax: json['tax'],
//       taxType: json['tax_type'],
//       taxModel: json['tax_model'],
//       discount: json['discount'],
//       discountType: json['discount_type'],
//       currentStock: json['current_stock'],
//       minimumOrderQty: json['minimum_order_qty'],
//       details: json['details'],
//       freeShipping: json['free_shipping'],
//       attachment: json['attachment'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       status: json['status'],
//       featuredStatus: json['featured_status'],
//       metaTitle: json['meta_title'],
//       metaDescription: json['meta_description'],
//       metaImage: json['meta_image'],
//       requestStatus: json['request_status'],
//       deniedNote: json['denied_note'],
//       shippingCost: json['shipping_cost'],
//       multiplyQty: json['multiply_qty'],
//       tempShippingCost: json['temp_shipping_cost'],
//       isShippingCostUpdated: json['is_shipping_cost_updated'],
//       code: json['code'],
//       orderDetailsSumQty: json['order_details_sum_qty'],
//       reviewsCount: json['reviews_count'],
//       flashDealStatus: json['flash_deal_status'],
//       flashDealEndDate: json['flash_deal_end_date'],
//       category: Category.fromJson(json['category']),
//       reviews: List<dynamic>.from(json['reviews']),
//       flashDealProducts: List<dynamic>.from(json['flash_deal_products']),
//       wishList: List<dynamic>.from(json['wish_list']),
//       translations: List<dynamic>.from(json['translations']),
//     );
//   }
// }

class ColorImage {
  final String color;
  final String imageName;

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
}

class ChoiceOption {
  final String name;
  final String title;
  final List<String> options;

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
}

class Variation {
  final String type;
  final int price;
  final String sku;
  final int qty;

  Variation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      type: json['type'],
      price: json['price'],
      sku: json['sku'],
      qty: json['qty'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final int parentId;
  final int position;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int homeStatus;
  final int priority;
  final List<dynamic> translations;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.parentId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.homeStatus,
    required this.priority,
    required this.translations,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      icon: json['icon'],
      parentId: json['parent_id'],
      position: json['position'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      homeStatus: json['home_status'],
      priority: json['priority'],
      translations: List<dynamic>.from(json['translations']),
    );
  }
}
