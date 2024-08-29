class OrderList {
  final int totalSize;
  final int? limit;
  final int? offset;
  final List<Order> orders;

  OrderList({
    required this.totalSize,
    this.limit,
    this.offset,
    required this.orders,
  });

  factory OrderList.fromJson(Map<String?, dynamic> json) {
    return OrderList(
      totalSize: json['total_size'],
      limit: json['limit'],
      offset: json['offset'],
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String?, dynamic>))
          .toList(),
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'total_size': totalSize,
      'limit': limit,
      'offset': offset,
      'orders': orders.map((e) => e.toJson()).toList(),
    };
  }
}

class Order {
  final int id;
  final int customerId;
  final dynamic isGuest;
  final String? customerType;
  final String? paymentStatus;
  final String? orderStatus;
  final String? paymentMethod;
  final String? transactionRef;
  final dynamic paymentBy;
  final dynamic paymentNote;
  final double orderAmount;
  final String? adminCommission;
  final dynamic isPause;
  final dynamic cause;
  final dynamic shippingAddress;
  final String? createdAt;
  final String? updatedAt;
  final int discountAmount;
  final dynamic discountType;
  final String? couponCode;
  final String? couponDiscountBearer;
  final String? shippingResponsibility;
  final int shippingMethodId;
  final int shippingCost;
  final dynamic isShippingFree;
  final String? orderGroupId;
  final String? verificationCode;
  final dynamic verificationStatus;
  final int sellerId;
  final String? sellerIs;
  final dynamic shippingAddressData;
  final dynamic deliveryManId;
  final int deliverymanCharge;
  final dynamic expectedDeliveryDate;
  final dynamic orderNote;
  final dynamic billingAddress;
  final dynamic billingAddressData;
  final String? orderType;
  final int extraDiscount;
  final dynamic extraDiscountType;
  final String? freeDeliveryBearer;
  final dynamic checked;
  final String? shippingType;
  final dynamic deliveryType;
  final dynamic deliveryServiceName;
  final dynamic thirdPartyDeliveryTrackingId;
  final String? orderDetailsCount;
  final String? thumbnail;
  final List<OrderDetail> details;
  final dynamic deliveryMan;
  final Seller? seller;

  Order({
    required this.id,
    required this.customerId,
    required this.isGuest,
    required this.customerType,
    required this.paymentStatus,
    required this.orderStatus,
    required this.paymentMethod,
    required this.transactionRef,
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
    required this.orderDetailsCount,
    required this.thumbnail,
    required this.details,
    this.deliveryMan,
    this.seller,
  });

  factory Order.fromJson(Map<String?, dynamic> json) {
    return Order(
      id: json['id'],
      customerId: json['customer_id'],
      isGuest: json['is_guest'],
      customerType: json['customer_type'],
      paymentStatus: json['payment_status'],
      orderStatus: json['order_status'],
      paymentMethod: json['payment_method'],
      transactionRef: json['transaction_ref'],
      paymentBy: json['payment_by'],
      paymentNote: json['payment_note'],
      orderAmount: json['order_amount'].toDouble(),
      adminCommission: json['admin_commission'],
      isPause: json['is_pause'],
      cause: json['cause'],
      shippingAddress: json['shipping_address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      discountAmount: json['discount_amount'],
      discountType: json['discount_type'],
      couponCode: json['coupon_code'],
      couponDiscountBearer: json['coupon_discount_bearer'],
      shippingResponsibility: json['shipping_responsibility'],
      shippingMethodId: json['shipping_method_id'],
      shippingCost: json['shipping_cost'],
      isShippingFree: json['is_shipping_free'],
      orderGroupId: json['order_group_id'],
      verificationCode: json['verification_code'],
      verificationStatus: json['verification_status'],
      sellerId: json['seller_id'],
      sellerIs: json['seller_is'],
      shippingAddressData: json['shipping_address_data'],
      deliveryManId: json['delivery_man_id'],
      deliverymanCharge: json['deliveryman_charge'],
      expectedDeliveryDate: json['expected_delivery_date'],
      orderNote: json['order_note'],
      billingAddress: json['billing_address'],
      billingAddressData: json['billing_address_data'],
      orderType: json['order_type'],
      extraDiscount: json['extra_discount'],
      extraDiscountType: json['extra_discount_type'],
      freeDeliveryBearer: json['free_delivery_bearer'],
      checked: json['checked'],
      shippingType: json['shipping_type'],
      deliveryType: json['delivery_type'],
      deliveryServiceName: json['delivery_service_name'],
      thirdPartyDeliveryTrackingId: json['third_party_delivery_tracking_id'],
      orderDetailsCount: json['order_details_count'],
      thumbnail: json['thumbnail'],
      details: (json['details'] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e as Map<String?, dynamic>))
          .toList(),
      deliveryMan: json['delivery_man'],
      seller: json['seller'] != null
          ? Seller.fromJson(json['seller'] as Map<String?, dynamic>)
          : null,
    );
  }

