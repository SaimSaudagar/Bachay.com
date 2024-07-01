import 'dart:convert';

class SubCategoryList {
  final List<SubCategory> categories;

  SubCategoryList({required this.categories});

  factory SubCategoryList.fromJson(List<dynamic> json) {
    return SubCategoryList(
      categories: json
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  List<dynamic> toJson() => categories.map((e) => e.toJson()).toList();
}

class SubCategory {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final int? parentId;
  final int? position;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? homeStatus;
  final int? priority;
  final int? productCount;
  final List<SubCategory>? childes;
  final List<dynamic>? translations;

  SubCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    this.parentId,
    this.position,
    required this.createdAt,
    required this.updatedAt,
    this.homeStatus,
    this.priority,
    this.productCount,
    this.childes,
    this.translations,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      icon: json['icon'] as String,
      parentId: json['parent_id'] != null ? json['parent_id'] as int : null,
      position: json['position'] != null ? json['position'] as int : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      homeStatus:
          json['home_status'] != null ? json['home_status'] as int : null,
      priority: json['priority'] != null ? json['priority'] as int : null,
      productCount:
          json['product_count'] != null ? json['product_count'] as int : null,
      childes: json['childes'] != null
          ? (json['childes'] as List<dynamic>)
              .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      translations: json['translations'] as List<dynamic>?,
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
        'childes': childes?.map((e) => e.toJson()).toList(),
        'translations': translations,
      };
}
