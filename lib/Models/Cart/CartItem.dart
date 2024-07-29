import 'dart:convert';

class CartList {
  final List<CartItem> carts;

  CartList({required this.carts});

  factory CartList.fromJson(List<dynamic> json) {
    return CartList(
      carts: json
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  List<dynamic> toJson() => carts.map((e) => e.toJson()).toList();
}

class CartItem {
  final int id;
  final int customerId;
  final String cartGroupId;
  final int productId;
  final String productType;
  final String? digitalProductType;
  final String? color;
  final Map<String, dynamic>? choices;
  final Map<String, dynamic>? variations;
  final String variant;
  int quantity;
  final double price;
  final double tax;
  final double discount;
  final String taxModel;
  final String slug;
  final String name;
  final String thumbnail;
  final int sellerId;
  final String sellerIs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String shopInfo;
  final double shippingCost;
  final String shippingType;
  final int isGuest;
  final double minimumOrderAmountInfo;
  final FreeDeliveryOrderAmount freeDeliveryOrderAmount;
  final Product product;

  CartItem({
    required this.id,
    required this.customerId,
    required this.cartGroupId,
    required this.productId,
    required this.productType,
    this.digitalProductType,
    this.color,
    this.choices,
    this.variations,
    required this.variant,
    required this.quantity,
    required this.price,
    required this.tax,
    required this.discount,
    required this.taxModel,
    required this.slug,
    required this.name,
    required this.thumbnail,
    required this.sellerId,
    required this.sellerIs,
    required this.createdAt,
    required this.updatedAt,
    required this.shopInfo,
    required this.shippingCost,
    required this.shippingType,
    required this.isGuest,
    required this.minimumOrderAmountInfo,
    required this.freeDeliveryOrderAmount,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      cartGroupId: json['cart_group_id'] as String,
      productId: json['product_id'] as int,
      productType: json['product_type'] as String,
      digitalProductType: json['digital_product_type'] as String?,
      color: json['color'] as String?,
      choices: _parseJsonField(json['choices']),
      variations: _parseJsonField(json['variations']),
      variant: json['variant'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      taxModel: json['tax_model'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      sellerId: json['seller_id'] as int,
      sellerIs: json['seller_is'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      shopInfo: json['shop_info'] as String,
      shippingCost: (json['shipping_cost'] as num).toDouble(),
      shippingType: json['shipping_type'] as String,
      isGuest: json['is_guest'] as int,
      minimumOrderAmountInfo:
          (json['minimum_order_amount_info'] as num).toDouble(),
      freeDeliveryOrderAmount: FreeDeliveryOrderAmount.fromJson(
          json['free_delivery_order_amount'] as Map<String, dynamic>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  static Map<String, dynamic>? _parseJsonField(dynamic field) {
    if (field == null) {
      return null;
    } else if (field is String) {
      return jsonDecode(field) as Map<String, dynamic>?;
    } else {
      return field as Map<String, dynamic>?;
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'cart_group_id': cartGroupId,
        'product_id': productId,
        'product_type': productType,
        'digital_product_type': digitalProductType,
        'color': color,
        'choices': choices,
        'variations': variations,
        'variant': variant,
        'quantity': quantity,
        'price': price,
        'tax': tax,
        'discount': discount,
        'tax_model': taxModel,
        'slug': slug,
        'name': name,
        'thumbnail': thumbnail,
        'seller_id': sellerId,
        'seller_is': sellerIs,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'shop_info': shopInfo,
        'shipping_cost': shippingCost,
        'shipping_type': shippingType,
        'is_guest': isGuest,
        'minimum_order_amount_info': minimumOrderAmountInfo,
        'free_delivery_order_amount': freeDeliveryOrderAmount.toJson(),
        'product': product.toJson(),
      };
}

class FreeDeliveryOrderAmount {
  final int status;
  final double amount;
  final int percentage;
  final double amountNeed;
  final double shippingCostSaved;
  final String cartId;
  final String responsibility;

  FreeDeliveryOrderAmount({
    required this.status,
    required this.amount,
    required this.percentage,
    required this.amountNeed,
    required this.shippingCostSaved,
    required this.cartId,
    required this.responsibility,
  });

  factory FreeDeliveryOrderAmount.fromJson(Map<String, dynamic> json) {
    return FreeDeliveryOrderAmount(
      status: json['status'] as int,
      amount: (json['amount'] as num).toDouble(),
      percentage: json['percentage'] as int,
      amountNeed: (json['amount_need'] as num).toDouble(),
      shippingCostSaved: (json['shipping_cost_saved'] as num).toDouble(),
      cartId: json['cart_id'] as String,
      responsibility: json['responsibility'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'amount': amount,
        'percentage': percentage,
        'amount_need': amountNeed,
        'shipping_cost_saved': shippingCostSaved,
        'cart_id': cartId,
        'responsibility': responsibility,
      };
}

class Product {
  final int id;
  final String name;
  final String slug;
  final int currentStock;
  final int minimumOrderQty;
  final int reviewsCount;
  final int totalCurrentStock;
  final List<dynamic> translations;
  final List<Review> reviews;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.reviewsCount,
    required this.totalCurrentStock,
    required this.translations,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      currentStock: json['current_stock'] as int,
      minimumOrderQty: json['minimum_order_qty'] as int,
      reviewsCount: json['reviews_count'] as int,
      totalCurrentStock: json['total_current_stock'] as int,
      translations: json['translations'] as List<dynamic>,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'current_stock': currentStock,
        'minimum_order_qty': minimumOrderQty,
        'reviews_count': reviewsCount,
        'total_current_stock': totalCurrentStock,
        'translations': translations,
        'reviews': reviews.map((e) => e.toJson()).toList(),
      };
}

class Review {
  final int id;
  final int productId;
  final int customerId;
  final int? deliveryManId;
  final int? orderId;
  final String comment;
  final String attachment;
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
      deliveryManId: json['delivery_man_id'] as int?,
      orderId: json['order_id'] as int?,
      comment: json['comment'] as String,
      attachment: json['attachment'] as String,
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