  Map<String?, dynamic> toJson() {
    return {
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
      'created_at': createdAt,
      'updated_at': updatedAt,
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
      'order_details_count': orderDetailsCount,
      'thumbnail': thumbnail,
      'details': details.map((e) => e.toJson()).toList(),
      'delivery_man': deliveryMan,
      'seller': seller?.toJson(),
    };
  }
}

class OrderDetail {
  final int id;
  final int orderId;
  final int productId;
  final int sellerId;
  final dynamic digitalFileAfterSell;
  final String? productDetails;
  final int qty;
  final double price;
  final int tax;
  final double discount;
  final String? taxModel;
  final String? deliveryStatus;
  final String? paymentStatus;
  final String? createdAt;
  final String? updatedAt;
  final dynamic shippingMethodId;
  final String? variant;
  final String? variation;
  final String? discountType;
  final dynamic isStockDecreased;
  final int refundRequest;
  final Product product;

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
  });

  factory OrderDetail.fromJson(Map<String?, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      sellerId: json['seller_id'],
      digitalFileAfterSell: json['digital_file_after_sell'],
      productDetails: json['product_details'],
      qty: json['qty'],
      price: json['price'].toDouble(),
      tax: json['tax'],
      discount: json['discount'].toDouble(),
      taxModel: json['tax_model'],
      deliveryStatus: json['delivery_status'],
      paymentStatus: json['payment_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      shippingMethodId: json['shipping_method_id'],
      variant: json['variant'],
      variation: json['variation'],
      discountType: json['discount_type'],
      isStockDecreased: json['is_stock_decreased'],
      refundRequest: json['refund_request'],
      product: Product.fromJson(json['product']),
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'product_id': productId,
      'seller_id': sellerId,
      'digital_file_after_sell': digitalFileAfterSell,
      'product_details': productDetails,
      'qty': qty,
      'price': price,
      'tax': tax,
      'discount': discount,
      'tax_model': taxModel,
      'delivery_status': deliveryStatus,
      'payment_status': paymentStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'shipping_method_id': shippingMethodId,
      'variant': variant,
      'variation': variation,
      'discount_type': discountType,
      'is_stock_decreased': isStockDecreased,
      'refund_request': refundRequest,
      'product': product.toJson(),
    };
  }
}

