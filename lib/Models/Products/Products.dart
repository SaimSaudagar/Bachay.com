class AllProduct {
  AllProducts? allProducts;
  Filter? filter;

  AllProduct({
    required this.allProducts,
    required this.filter,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      allProducts: json['all_products'] != null
          ? AllProducts.fromJson(json['all_products'])
          : throw Exception("all_products is null"),
      filter: json['filter'] != null
          ? Filter.fromJson(json['filter'])
          : throw Exception("filter is null"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'all_products': allProducts?.toJson(),
      'filter': filter?.toJson(),
    };
  }
}

class AllProducts {
  int currentPage;
  List<Product> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

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
      currentPage: json['current_page'] ?? 0,
      data: json['data'] != null
          ? List<Product>.from(json['data'].map((x) => Product.fromJson(x)))
          : [],
      firstPageUrl: json['first_page_url'] ?? '',
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      lastPageUrl: json['last_page_url'] ?? '',
      links: json['links'] != null
          ? List<Link>.from(json['links'].map((x) => Link.fromJson(x)))
          : [],
      nextPageUrl: json['next_page_url'] ?? '',
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 0,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
}

class Product {
  int id;
  dynamic addedBy;
  int userId;
  String name;
  String slug;
  dynamic gender;
  dynamic productType;
  String categoryIds;
  int categoryId;
  int? subCategoryId;
  int? subSubCategoryId;
  int brandId;
  dynamic unit;
  int minQty;
  int refundable;
  dynamic digitalProductType;
  String? digitalFileReady;
  String images;
  String colorImage;
  String thumbnail;
  int? featured;
  dynamic flashDeal;
  dynamic videoProvider;
  dynamic videoUrl;
  String colors;
  dynamic sizes;
  int variantProduct;
  dynamic attributes;
  String choiceOptions;
  String variation;
  int published;
  double unitPrice;
  int purchasePrice;
  int tax;
  dynamic taxType;
  dynamic taxModel;
  int discount;
  dynamic discountType;
  int currentStock;
  int minimumOrderQty;
  String details;
  int freeShipping;
  dynamic attachment;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  int featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int requestStatus;
  dynamic deniedNote;
  int shippingCost;
  int multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String code;
  String orderDetailsSumQty;
  int reviewsCount;
  int flashDealStatus;
  dynamic flashDealEndDate;
  ProductCategory category;
  List<Review> reviews;
  List<FlashDealProduct> flashDealProducts;
  List<dynamic> wishList;
  List<dynamic> translations;

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
    required this.subCategoryId,
    required this.subSubCategoryId,
    required this.brandId,
    required this.unit,
    required this.minQty,
    required this.refundable,
    required this.digitalProductType,
    required this.digitalFileReady,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    required this.featured,
    required this.flashDeal,
    required this.videoProvider,
    required this.videoUrl,
    required this.colors,
    required this.sizes,
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
    required this.attachment,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.featuredStatus,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaImage,
    required this.requestStatus,
    required this.deniedNote,
    required this.shippingCost,
    required this.multiplyQty,
    required this.tempShippingCost,
    required this.isShippingCostUpdated,
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
      addedBy: json['added_by'],
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      gender: json['gender'],
      productType: json['product_type'],
      categoryIds: json['category_ids'] ?? '',
      categoryId: json['category_id'] ?? 0,
      subCategoryId: json['subCategory_id'],
      subSubCategoryId: json['subSubCategory_id'],
      brandId: json['brand_id'] ?? 0,
      unit: json['unit'],
      minQty: json['min_qty'] ?? 0,
      refundable: json['refundable'] ?? 0,
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: json['images'] ?? '',
      colorImage: json['color_image'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      featured: json['featured'],
      flashDeal: json['flash_deal'],
      videoProvider: json['video_provider'],
      videoUrl: json['video_url'],
      colors: json['colors'] ?? '',
      sizes: json['sizes'],
      variantProduct: json['variant_product'] ?? 0,
      attributes: json['attributes'],
      choiceOptions: json['choice_options'] ?? '',
      variation: json['variation'] ?? '',
      published: json['published'] ?? 0,
      unitPrice: json['unit_price']?.toDouble() ?? 0.0,
      purchasePrice: json['purchase_price'] ?? 0,
      tax: json['tax'] ?? 0,
      taxType: json['tax_type'],
      taxModel: json['tax_model'],
      discount: json['discount'] ?? 0,
      discountType: json['discount_type'],
      currentStock: json['current_stock'] ?? 0,
      minimumOrderQty: json['minimum_order_qty'] ?? 0,
      details: json['details'] ?? '',
      freeShipping: json['free_shipping'] ?? 0,
      attachment: json['attachment'],
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      status: json['status'] ?? 0,
      featuredStatus: json['featured_status'] ?? 0,
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaImage: json['meta_image'],
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
      flashDealEndDate: json['flash_deal_end_date'],
      category: json['category'] != null
          ? ProductCategory.fromJson(json['category'])
          : throw Exception("category is null"),
      reviews: json['reviews'] != null
          ? List<Review>.from(json['reviews'].map((x) => Review.fromJson(x)))
          : [],
      flashDealProducts: json['flash_deal_products'] != null
          ? List<FlashDealProduct>.from(json['flash_deal_products']
              .map((x) => FlashDealProduct.fromJson(x)))
          : [],
      wishList: json['wish_list'] != null
          ? List<dynamic>.from(json['wish_list'])
          : [],
      translations: json['translations'] != null
          ? List<dynamic>.from(json['translations'])
          : [],
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
      'category_ids': categoryIds,
      'category_id': categoryId,
      'subCategory_id': subCategoryId,
      'subSubCategory_id': subSubCategoryId,
      'brand_id': brandId,
      'unit': unit,
      'min_qty': minQty,
      'refundable': refundable,
      'digital_product_type': digitalProductType,
      'digital_file_ready': digitalFileReady,
      'images': images,
      'color_image': colorImage,
      'thumbnail': thumbnail,
      'featured': featured,
      'flash_deal': flashDeal,
      'video_provider': videoProvider,
      'video_url': videoUrl,
      'colors': colors,
      'sizes': sizes,
      'variant_product': variantProduct,
      'attributes': attributes,
      'choice_options': choiceOptions,
      'variation': variation,
      'published': published,
      'unitPrice': unitPrice,
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
      'reviews': List<dynamic>.from(reviews.map((x) => x.toJson())),
      'flash_deal_products':
          List<dynamic>.from(flashDealProducts.map((x) => x.toJson())),
      'wish_list': List<dynamic>.from(wishList),
      'translations': List<dynamic>.from(translations),
    };
  }
}

