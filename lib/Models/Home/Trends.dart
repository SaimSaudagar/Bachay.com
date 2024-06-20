class TrendsBannerList {
  List<TrendsBanner> banners;

  TrendsBannerList({required this.banners});

  factory TrendsBannerList.fromJson(Map<String, dynamic> json) {
    return TrendsBannerList(
      banners: List<TrendsBanner>.from(
          json['trends_banner'].map((x) => TrendsBanner.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trends_banner': List<dynamic>.from(banners.map((x) => x.toJson())),
    };
  }
}

class TrendsBanner {
  int id;
  String photo;
  String mobilePhoto;
  String bannerType;
  String theme;
  bool published;
  DateTime createdAt;
  DateTime updatedAt;
  String url;
  String resourceType;
  int resourceId;
  String? title;
  String? subTitle;
  String? buttonText;
  String backgroundColor;

  TrendsBanner({
    required this.id,
    required this.photo,
    required this.mobilePhoto,
    required this.bannerType,
    required this.theme,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.resourceType,
    required this.resourceId,
    this.title,
    this.subTitle,
    this.buttonText,
    required this.backgroundColor,
  });

  factory TrendsBanner.fromJson(Map<String, dynamic> json) {
    return TrendsBanner(
      id: json['id'],
      photo: json['photo'],
      mobilePhoto: json['mobile_photo'],
      bannerType: json['banner_type'],
      theme: json['theme'],
      published: json['published'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      url: json['url'],
      resourceType: json['resource_type'],
      resourceId: json['resource_id'],
      title: json['title'],
      subTitle: json['sub_title'],
      buttonText: json['button_text'],
      backgroundColor: json['background_color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'mobile_photo': mobilePhoto,
      'banner_type': bannerType,
      'theme': theme,
      'published': published ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'url': url,
      'resource_type': resourceType,
      'resource_id': resourceId,
      'title': title,
      'sub_title': subTitle,
      'button_text': buttonText,
      'background_color': backgroundColor,
    };
  }
}
