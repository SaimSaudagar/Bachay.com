class FoodDetail {
  final Food food;

  FoodDetail({required this.food});

  factory FoodDetail.fromJson(Map<String, dynamic> json) {
    return FoodDetail(
      food: Food.fromJson(json['food']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(),
    };
  }
}

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
    return Food(
      id: json['id'],
      name: json['name'],
      nutrients: json['nutrients'],
      image: json['image'],
      additionalInfo: List<AdditionalInfo>.from(
        json['additional_info'].map((info) => AdditionalInfo.fromJson(info)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nutrients': nutrients,
      'image': image,
      'additional_info': additionalInfo.map((info) => info.toJson()).toList(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
      'description': description,
    };
  }
}
