class DiscountBannerList {
  final List<DiscountBanner> discountBanner;

  DiscountBannerList({required this.discountBanner});

  factory DiscountBannerList.fromJson(List<dynamic> jsonList) {
    return DiscountBannerList(
      discountBanner: jsonList
          .map((x) => DiscountBanner.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }

  List<dynamic> toJson() => discountBanner.map((x) => x.toJson()).toList();
}

class DiscountBanner {
  int? id;
  String? title;
  String? image;
  int? isMobile;
  int? isWeb;
  String? resourceType;
  int? resourceId;
  DateTime? createdAt;
  DateTime? updatedAt;

  DiscountBanner({
    this.id,
    this.title,
    this.image,
    this.isMobile,
    this.isWeb,
    this.resourceType,
    this.resourceId,
    this.createdAt,
    this.updatedAt,
  });

  factory DiscountBanner.fromJson(Map<String, dynamic> json) {
    return DiscountBanner(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      isMobile: json['is_mobile'] as int?,
      isWeb: json['is_web'] as int?,
      resourceType: json['resource_type'] as String?,
      resourceId: json['resource_id'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'is_mobile': isMobile,
        'is_web': isWeb,
        'resource_type': resourceType,
        'resource_id': resourceId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
