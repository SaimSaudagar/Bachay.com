import 'dart:convert';

class CategoryList {
  final List<Category> categories;

  CategoryList({required this.categories});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String slug;
  String icon;
  int parentId;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  int homeStatus;
  int priority;
  int productCount;
  List<Category> childes;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.parentId,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.homeStatus,
    required this.priority,
    required this.productCount,
    required this.childes,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      icon: json['icon'],
      parentId: json['parent_id'],
      position: json['position'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      homeStatus: json['home_status'],
      priority: json['priority'],
      productCount: json['product_count'],
      childes: List<Category>.from(json['childes'].map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'icon': icon,
    'parent_id': parentId,
    'position': position,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'home_status': homeStatus,
    'priority': priority,
    'product_count': productCount,
    'childes': List<dynamic>.from(childes.map((x) => x.toJson())),
  };
}
