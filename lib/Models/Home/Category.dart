import 'dart:convert';

class CategoryList {
  final List<Category> categories;

  CategoryList({required this.categories});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((x) => Category.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        "categories": categories.map((x) => x.toJson()).toList(),
      };
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? homeStatus;
  int? priority;
  int? productCount;
  List<Category> childes;

  Category({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.parentId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.homeStatus,
    this.priority,
    this.productCount,
    required this.childes,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      icon: json['icon'] as String?,
      parentId: json['parent_id'] as int?,
      position: json['position'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      homeStatus: json['home_status'] as int?,
      priority: json['priority'] as int?,
      productCount: json['product_count'] as int?,
      childes: (json['childes'] as List<dynamic>?)
              ?.map((x) => Category.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'icon': icon,
        'parent_id': parentId,
        'position': position,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'home_status': homeStatus,
        'priority': priority,
        'product_count': productCount,
        'childes': childes.map((x) => x.toJson()).toList(),
      };
}
