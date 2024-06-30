import 'dart:convert';

class AllProducts {
  final int currentPage;
  final List<Product> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  AllProducts({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory AllProducts.fromJson(Map<String, dynamic> json) {
    return AllProducts(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List).map((e) => Product.fromJson(e as Map<String, dynamic>)).toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: json['from'] as int,
      lastPage: json['last_page'] as int,
      lastPageUrl: json['last_page_url'] as String,
      links: (json['links'] as List).map((e) => Link.fromJson(e as Map<String, dynamic>)).toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: json['per_page'] as int,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int,
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': List<dynamic>.from(links.map((x) => x.toJson())),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };
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
  final String images;
  final String colorImage;
  final String thumbnail;
  final String? videoProvider;
  final String? videoUrl;
  final String colors;
  final String? sizes;
  final int variantProduct;
  final String attributes;
  final String choiceOptions;
  final String variation;
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
  final String? tempShippingCost;
  final String? isShippingCostUpdated;
  final String code;
  final String orderDetailsSumQty;
  final int reviewsCount;
  final int flashDealStatus;
  final int flashDealEndDate;
  final ProductCategory category;
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
      id: json['id'] as int,
      addedBy: json['added_by'] as String,
      userId: json['user_id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      gender: json['gender'] as String,
      productType: json['product_type'] as String,
      categoryIds: json['category_ids'] as String,
      categoryId: json['category_id'] as int,
      subCategoryId: json['sub_category_id'] as int?,
      subSubCategoryId: json['sub_sub_category_id'] as int?,
      brandId: json['brand_id'] as int,
      unit: json['unit'] as String,
      minQty: json['min_qty'] as int,
      refundable: json['refundable'] as int,
      digitalProductType: json['digital_product_type'] as String?,
      digitalFileReady: json['digital_file_ready'] as String?,
      images: json['images'] as String,
      colorImage: json['color_image'] as String,
      thumbnail: json['thumbnail'] as String,
      videoProvider: json['video_provider'] as String?,
      videoUrl: json['video_url'] as String?,
      colors: json['colors'] as String,
      sizes: json['sizes'] as String?,
      variantProduct: json['variant_product'] as int,
      attributes: json['attributes'] as String,
      choiceOptions: json['choice_options'] as String,
      variation: json['variation'] as String,
      published: json['published'] as int,
      unitPrice: json['unit_price'] as int,
      purchasePrice: json['purchase_price'] as int,
      tax: json['tax'] as int,
      taxType: json['tax_type'] as String,
      taxModel: json['tax_model'] as String,
      discount: json['discount'] as int,
      discountType: json['discount_type'] as String,
      currentStock: json['current_stock'] as int,
      minimumOrderQty: json['minimum_order_qty'] as int,
      details: json['details'] as String,
      freeShipping: json['free_shipping'] as int,
      attachment: json['attachment'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      status: json['status'] as int,
      featuredStatus: json['featured_status'] as int,
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaImage: json['meta_image'] as String,
      requestStatus: json['request_status'] as int,
      deniedNote: json['denied_note'] as String?,
      shippingCost: json['shipping_cost'] as int,
      multiplyQty: json['multiply_qty'] as int,
      tempShippingCost: json['temp_shipping_cost'] as String?,
      isShippingCostUpdated: json['is_shipping_cost_updated'] as String?,
      code: json['code'] as String,
      orderDetailsSumQty: json['order_details_sum_qty'] as String,
      reviewsCount: json['reviews_count'] as int,
      flashDealStatus: json['flash_deal_status'] as int,
      flashDealEndDate: json['flash_deal_end_date'] as int,
      category: ProductCategory.fromJson(json['category'] as Map<String, dynamic>),
      reviews: List<dynamic>.from(json['reviews'] as List<dynamic>),
      flashDealProducts: List<dynamic>.from(json['flash_deal_products'] as List<dynamic>),
      wishList: List<dynamic>.from(json['wish_list'] as List<dynamic>),
      translations: List<dynamic>.from(json['translations'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'added_by': addedBy,
        'user_id': userId,
        'name': name,
        'slug': slug,
        'gender': gender,
        'product_type': productType,
        'category_ids': categoryIds,
        'category_id': categoryId,
        'sub_category_id': subCategoryId,
        'sub_sub_category_id': subSubCategoryId,
        'brand_id': brandId,
        'unit': unit,
        'min_qty': minQty,
        'refundable': refundable,
        'digital_product_type': digitalProductType,
        'digital_file_ready': digitalFileReady,
        'images': images,
        'color_image': colorImage,
        'thumbnail': thumbnail,
        'video_provider': videoProvider,
        'video_url': videoUrl,
        'colors': colors,
        'sizes': sizes,
        'variant_product': variantProduct,
        'attributes': attributes,
        'choice_options': choiceOptions,
        'variation': variation,
        'published': published,
        'unit_price': unitPrice,
        'purchase_price': purchasePrice,
        'tax': tax,
        'tax_type': taxType,
        'tax_model': taxModel,
        'discount': discount,
        'discount_type': discountType,
        'current_stock': currentStock,
        'minimum_order_qty': minimumOrderQty,
        'details': details,
        'free_shipping': freeShipping,
        'attachment': attachment,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'status': status,
        'featured_status': featuredStatus,
        'meta_title': metaTitle,
        'meta_description': metaDescription,
        'meta_image': metaImage,
        'request_status': requestStatus,
        'denied_note': deniedNote,
        'shipping_cost': shippingCost,
        'multiply_qty': multiplyQty,
        'temp_shipping_cost': tempShippingCost,
        'is_shipping_cost_updated': isShippingCostUpdated,
        'code': code,
        'order_details_sum_qty': orderDetailsSumQty,
        'reviews_count': reviewsCount,
        'flash_deal_status': flashDealStatus,
        'flash_deal_end_date': flashDealEndDate,
        'category': category.toJson(),
        'reviews': List<dynamic>.from(reviews),
        'flash_deal_products': List<dynamic>.from(flashDealProducts),
        'wish_list': List<dynamic>.from(wishList),
        'translations': List<dynamic>.from(translations),
      };
}

class ProductCategory {
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

  ProductCategory({
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

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      icon: json['icon'] as String,
      parentId: json['parent_id'] as int,
      position: json['position'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      homeStatus: json['home_status'] as int,
      priority: json['priority'] as int,
      translations: List<dynamic>.from(json['translations'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'icon': icon,
        'parent_id': parentId,
        'position': position,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'home_status': homeStatus,
        'priority': priority,
        'translations': List<dynamic>.from(translations),
      };
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'active': active,
      };
}
