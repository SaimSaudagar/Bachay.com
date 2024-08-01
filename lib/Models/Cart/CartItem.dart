import 'dart:convert';

class CartItemList {
  final List<CartItem> cartItems;

  CartItemList({required this.cartItems});

  factory CartItemList.fromJson(List<dynamic> json) {
    return CartItemList(
      cartItems: json.map((item) => CartItem.fromJson(item)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return cartItems.map((item) => item.toJson()).toList();
  }
}

class CartItem {
  int id;
  int customerId;
  String cartGroupId;
  int productId;
  String productType;
  String? digitalProductType;
  String? color;
  Map<String, dynamic>? choices;
  Map<String, dynamic>? variations;
  String variant;
  int quantity;
  double price;
  double tax;
  double discount;
  String taxModel;
  String slug;
  String name;
  String thumbnail;
  int sellerId;
  String sellerIs;
  DateTime createdAt;
  DateTime updatedAt;
  String shopInfo;
  double shippingCost;
  String shippingType;
  int isGuest;
  int minimumOrderAmountInfo;
  FreeDeliveryOrderAmount freeDeliveryOrderAmount;
  CartProduct product;

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
    try {
      return CartItem(
        id: json['id'] as int,
        customerId: json['customer_id'] as int,
        cartGroupId: json['cart_group_id'] as String,
        productId: json['product_id'] as int,
        productType: json['product_type'] as String,
        digitalProductType: json['digital_product_type'] as String?,
        color: json['color'] as String?,
        choices: json['choices'] as Map<String, dynamic>?,
        variations: json['variations'] as Map<String, dynamic>?,
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
        minimumOrderAmountInfo: json['minimum_order_amount_info'] as int,
        freeDeliveryOrderAmount: FreeDeliveryOrderAmount.fromJson(
            json['free_delivery_order_amount'] as Map<String, dynamic>),
        product: CartProduct.fromJson(json['product'] as Map<String, dynamic>),
      );
    } catch (e) {
      print("Error in CartItem.fromJson: $e"); // Error log
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
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
}

class FreeDeliveryOrderAmount {
  int status;
  int amount;
  int percentage;
  double amountNeed;
  int shippingCostSaved;
  String cartId;
  String responsibility;

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
      amount: json['amount'] as int,
      percentage: json['percentage'] as int,
      amountNeed: (json['amount_need'] as num).toDouble(),
      shippingCostSaved: json['shipping_cost_saved'] as int,
      cartId: json['cart_id'] as String,
      responsibility: json['responsibility'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'amount': amount,
      'percentage': percentage,
      'amount_need': amountNeed,
      'shipping_cost_saved': shippingCostSaved,
      'cart_id': cartId,
      'responsibility': responsibility,
    };
  }
}

class CartProduct {
  int id;
  String name;
  String slug;
  int currentStock;
  int minimumOrderQty;
  int reviewsCount;
  int totalCurrentStock;
  List<dynamic> translations;
  List<CartReview> reviews;

  CartProduct({
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

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      currentStock: json['current_stock'] as int,
      minimumOrderQty: json['minimum_order_qty'] as int,
      reviewsCount: json['reviews_count'] as int,
      totalCurrentStock: json['total_current_stock'] as int,
      translations: json['translations'] as List<dynamic>,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => CartReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'current_stock': currentStock,
      'minimum_order_qty': minimumOrderQty,
      'reviews_count': reviewsCount,
      'total_current_stock': totalCurrentStock,
      'translations': translations,
      'reviews': reviews.map((review) => review.toJson()).toList(),
    };
  }
}

class CartReview {
  int id;
  int productId;
  int customerId;
  int? deliveryManId;
  int? orderId;
  String comment;
  String attachment;
  int rating;
  int status;
  bool isSaved;
  DateTime createdAt;
  DateTime updatedAt;

  CartReview({
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

  factory CartReview.fromJson(Map<String, dynamic> json) {
    return CartReview(
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
    };
  }
}
