class DealBannerList {
  final List<DealBanner> dealBanner;

  DealBannerList({required this.dealBanner});

  factory DealBannerList.fromJson(Map<String, dynamic> json) {
    return DealBannerList(
      dealBanner: (json['promo_deal_banner'] as List<dynamic>)
          .map((x) => DealBanner.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'promo_deal_banner': dealBanner.map((x) => x.toJson()).toList(),
      };
}

class DealBanner {
  int? id;
  String? photo;
  String? mobilePhoto;
  String? bannerType;
  String? theme;
  int? published;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;
  String? resourceType;
  int? resourceId;
  String? title;
  String? subTitle;
  String? buttonText;
  String? backgroundColor;

  DealBanner({
    this.id,
    this.photo,
    this.mobilePhoto,
    this.bannerType,
    this.theme,
    this.published,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.resourceType,
    this.resourceId,
    this.title,
    this.subTitle,
    this.buttonText,
    this.backgroundColor,
  });

  factory DealBanner.fromJson(Map<String, dynamic> json) {
    return DealBanner(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      mobilePhoto: json['mobile_photo'] as String?,
      bannerType: json['banner_type'] as String?,
      theme: json['theme'] as String?,
      published: json['published'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      url: json['url'] as String?,
      resourceType: json['resource_type'] as String?,
      resourceId: json['resource_id'] as int?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      buttonText: json['button_text'] as String?,
      backgroundColor: json['background_color'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo': photo,
        'mobile_photo': mobilePhoto,
        'banner_type': bannerType,
        'theme': theme,
        'published': published,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'url': url,
        'resource_type': resourceType,
        'resource_id': resourceId,
        'title': title,
        'sub_title': subTitle,
        'button_text': buttonText,
        'background_color': backgroundColor,
      };
}
