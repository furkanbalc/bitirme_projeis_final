class ProductCategories {
  String? categoryId;
  String? categoryName;

  ProductCategories({
    this.categoryId,
    this.categoryName,
  });

  ProductCategories copyWith({
    String? categoryId,
    String? categoryNam,
  }) {
    return ProductCategories(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? categoryName,
    );
  }

  factory ProductCategories.fromJson(Map<String, dynamic> json) {
    return ProductCategories(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
    );
  }
}
