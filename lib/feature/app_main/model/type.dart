class ProductType {
  String? typeId;
  String? typeName;

  ProductType({
    this.typeId,
    this.typeName,
  });

  ProductType copyWith({
    String? typeId,
    String? typeName,
  }) {
    return ProductType(
      typeId: typeId ?? this.typeId,
      typeName: typeName ?? this.typeName,
    );
  }

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(
      typeId: json['typeId'] as String?,
      typeName: json['typeName'] as String?,
    );
  }
}