class ProductCategory {
  int id;
  dynamic name;
  dynamic slug;
  dynamic icon;
  int parentId;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  int homeStatus;
  int priority;
  List<dynamic> translations;

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
      id: json['id'] ?? 0,
      name: json['name'],
      slug: json['slug'],
      icon: json['icon'],
      parentId: json['parent_id'] ?? 0,
      position: json['position'] ?? 0,
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      homeStatus: json['home_status'] ?? 0,
      priority: json['priority'] ?? 0,
      translations: json['translations'] != null
          ? List<dynamic>.from(json['translations'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
}

class FlashDealProduct {
  int id;
  int flashDealId;
  int productId;
  String discount;
  String discountType;
  DateTime createdAt;
  DateTime updatedAt;
  FlashDeal? flashDeal;

  FlashDealProduct({
    required this.id,
    required this.flashDealId,
    required this.productId,
    required this.discount,
    required this.discountType,
    required this.createdAt,
    required this.updatedAt,
    required this.flashDeal,
  });

  factory FlashDealProduct.fromJson(Map<String, dynamic> json) {
    return FlashDealProduct(
      id: json['id'] ?? 0,
      flashDealId: json['flash_deal_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      discount: json['discount'] ?? '',
      discountType: json['discount_type'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      flashDeal: json['flash_deal'] != null
          ? FlashDeal.fromJson(json['flash_deal'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'flash_deal_id': flashDealId,
      'product_id': productId,
      'discount': discount,
      'discount_type': discountType,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'flash_deal': flashDeal?.toJson(),
    };
  }
}

class FlashDeal {
  int id;
  String title;
  DateTime startDate;
  DateTime endDate;
  bool status;
  bool featured;
  dynamic backgroundColor;
  dynamic textColor;
  String banner;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic productId;
  String dealType;
  List<dynamic> translations;

  FlashDeal({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.featured,
    required this.backgroundColor,
    required this.textColor,
    required this.banner,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.productId,
    required this.dealType,
    required this.translations,
  });

  factory FlashDeal.fromJson(Map<String, dynamic> json) {
    return FlashDeal(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      startDate: DateTime.parse(
          json['start_date'] ?? DateTime.now().toIso8601String()),
      endDate:
          DateTime.parse(json['end_date'] ?? DateTime.now().toIso8601String()),
      status: json['status'] ?? false,
      featured: json['featured'] ?? false,
      backgroundColor: json['background_color'],
      textColor: json['text_color'],
      banner: json['banner'] ?? '',
      slug: json['slug'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      productId: json['product_id'],
      dealType: json['deal_type'] ?? '',
      translations: json['translations'] != null
          ? List<dynamic>.from(json['translations'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'status': status,
      'featured': featured,
      'background_color': backgroundColor,
      'text_color': textColor,
      'banner': banner,
      'slug': slug,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'product_id': productId,
      'deal_type': dealType,
      'translations': List<dynamic>.from(translations),
    };
  }
}

class Review {
  int id;
  int productId;
  int customerId;
  dynamic deliveryManId;
  dynamic orderId;
  String comment;
  String attachment;
  int rating;
  int status;
  bool isSaved;
  DateTime createdAt;
  DateTime updatedAt;

  Review({
    required this.id,
    required this.productId,
    required this.customerId,
    required this.deliveryManId,
    required this.orderId,
    required this.comment,
    required this.attachment,
    required this.rating,
    required this.status,
    required this.isSaved,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      deliveryManId: json['delivery_man_id'],
      orderId: json['order_id'],
      comment: json['comment'] ?? '',
      attachment: json['attachment'] ?? '',
      rating: json['rating'] ?? 0,
      status: json['status'] ?? 0,
      isSaved: json['isSaved'] ?? false,
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'customer_id': customerId,
      'delivery_man_id': deliveryManId,
      'order_id': orderId,
      'comment': comment,
      'attachment': attachment,
      'rating': rating,
      'status': status,
      'isSaved': isSaved,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'] ?? '',
      active: json['active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }
}

class Filter {
  Choice1 choice1;
  Choice0 choice0;

  Filter({
    required this.choice1,
    required this.choice0,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      choice1: json['choice_1'] != null
          ? Choice1.fromJson(json['choice_1'])
          : throw Exception("choice_1 is null"),
      choice0: json['choice_0'] != null
          ? Choice0.fromJson(json['choice_0'])
          : throw Exception("choice_0 is null"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'choice_1': choice1.toJson(),
      'choice_0': choice0.toJson(),
    };
  }
}

class Choice0 {
  String title;
  Map<String, String> options;

  Choice0({
    required this.title,
    required this.options,
  });

  factory Choice0.fromJson(Map<String, dynamic> json) {
    return Choice0(
      title: json['title'] ?? '',
      options: json['options'] != null
          ? Map<String, String>.from(json['options'])
          : {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'options': options,
    };
  }
}

class Choice1 {
  String name;
  String title;
  List<String> options;

  Choice1({
    required this.name,
    required this.title,
    required this.options,
  });

  factory Choice1.fromJson(Map<String, dynamic> json) {
    return Choice1(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      options:
          json['options'] != null ? List<String>.from(json['options']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'options': List<dynamic>.from(options),
    };
  }
}
