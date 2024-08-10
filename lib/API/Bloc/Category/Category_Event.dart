abstract class CategoryEvent {}

class LoadCategoryBanner extends CategoryEvent {
  late int categoryId;
}

class LoadSubCategory extends CategoryEvent {
  final int categoryId;

  LoadSubCategory({required this.categoryId});
}
