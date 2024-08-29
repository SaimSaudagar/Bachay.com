class OrderItemList {
  final List<OrderDetail> orders;

  OrderItemList({required this.orders});

  factory OrderItemList.fromJson(Map<String, dynamic> json) {
    return OrderItemList(
      orders: List<OrderDetail>.from(json['orders'].map((x) => OrderDetail.fromJson(x as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() => {
        'orders': orders.map((x) => x.toJson()).toList(),
      };
}

class OrderDetail {
  final int id;
  final int orderId;
  final int productId;
  final int sellerId;
  final dynamic digitalFileAfterSell;
  final ProductDetails productDetails;
  final int qty;
  final int price;
  final int tax;
  final int discount;
  final String taxModel;
  final String deliveryStatus;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic shippingMethodId;
  final String variant;
  final Map<String, dynamic> variation;
  final String discountType;
  final int isStockDecreased;
  final int refundRequest;
  final Product product;
  final Order order;
  final List<dynamic> verificationImages;
  final dynamic seller;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.sellerId,
    this.digitalFileAfterSell,
    required this.productDetails,
    required this.qty,
    required this.price,
    required this.tax,
    required this.discount,
    required this.taxModel,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    this.shippingMethodId,
    required this.variant,
    required this.variation,
    required this.discountType,
    required this.isStockDecreased,
    required this.refundRequest,
    required this.product,
    required this.order,
    required this.verificationImages,
    this.seller,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] as int,
      orderId: json['order_id'] as int,
      productId: json['product_id'] as int,
      sellerId: json['seller_id'] as int,
      digitalFileAfterSell: json['digital_file_after_sell'],
      productDetails: ProductDetails.fromJson(json['product_details'] as Map<String, dynamic>),
      qty: json['qty'] as int,
      price: json['price'] as int,
      tax: json['tax'] as int,
      discount: json['discount'] as int,
      taxModel: json['tax_model'] as String,
      deliveryStatus: json['delivery_status'] as String,
      paymentStatus: json['payment_status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      shippingMethodId: json['shipping_method_id'],
      variant: json['variant'] as String,
      variation: Map<String, dynamic>.from(json['variation']),
      discountType: json['discount_type'] as String,
      isStockDecreased: json['is_stock_decreased'] as int,
      refundRequest: json['refund_request'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      verificationImages: json['verification_images'] as List<dynamic>,
      seller: json['seller'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_id': orderId,
        'product_id': productId,
        'seller_id': sellerId,
        'digital_file_after_sell': digitalFileAfterSell,
        'product_details': productDetails.toJson(),
        'qty': qty,
        'price': price,
        'tax': tax,
        'discount': discount,
        'tax_model': taxModel,
        'delivery_status': deliveryStatus,
        'payment_status': paymentStatus,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'shipping_method_id': shippingMethodId,
        'variant': variant,
        'variation': variation,
        'discount_type': discountType,
        'is_stock_decreased': isStockDecreased,
        'refund_request': refundRequest,
        'product': product.toJson(),
        'order': order.toJson(),
        'verification_images': verificationImages,
        'seller': seller,
      };
}

class ProductDetails {
  final int id;
  final String addedBy;
  final int userId;
  final String name;
  final String slug;
  final String gender;
  final String productType;
  final List<CategoryId> categoryIds;
  final int categoryId;
  final dynamic subCategoryId;
  final dynamic subSubCategoryId;
  final int brandId;
  final String unit;
  final int minQty;
  final int refundable;
  final dynamic digitalProductType;
  final dynamic digitalFileReady;
  final List<String> images;
  final List<dynamic> colorImage;
  final String thumbnail;
  final dynamic featured;
  final dynamic flashDeal;
  final String videoProvider;
  final dynamic videoUrl;
  final List<String> colors;
  final dynamic sizes;
  final int variantProduct;
  final List<int> attributes;
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
  final dynamic attachment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int featuredStatus;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final String metaImage;
  final int requestStatus;
  final dynamic deniedNote;
  final int shippingCost;
  final int multiplyQty;
  final dynamic tempShippingCost;
  final dynamic isShippingCostUpdated;
  final String code;
  final int reviewsCount;
  final List<dynamic> translations;
  final List<Review> reviews;
  final List<ColorFormatted> colorsFormatted;

  ProductDetails({
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
    this.digitalProductType,
    this.digitalFileReady,
    required this.images,
    required this.colorImage,
    required this.thumbnail,
    this.featured,
    this.flashDeal,
    required this.videoProvider,
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
    required this.reviewsCount,
    required this.translations,
    required this.reviews,
    required this.colorsFormatted,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'] as int,
      addedBy: json['added_by'] as String,
      userId: json['user_id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      gender: json['gender'] as String,
      productType: json['product_type'] as String,
      categoryIds: List<CategoryId>.from(json['category_ids'].map((x) => CategoryId.fromJson(x as Map<String, dynamic>))),
      categoryId: json['category_id'] as int,
      subCategoryId: json['sub_category_id'],
      subSubCategoryId: json['sub_sub_category_id'],
      brandId: json['brand_id'] as int,
      unit: json['unit'] as String,
      minQty: json['min_qty'] as int,
      refundable: json['refundable'] as int,
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: List<String>.from(json['images'].map((x) => x as String)),
      colorImage: List<dynamic>.from(json['color_image'].map((x) => x)),
      thumbnail: json['thumbnail'] as String,
      featured: json['featured'],
      flashDeal: json['flash_deal'],
      videoProvider: json['video_provider'] as String,
      videoUrl: json['video_url'],
      colors: List<String>.from(json['colors'].map((x) => x as String)),
      sizes: json['sizes'],
      variantProduct: json['variant_product'] as int,
      attributes: List<int>.from(json['attributes'].map((x) => x as int)),
      choiceOptions: List<ChoiceOption>.from(json['choice_options'].map((x) => ChoiceOption.fromJson(x as Map<String, dynamic>))),
      variation: List<Variation>.from(json['variation'].map((x) => Variation.fromJson(x as Map<String, dynamic>))),
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
      attachment: json['attachment'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      status: json['status'] as int,
      featuredStatus: json['featured_status'] as int,
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaImage: json['meta_image'] as String,
      requestStatus: json['request_status'] as int,
      deniedNote: json['denied_note'],
      shippingCost: json['shipping_cost'] as int,
      multiplyQty: json['multiply_qty'] as int,
      tempShippingCost: json['temp_shipping_cost'],
      isShippingCostUpdated: json['is_shipping_cost_updated'],
      code: json['code'] as String,
      reviewsCount: json['reviews_count'] as int,
      translations: List<dynamic>.from(json['translations'].map((x) => x)),
      reviews: List<Review>.from(json['reviews'].map((x) => Review.fromJson(x as Map<String, dynamic>))),
      colorsFormatted: List<ColorFormatted>.from(json['colors_formatted'].map((x) => ColorFormatted.fromJson(x as Map<String, dynamic>))),
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
        'category_ids': categoryIds.map((x) => x.toJson()).toList(),
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
        'featured': featured,
        'flash_deal': flashDeal,
        'video_provider': videoProvider,
        'video_url': videoUrl,
        'colors': colors,
        'sizes': sizes,
        'variant_product': variantProduct,
        'attributes': attributes,
        'choice_options': choiceOptions.map((x) => x.toJson()).toList(),
        'variation': variation.map((x) => x.toJson()).toList(),
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
        'reviews_count': reviewsCount,
        'translations': translations,
        'reviews': reviews.map((x) => x.toJson()).toList(),
        'colors_formatted': colorsFormatted.map((x) => x.toJson()).toList(),
      };
}

class CategoryId {
  final String id;
  final int position;

  CategoryId({
    required this.id,
    required this.position,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: json['id'] as String,
      position: json['position'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'position': position,
      };
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
      name: json['name'] as String,
      title: json['title'] as String,
      options: List<String>.from(json['options'].map((x) => x as String)),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'options': options,
      };
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
      type: json['type'] as String,
      price: json['price'] as int,
      sku: json['sku'] as String,
      qty: json['qty'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
        'sku': sku,
        'qty': qty,
      };
}

class Review {
  final int id;
  final int productId;
  final int customerId;
  final dynamic deliveryManId;
  final dynamic orderId;
  final String comment;
  final List<dynamic> attachment;
  final int rating;
  final int status;
  final bool isSaved;
  final DateTime createdAt;
  final DateTime updatedAt;

  Review({
    required this.id,
    required this.productId,
    required this.customerId,
    this.deliveryManId,
    this.orderId,
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
      id: json['id'] as int,
      productId: json['product_id'] as int,
      customerId: json['customer_id'] as int,
      deliveryManId: json['delivery_man_id'],
      orderId: json['order_id'],
      comment: json['comment'] as String,
      attachment: List<dynamic>.from(json['attachment'].map((x) => x)),
      rating: json['rating'] as int,
      status: json['status'] as int,
      isSaved: json['is_saved'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'customer_id': customerId,
        'delivery_man_id': deliveryManId,
        'order_id': orderId,
        'comment': comment,
        'attachment': attachment,
        'rating': rating,
        'status': status,
        'is_saved': isSaved,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };
}

class ColorFormatted {
  final String name;
  final String code;
  final String image;

  ColorFormatted({
    required this.name,
    required this.code,
    required this.image,
  });

  factory ColorFormatted.fromJson(Map<String, dynamic> json) {
    return ColorFormatted(
      name: json['name'] as String,
      code: json['code'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'image': image,
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
  final List<CategoryId> categoryIds;
  final int categoryId;
  final dynamic subCategoryId;
  final dynamic subSubCategoryId;
  final int brandId;
  final String unit;
  final int minQty;
  final int refundable;
  final dynamic digitalProductType;
  final dynamic digitalFileReady;
  final List<String> images;
  final List<dynamic> colorImage;
  final String thumbnail;
  final dynamic featured;
  final dynamic flashDeal;
  final String videoProvider;
  final dynamic videoUrl;
  final List<String> colors;
  final dynamic sizes;
  final int variantProduct;
  final List<int> attributes;
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
  final dynamic attachment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int featuredStatus;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final String metaImage;
  final int requestStatus;
  final dynamic deniedNote;
  final int shippingCost;
  final int multiplyQty;
  final dynamic tempShippingCost;
  final dynamic isShippingCostUpdated;
  final String code;
  final int reviewsCount;
  final List<dynamic> translations;
  final List<Review> reviews;
  final List<ColorFormatted> colorsFormatted;

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
    this.featured,
    this.flashDeal,
    required this.videoProvider,
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
    required this.reviewsCount,
    required this.translations,
    required this.reviews,
    required this.colorsFormatted,
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
      categoryIds: List<CategoryId>.from(json['category_ids'].map((x) => CategoryId.fromJson(x as Map<String, dynamic>))),
      categoryId: json['category_id'] as int,
      subCategoryId: json['sub_category_id'],
      subSubCategoryId: json['sub_sub_category_id'],
      brandId: json['brand_id'] as int,
      unit: json['unit'] as String,
      minQty: json['min_qty'] as int,
      refundable: json['refundable'] as int,
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: List<String>.from(json['images'].map((x) => x as String)),
      colorImage: List<dynamic>.from(json['color_image'].map((x) => x)),
      thumbnail: json['thumbnail'] as String,
      featured: json['featured'],
      flashDeal: json['flash_deal'],
      videoProvider: json['video_provider'] as String,
      videoUrl: json['video_url'],
      colors: List<String>.from(json['colors'].map((x) => x as String)),
      sizes: json['sizes'],
      variantProduct: json['variant_product'] as int,
      attributes: List<int>.from(json['attributes'].map((x) => x as int)),
      choiceOptions: List<ChoiceOption>.from(json['choice_options'].map((x) => ChoiceOption.fromJson(x as Map<String, dynamic>))),
      variation: List<Variation>.from(json['variation'].map((x) => Variation.fromJson(x as Map<String, dynamic>))),
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
      attachment: json['attachment'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      status: json['status'] as int,
      featuredStatus: json['featured_status'] as int,
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaImage: json['meta_image'] as String,
      requestStatus: json['request_status'] as int,
      deniedNote: json['denied_note'],
      shippingCost: json['shipping_cost'] as int,
      multiplyQty: json['multiply_qty'] as int,
      tempShippingCost: json['temp_shipping_cost'],
      isShippingCostUpdated: json['is_shipping_cost_updated'],
      code: json['code'] as String,
      reviewsCount: json['reviews_count'] as int,
      translations: List<dynamic>.from(json['translations'].map((x) => x)),
      reviews: List<Review>.from(json['reviews'].map((x) => Review.fromJson(x as Map<String, dynamic>))),
      colorsFormatted: List<ColorFormatted>.from(json['colors_formatted'].map((x) => ColorFormatted.fromJson(x as Map<String, dynamic>))),
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
        'category_ids': categoryIds.map((x) => x.toJson()).toList(),
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
        'featured': featured,
        'flash_deal': flashDeal,
        'video_provider': videoProvider,
        'video_url': videoUrl,
        'colors': colors,
        'sizes': sizes,
        'variant_product': variantProduct,
        'attributes': attributes,
        'choice_options': choiceOptions.map((x) => x.toJson()).toList(),
        'variation': variation.map((x) => x.toJson()).toList(),
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
        'reviews_count': reviewsCount,
        'translations': translations,
        'reviews': reviews.map((x) => x.toJson()).toList(),
        'colors_formatted': colorsFormatted.map((x) => x.toJson()).toList(),
      };
}

class Order {
  final int id;
  final int customerId;
  final bool isGuest;
  final String customerType;
  final String paymentStatus;
  final String orderStatus;
  final String paymentMethod;
  final dynamic transactionRef;
  final dynamic paymentBy;
  final dynamic paymentNote;
  final int orderAmount;
  final String adminCommission;
  final bool isPause;
  final dynamic cause;
  final dynamic shippingAddress;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int discountAmount;
  final dynamic discountType;
  final String couponCode;
  final String couponDiscountBearer;
  final String shippingResponsibility;
  final int shippingMethodId;
  final int shippingCost;
  final bool isShippingFree;
  final String orderGroupId;
  final String verificationCode;
  final bool verificationStatus;
  final int sellerId;
  final String sellerIs;
  final dynamic shippingAddressData;
  final dynamic deliveryManId;
  final int deliverymanCharge;
  final dynamic expectedDeliveryDate;
  final dynamic orderNote;
  final dynamic billingAddress;
  final dynamic billingAddressData;
  final String orderType;
  final int extraDiscount;
  final dynamic extraDiscountType;
  final String freeDeliveryBearer;
  final bool checked;
  final String shippingType;
  final dynamic deliveryType;
  final dynamic deliveryServiceName;
  final dynamic thirdPartyDeliveryTrackingId;
  final dynamic deliveryMan;

  Order({
    required this.id,
    required this.customerId,
    required this.isGuest,
    required this.customerType,
    required this.paymentStatus,
    required this.orderStatus,
    required this.paymentMethod,
    this.transactionRef,
    this.paymentBy,
    this.paymentNote,
    required this.orderAmount,
    required this.adminCommission,
    required this.isPause,
    this.cause,
    this.shippingAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.discountAmount,
    this.discountType,
    required this.couponCode,
    required this.couponDiscountBearer,
    required this.shippingResponsibility,
    required this.shippingMethodId,
    required this.shippingCost,
    required this.isShippingFree,
    required this.orderGroupId,
    required this.verificationCode,
    required this.verificationStatus,
    required this.sellerId,
    required this.sellerIs,
    this.shippingAddressData,
    this.deliveryManId,
    required this.deliverymanCharge,
    this.expectedDeliveryDate,
    this.orderNote,
    this.billingAddress,
    this.billingAddressData,
    required this.orderType,
    required this.extraDiscount,
    this.extraDiscountType,
    required this.freeDeliveryBearer,
    required this.checked,
    required this.shippingType,
    this.deliveryType,
    this.deliveryServiceName,
    this.thirdPartyDeliveryTrackingId,
    this.deliveryMan,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      isGuest: json['is_guest'] as bool,
      customerType: json['customer_type'] as String,
      paymentStatus: json['payment_status'] as String,
      orderStatus: json['order_status'] as String,
      paymentMethod: json['payment_method'] as String,
      transactionRef: json['transaction_ref'],
      paymentBy: json['payment_by'],
      paymentNote: json['payment_note'],
      orderAmount: json['order_amount'] as int,
      adminCommission: json['admin_commission'] as String,
      isPause: json['is_pause'] as bool,
      cause: json['cause'],
      shippingAddress: json['shipping_address'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      discountAmount: json['discount_amount'] as int,
      discountType: json['discount_type'],
      couponCode: json['coupon_code'] as String,
      couponDiscountBearer: json['coupon_discount_bearer'] as String,
      shippingResponsibility: json['shipping_responsibility'] as String,
      shippingMethodId: json['shipping_method_id'] as int,
      shippingCost: json['shipping_cost'] as int,
      isShippingFree: json['is_shipping_free'] as bool,
      orderGroupId: json['order_group_id'] as String,
      verificationCode: json['verification_code'] as String,
      verificationStatus: json['verification_status'] as bool,
      sellerId: json['seller_id'] as int,
      sellerIs: json['seller_is'] as String,
      shippingAddressData: json['shipping_address_data'],
      deliveryManId: json['delivery_man_id'],
      deliverymanCharge: json['deliveryman_charge'] as int,
      expectedDeliveryDate: json['expected_delivery_date'],
      orderNote: json['order_note'],
      billingAddress: json['billing_address'],
      billingAddressData: json['billing_address_data'],
      orderType: json['order_type'] as String,
      extraDiscount: json['extra_discount'] as int,
      extraDiscountType: json['extra_discount_type'],
      freeDeliveryBearer: json['free_delivery_bearer'] as String,
      checked: json['checked'] as bool,
      shippingType: json['shipping_type'] as String,
      deliveryType: json['delivery_type'],
      deliveryServiceName: json['delivery_service_name'],
      thirdPartyDeliveryTrackingId: json['third_party_delivery_tracking_id'],
      deliveryMan: json['delivery_man'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'is_guest': isGuest,
        'customer_type': customerType,
        'payment_status': paymentStatus,
        'order_status': orderStatus,
        'payment_method': paymentMethod,
        'transaction_ref': transactionRef,
        'payment_by': paymentBy,
        'payment_note': paymentNote,
        'order_amount': orderAmount,
        'admin_commission': adminCommission,
        'is_pause': isPause,
        'cause': cause,
        'shipping_address': shippingAddress,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'discount_amount': discountAmount,
        'discount_type': discountType,
        'coupon_code': couponCode,
        'coupon_discount_bearer': couponDiscountBearer,
        'shipping_responsibility': shippingResponsibility,
        'shipping_method_id': shippingMethodId,
        'shipping_cost': shippingCost,
        'is_shipping_free': isShippingFree,
        'order_group_id': orderGroupId,
        'verification_code': verificationCode,
        'verification_status': verificationStatus,
        'seller_id': sellerId,
        'seller_is': sellerIs,
        'shipping_address_data': shippingAddressData,
        'delivery_man_id': deliveryManId,
        'deliveryman_charge': deliverymanCharge,
        'expected_delivery_date': expectedDeliveryDate,
        'order_note': orderNote,
        'billing_address': billingAddress,
        'billing_address_data': billingAddressData,
        'order_type': orderType,
        'extra_discount': extraDiscount,
        'extra_discount_type': extraDiscountType,
        'free_delivery_bearer': freeDeliveryBearer,
        'checked': checked,
        'shipping_type': shippingType,
        'delivery_type': deliveryType,
        'delivery_service_name': deliveryServiceName,
        'third_party_delivery_tracking_id': thirdPartyDeliveryTrackingId,
        'delivery_man': deliveryMan,
      };
}