class Product {
  final int id;
  final String? addedBy;
  final int userId;
  final String? name;
  final String? slug;
  final String? gender;
  final String? productType;
  final String? categoryIds;
  final int categoryId;
  final dynamic subCategoryId;
  final dynamic subSubCategoryId;
  final int brandId;
  final String? unit;
  final int minQty;
  final int refundable;
  final dynamic digitalProductType;
  final dynamic digitalFileReady;
  final String? images;
  final String? colorImage;
  final String? thumbnail;
  final dynamic featured;
  final dynamic flashDeal;
  final String? videoProvider;
  final dynamic videoUrl;
  final String? colors;
  final dynamic sizes;
  final int variantProduct;
  final String? attributes;
  // final List<ChoiceOption> choiceOptions;
  final String? variation;
  final int published;
  final double unitPrice;
  final double purchasePrice;
  final int tax;
  final String? taxType;
  final String? taxModel;
  final double discount;
  final String? discountType;
  final int currentStock;
  final int minimumOrderQty;
  final String? details;
  final int freeShipping;
  final dynamic attachment;
  final String? createdAt;
  final String? updatedAt;
  final int status;
  final int featuredStatus;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final dynamic metaImage;
  final int requestStatus;
  final dynamic deniedNote;
  final int shippingCost;
  final int multiplyQty;
  final dynamic tempShippingCost;
  final dynamic isShippingCostUpdated;
  final String? code;
  final int reviewsCount;
  final List<dynamic> translations;
  final List<dynamic> reviews;

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
    // required this.choiceOptions,
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
    this.metaImage,
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
  });

  factory Product.fromJson(Map<String?, dynamic> json) {
    return Product(
      id: json['id'],
      addedBy: json['added_by'],
      userId: json['user_id'],
      name: json['name'],
      slug: json['slug'],
      gender: json['gender'],
      productType: json['product_type'],
      categoryIds: json['category_ids'],
      categoryId: json['category_id'],
      subCategoryId: json['sub_category_id'],
      subSubCategoryId: json['sub_sub_category_id'],
      brandId: json['brand_id'],
      unit: json['unit'],
      minQty: json['min_qty'],
      refundable: json['refundable'],
      digitalProductType: json['digital_product_type'],
      digitalFileReady: json['digital_file_ready'],
      images: json['images'],
      colorImage: json['color_image'],
      thumbnail: json['thumbnail'],
      featured: json['featured'],
      flashDeal: json['flash_deal'],
      videoProvider: json['video_provider'],
      videoUrl: json['video_url'],
      colors: json['colors'],
      sizes: json['sizes'],
      variantProduct: json['variant_product'],
      attributes: json['attributes'],
      // choiceOptions: (json['choice_options'] as List<dynamic>)
      //     .map((e) => ChoiceOption.fromJson(e as Map<String?, dynamic>))
      //     .toList(),
      variation: json['variation'],
      published: json['published'],
      unitPrice: json['unit_price'].toDouble(),
      purchasePrice: json['purchase_price'].toDouble(),
      tax: json['tax'],
      taxType: json['tax_type'],
      taxModel: json['tax_model'],
      discount: json['discount'].toDouble(),
      discountType: json['discount_type'],
      currentStock: json['current_stock'],
      minimumOrderQty: json['minimum_order_qty'],
      details: json['details'],
      freeShipping: json['free_shipping'],
      attachment: json['attachment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      featuredStatus: json['featured_status'],
      metaTitle: json['meta_title'],
      metaDescription: json['meta_description'],
      metaImage: json['meta_image'],
      requestStatus: json['request_status'],
      deniedNote: json['denied_note'],
      shippingCost: json['shipping_cost'],
      multiplyQty: json['multiply_qty'],
      tempShippingCost: json['temp_shipping_cost'],
      isShippingCostUpdated: json['is_shipping_cost_updated'],
      code: json['code'],
      reviewsCount: json['reviews_count'],
      translations: json['translations'] as List<dynamic>,
      reviews: json['reviews'] as List<dynamic>,
    );
  }

  Map<String?, dynamic> toJson() {
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
      // 'choice_options': choiceOptions.map((e) => e.toJson()).toList(),
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
      'created_at': createdAt,
      'updated_at': updatedAt,
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
      'reviews': reviews,
    };
  }
}

class Seller {
  final int id;
  final String? fName;
  final String? lName;
  final String? phone;
  final String? image;
  final String? email;
  final String? password;
  final String? status;
  final String? rememberToken;
  final String? createdAt;
  final String? updatedAt;
  final dynamic bankName;
  final dynamic branch;
  final dynamic accountNo;
  final dynamic holderName;
  final dynamic authToken;
  final dynamic salesCommissionPercentage;
  final dynamic gst;
  final dynamic cmFirebaseToken;
  final int posStatus;
  final int minimumOrderAmount;
  final int freeDeliveryStatus;
  final int freeDeliveryOverAmount;
  final String? appLanguage;
  final Shop shop;

