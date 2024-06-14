import 'dart:convert';

class BannerList {
  List<MainBanner> mainBanner;

  BannerList({required this.mainBanner});

  factory BannerList.fromJson(Map<String, dynamic> json) {
    return BannerList(
      mainBanner: List<MainBanner>.from(
          json['main_banner'].map((x) => MainBanner.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main_banner': List<dynamic>.from(mainBanner.map((x) => x.toJson())),
    };
  }
}

class MainBanner {
  int id;
  String photo;
  String mobilePhoto;
  String bannerType;
  String theme;
  int published;
  DateTime createdAt;
  DateTime updatedAt;
  String url;
  String resourceType;
  int resourceId;
  String title;
  String? subTitle;
  String? buttonText;
  String backgroundColor;

  MainBanner({
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
    required this.title,
    this.subTitle,
    this.buttonText,
    required this.backgroundColor,
  });

  factory MainBanner.fromJson(Map<String, dynamic> json) {
    return MainBanner(
      id: json['id'],
      photo: json['photo'],
      mobilePhoto: json['mobile_photo'],
      bannerType: json['banner_type'],
      theme: json['theme'],
      published: json['published'],
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
      'published': published,
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
