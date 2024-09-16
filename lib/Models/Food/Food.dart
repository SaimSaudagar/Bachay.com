// food_category_model.dart
class FoodCategory {
  final int id;
  final String name;

  FoodCategory({required this.id, required this.name});

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

// food_model.dart
class Food {
  final int id;
  final String name;
  final String nutrients;
  final String image;
  final List<AdditionalInfo> additionalInfo;

  Food({
    required this.id,
    required this.name,
    required this.nutrients,
    required this.image,
    required this.additionalInfo,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    var additionalInfoList = (json['additional_info'] as List)
        .map((info) => AdditionalInfo.fromJson(info))
        .toList();

    return Food(
      id: json['id'],
      name: json['name'],
      nutrients: json['nutrients'],
      image: json['image'],
      additionalInfo: additionalInfoList,
    );
  }
}

class AdditionalInfo {
  final String title;
  final String icon;
  final String description;

  AdditionalInfo({
    required this.title,
    required this.icon,
    required this.description,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
    );
  }
}
