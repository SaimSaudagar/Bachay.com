class SingleProduct {
  int id;
  String addedBy;
  int userId;
  String name;
  String slug;
  String gender;
  String productType;
  List<SingleProductCategoryId> categoryIds;
  int categoryId;
  dynamic subCategoryId;
  dynamic subSubCategoryId;
  int brandId;
  String unit;
  int minQty;
  int refundable;
  dynamic digitalProductType;
  dynamic digitalFileReady;
  List<String> images;
  List<SingleProductColorImage> colorImage;
  String thumbnail;
  dynamic featured;
  dynamic flashDeal;
  String videoProvider;
  dynamic videoUrl;
  List<String> colors;
  dynamic sizes;
  int variantProduct;
  List<int> attributes;
  List<SingleProductChoiceOption> choiceOptions;
  List<SingleProductVariation> variation;
  int published;
  double unitPrice;
  double purchasePrice;
  double tax;
  String taxType;
  String taxModel;
  double discount;
  String discountType;
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
  String metaImage;
  int requestStatus;
  dynamic deniedNote;
  int shippingCost;
  int multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String code;
  int wishListCount;
  int reviewsCount;
  List<ColorsFormatted> colorsFormatted;
  List<SingleProductReview> reviews;
  dynamic seller;
  List<Tag> tags;
  List<dynamic> translations;
  dynamic averageReview;
  dynamic inhouseVacationStartDate;
  dynamic inhouseVacationEndDate;
  dynamic inhouseTemporaryClose;

  SingleProduct({
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
    required this.wishListCount,
    required this.reviewsCount,
    required this.colorsFormatted,
    required this.reviews,
    this.seller,
    required this.tags,
    required this.translations,
    required this.averageReview,
    this.inhouseVacationStartDate,
    this.inhouseVacationEndDate,
    required this.inhouseTemporaryClose,
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) {
    return SingleProduct(
      id: json['id'] ?? 0,
      addedBy: json['added_by'] ?? '',
      userId: json['user_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      gender: json['gender'] ?? '',
      productType: json['product_type'] ?? '',
      categoryIds: List<SingleProductCategoryId>.from(
          json['category_ids'].map((x) => SingleProductCategoryId.fromJson(x))),
      categoryId: json['category_id'] ?? 0,
      subCategoryId: json['sub_category_id'],
      subSubCategoryId: json['sub_sub_category_id'],
      brandId: json['brand_id'] ?? 0,
      unit: json['unit'] ?? '',
      minQty: json['min_qty'] ?? 0,
      refundable: json['refundable'] ?? 0,
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: List<String>.from(json['images']),
      colorImage: List<SingleProductColorImage>.from(
          json['color_image'].map((x) => SingleProductColorImage.fromJson(x))),
      thumbnail: json['thumbnail'] ?? '',
      featured: json['featured'],
      flashDeal: json['flash_deal'],
      videoProvider: json['video_provider'] ?? '',
      videoUrl: json['video_url'],
      colors: List<String>.from(json['colors']),
      sizes: json['sizes'],
      variantProduct: json['variant_product'] ?? 0,
      attributes: List<int>.from(json['attributes']),
      choiceOptions: List<SingleProductChoiceOption>.from(json['choice_options']
          .map((x) => SingleProductChoiceOption.fromJson(x))),
      variation: List<SingleProductVariation>.from(
          json['variation'].map((x) => SingleProductVariation.fromJson(x))),
      published: json['published'] ?? 0,
      unitPrice: json['unit_price']?.toDouble() ?? 0.0,
      purchasePrice: json['purchase_price']?.toDouble() ?? 0.0,
      tax: json['tax']?.toDouble() ?? 0.0,
      taxType: json['tax_type'] ?? '',
      taxModel: json['tax_model'] ?? '',
      discount: json['discount']?.toDouble() ?? 0.0,
      discountType: json['discount_type'] ?? '',
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
      metaImage: json['meta_image'] ?? '',
      requestStatus: json['request_status'] ?? 0,
      deniedNote: json['denied_note'],
      shippingCost: json['shipping_cost'] ?? 0,
      multiplyQty: json['multiply_qty'] ?? 0,
      tempShippingCost: json['temp_shipping_cost'],
      isShippingCostUpdated: json['is_shipping_cost_updated'],
      code: json['code'] ?? '',
      wishListCount: json['wish_list_count'] ?? 0,
      reviewsCount: json['reviews_count'] ?? 0,
      colorsFormatted: List<ColorsFormatted>.from(
          json['colors_formatted'].map((x) => ColorsFormatted.fromJson(x))),
      reviews: List<SingleProductReview>.from(
          json['reviews'].map((x) => SingleProductReview.fromJson(x))),
      seller: json['seller'],
      tags: List<Tag>.from(json['tags'].map((x) => Tag.fromJson(x))),
      translations: List<dynamic>.from(json['translations']),
      averageReview: json['average_review'],
      inhouseVacationStartDate: json['inhouse_vacation_start_date'],
      inhouseVacationEndDate: json['inhouse_vacation_end_date'],
      inhouseTemporaryClose: json['inhouse_temporary_close'] ?? 0,
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
      'category_ids': List<dynamic>.from(categoryIds.map((x) => x.toJson())),
      'category_id': categoryId,
      'sub_category_id': subCategoryId,
      'sub_sub_category_id': subSubCategoryId,
      'brand_id': brandId,
      'unit': unit,
      'min_qty': minQty,
      'refundable': refundable,
      'digital_product_type': digitalProductType,
      'digital_file_ready': digitalFileReady,
      'images': List<dynamic>.from(images.map((x) => x)),
      'color_image': List<dynamic>.from(colorImage.map((x) => x.toJson())),
      'thumbnail': thumbnail,
      'featured': featured,
      'flash_deal': flashDeal,
      'video_provider': videoProvider,
      'video_url': videoUrl,
      'colors': List<dynamic>.from(colors.map((x) => x)),
      'sizes': sizes,
      'variant_product': variantProduct,
      'attributes': List<dynamic>.from(attributes.map((x) => x)),
      'choice_options':
          List<dynamic>.from(choiceOptions.map((x) => x.toJson())),
      'variation': List<dynamic>.from(variation.map((x) => x.toJson())),
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
      'wish_list_count': wishListCount,
      'reviews_count': reviewsCount,
      'colors_formatted':
          List<dynamic>.from(colorsFormatted.map((x) => x.toJson())),
      'reviews': List<dynamic>.from(reviews.map((x) => x.toJson())),
      'seller': seller,
      'tags': List<dynamic>.from(tags.map((x) => x.toJson())),
      'translations': List<dynamic>.from(translations),
      'average_review': averageReview,
      'inhouse_vacation_start_date': inhouseVacationStartDate,
      'inhouse_vacation_end_date': inhouseVacationEndDate,
      'inhouse_temporary_close': inhouseTemporaryClose,
    };
  }
}

class SingleProductCategoryId {
  String id; // This should be String to match the JSON
  int position;

  SingleProductCategoryId({
    required this.id,
    required this.position,
  });

  factory SingleProductCategoryId.fromJson(Map<String, dynamic> json) {
    return SingleProductCategoryId(
      id: json['id'], // JSON field is a string
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

class SingleProductColorImage {
  String imageName;
  String color;

  SingleProductColorImage({
    required this.imageName,
    required this.color,
  });

  factory SingleProductColorImage.fromJson(Map<String, dynamic> json) {
    return SingleProductColorImage(
      imageName: json['image_name'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_name': imageName,
      'color': color,
    };
  }
}

class SingleProductChoiceOption {
  String name;
  String title;
  List<String> options;

  SingleProductChoiceOption({
    required this.name,
    required this.title,
    required this.options,
  });

  factory SingleProductChoiceOption.fromJson(Map<String, dynamic> json) {
    return SingleProductChoiceOption(
      name: json['name'],
      title: json['title'],
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'options': List<dynamic>.from(options.map((x) => x)),
    };
  }
}

class SingleProductVariation {
  String type;
  double price;
  String sku;
  int qty;

  SingleProductVariation({
    required this.type,
    required this.price,
    required this.sku,
    required this.qty,
  });

  factory SingleProductVariation.fromJson(Map<String, dynamic> json) {
    return SingleProductVariation(
      type: json['type'],
      price: json['price']?.toDouble() ?? 0.0,
      sku: json['sku'],
      qty: json['qty'] ?? 0,
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

class ColorsFormatted {
  String name;
  String code;
  String image;

  ColorsFormatted({
    required this.name,
    required this.code,
    required this.image,
  });

  factory ColorsFormatted.fromJson(Map<String, dynamic> json) {
    return ColorsFormatted(
      name: json['name'],
      code: json['code'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'image': image,
    };
  }
}

class SingleProductReview {
  int id;
  int productId;
  int customerId;
  dynamic deliveryManId;
  dynamic orderId;
  String comment;
  String attachment;
  int rating;
  int status;
  dynamic isSaved;
  DateTime createdAt;
  DateTime updatedAt;
  Customer customer;

  SingleProductReview({
    required this.id,
    required this.productId,
    required this.customerId,
    this.deliveryManId,
    this.orderId,
    required this.comment,
    required this.attachment,
    required this.rating,
    required this.status,
    this.isSaved,
    required this.createdAt,
    required this.updatedAt,
    required this.customer,
  });

  factory SingleProductReview.fromJson(Map<String, dynamic> json) {
    return SingleProductReview(
      id: json['id'] ?? 0,
      productId: json['product_id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      deliveryManId: json['delivery_man_id'],
      orderId: json['order_id'],
      comment: json['comment'] ?? '',
      attachment: json['attachment'] ?? '',
      rating: json['rating'] ?? 0,
      status: json['status'] ?? 0,
      isSaved: json['is_saved'],
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      customer: Customer.fromJson(json['customer']),
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
      'is_saved': isSaved,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'customer': customer.toJson(),
    };
  }
}

class Customer {
  int id;
  dynamic name;
  String fName;
  String lName;
  String phone;
  String image;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic streetAddress;
  dynamic country;
  dynamic city;
  dynamic zip;
  dynamic houseNo;
  dynamic apartmentNo;
  dynamic cmFirebaseToken;
  int isActive;
  dynamic paymentCardLastFour;
  dynamic paymentCardBrand;
  dynamic paymentCardFawryToken;
  dynamic loginMedium;
  dynamic socialId;
  int isPhoneVerified;
  dynamic temporaryToken;
  int isEmailVerified;
  dynamic walletBalance;
  int loyaltyPoint;
  int loginHitCount;
  int isTempBlocked;
  dynamic tempBlockTime;
  String referralCode;
  dynamic referredBy;
  String appLanguage;

  Customer({
    required this.id,
    this.name,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.streetAddress,
    this.country,
    this.city,
    this.zip,
    this.houseNo,
    this.apartmentNo,
    this.cmFirebaseToken,
    required this.isActive,
    this.paymentCardLastFour,
    this.paymentCardBrand,
    this.paymentCardFawryToken,
    this.loginMedium,
    this.socialId,
    required this.isPhoneVerified,
    this.temporaryToken,
    required this.isEmailVerified,
    this.walletBalance,
    required this.loyaltyPoint,
    required this.loginHitCount,
    required this.isTempBlocked,
    this.tempBlockTime,
    required this.referralCode,
    this.referredBy,
    required this.appLanguage,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? 0,
      name: json['name'],
      fName: json['f_name'] ?? '',
      lName: json['l_name'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
      emailVerifiedAt: json['email_verified_at'],
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      streetAddress: json['street_address'],
      country: json['country'],
      city: json['city'],
      zip: json['zip'],
      houseNo: json['house_no'],
      apartmentNo: json['apartment_no'],
      cmFirebaseToken: json['cm_firebase_token'],
      isActive: json['is_active'] ?? 0,
      paymentCardLastFour: json['payment_card_last_four'],
      paymentCardBrand: json['payment_card_brand'],
      paymentCardFawryToken: json['payment_card_fawry_token'],
      loginMedium: json['login_medium'],
      socialId: json['social_id'],
      isPhoneVerified: json['is_phone_verified'] ?? 0,
      temporaryToken: json['temporary_token'],
      isEmailVerified: json['is_email_verified'] ?? 0,
      walletBalance: json['wallet_balance'],
      loyaltyPoint: json['loyalty_point'] ?? 0,
      loginHitCount: json['login_hit_count'] ?? 0,
      isTempBlocked: json['is_temp_blocked'] ?? 0,
      tempBlockTime: json['temp_block_time'],
      referralCode: json['referral_code'] ?? '',
      referredBy: json['referred_by'],
      appLanguage: json['app_language'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'f_name': fName,
      'l_name': lName,
      'phone': phone,
      'image': image,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'street_address': streetAddress,
      'country': country,
      'city': city,
      'zip': zip,
      'house_no': houseNo,
      'apartment_no': apartmentNo,
      'cm_firebase_token': cmFirebaseToken,
      'is_active': isActive,
      'payment_card_last_four': paymentCardLastFour,
      'payment_card_brand': paymentCardBrand,
      'payment_card_fawry_token': paymentCardFawryToken,
      'login_medium': loginMedium,
      'social_id': socialId,
      'is_phone_verified': isPhoneVerified,
      'temporary_token': temporaryToken,
      'is_email_verified': isEmailVerified,
      'wallet_balance': walletBalance,
      'loyalty_point': loyaltyPoint,
      'login_hit_count': loginHitCount,
      'is_temp_blocked': isTempBlocked,
      'temp_block_time': tempBlockTime,
      'referral_code': referralCode,
      'referred_by': referredBy,
      'app_language': appLanguage,
    };
  }
}

class Tag {
  int id;
  String tag;
  int visitCount;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Tag({
    required this.id,
    required this.tag,
    required this.visitCount,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] ?? 0,
      tag: json['tag'] ?? '',
      visitCount: json['visit_count'] ?? 0,
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(
          json['updated_at'] ?? DateTime.now().toIso8601String()),
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tag': tag,
      'visit_count': visitCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'pivot': pivot.toJson(),
    };
  }
}

class Pivot {
  int productId;
  int tagId;

  Pivot({
    required this.productId,
    required this.tagId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      productId: json['product_id'] ?? 0,
      tagId: json['tag_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'tag_id': tagId,
    };
  }
}