  Seller({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.image,
    required this.email,
    required this.password,
    required this.status,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    this.bankName,
    this.branch,
    this.accountNo,
    this.holderName,
    this.authToken,
    this.salesCommissionPercentage,
    this.gst,
    this.cmFirebaseToken,
    required this.posStatus,
    required this.minimumOrderAmount,
    required this.freeDeliveryStatus,
    required this.freeDeliveryOverAmount,
    required this.appLanguage,
    required this.shop,
  });

  factory Seller.fromJson(Map<String?, dynamic> json) {
    return Seller(
      id: json['id'],
      fName: json['f_name'],
      lName: json['l_name'],
      phone: json['phone'],
      image: json['image'],
      email: json['email'],
      password: json['password'],
      status: json['status'],
      rememberToken: json['remember_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      bankName: json['bank_name'],
      branch: json['branch'],
      accountNo: json['account_no'],
      holderName: json['holder_name'],
      authToken: json['auth_token'],
      salesCommissionPercentage: json['sales_commission_percentage'],
      gst: json['gst'],
      cmFirebaseToken: json['cm_firebase_token'],
      posStatus: json['pos_status'],
      minimumOrderAmount: json['minimum_order_amount'],
      freeDeliveryStatus: json['free_delivery_status'],
      freeDeliveryOverAmount: json['free_delivery_over_amount'],
      appLanguage: json['app_language'],
      shop: Shop.fromJson(json['shop']),
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'f_name': fName,
      'l_name': lName,
      'phone': phone,
      'image': image,
      'email': email,
      'password': password,
      'status': status,
      'remember_token': rememberToken,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'bank_name': bankName,
      'branch': branch,
      'account_no': accountNo,
      'holder_name': holderName,
      'auth_token': authToken,
      'sales_commission_percentage': salesCommissionPercentage,
      'gst': gst,
      'cm_firebase_token': cmFirebaseToken,
      'pos_status': posStatus,
      'minimum_order_amount': minimumOrderAmount,
      'free_delivery_status': freeDeliveryStatus,
      'free_delivery_over_amount': freeDeliveryOverAmount,
      'app_language': appLanguage,
      'shop': shop.toJson(),
    };
  }
}

class Shop {
  final int id;
  final int sellerId;
  final String? name;
  final String? address;
  final String? contact;
  final String? image;
  final String? bottomBanner;
  final dynamic offerBanner;
  final dynamic vacationStartDate;
  final dynamic vacationEndDate;
  final dynamic vacationNote;
  final dynamic vacationStatus;
  final dynamic temporaryClose;
  final String? createdAt;
  final String? updatedAt;
  final String? banner;

  Shop({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.address,
    required this.contact,
    required this.image,
    required this.bottomBanner,
    this.offerBanner,
    this.vacationStartDate,
    this.vacationEndDate,
    this.vacationNote,
    required this.vacationStatus,
    required this.temporaryClose,
    required this.createdAt,
    required this.updatedAt,
    required this.banner,
  });

  factory Shop.fromJson(Map<String?, dynamic> json) {
    return Shop(
      id: json['id'],
      sellerId: json['seller_id'],
      name: json['name'],
      address: json['address'],
      contact: json['contact'],
      image: json['image'],
      bottomBanner: json['bottom_banner'],
      offerBanner: json['offer_banner'],
      vacationStartDate: json['vacation_start_date'],
      vacationEndDate: json['vacation_end_date'],
      vacationNote: json['vacation_note'],
      vacationStatus: json['vacation_status'],
      temporaryClose: json['temporary_close'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      banner: json['banner'],
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'id': id,
      'seller_id': sellerId,
      'name': name,
      'address': address,
      'contact': contact,
      'image': image,
      'bottom_banner': bottomBanner,
      'offer_banner': offerBanner,
      'vacation_start_date': vacationStartDate,
      'vacation_end_date': vacationEndDate,
      'vacation_note': vacationNote,
      'vacation_status': vacationStatus,
      'temporary_close': temporaryClose,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'banner': banner,
    };
  }
}
