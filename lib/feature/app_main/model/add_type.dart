class ProductAddType {
  String? addTypeId;
  String? addTypeName;

  ProductAddType({
    this.addTypeId,
    this.addTypeName,
  });

  ProductAddType copyWith({
    String? addTypeId,
    String? addTypeName,
  }) {
    return ProductAddType(
      addTypeId: addTypeId ?? this.addTypeId,
      addTypeName: addTypeName ?? this.addTypeName,
    );
  }

  factory ProductAddType.fromJson(Map<String, dynamic> json) {
    return ProductAddType(
      addTypeId: json['addTypeId'] as String?,
      addTypeName: json['addTypeName'] as String?,
    );
  }
}
