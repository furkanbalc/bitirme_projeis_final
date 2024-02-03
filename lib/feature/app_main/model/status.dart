class ProductsStatus {
  String? statusId;
  String? statusName;

  ProductsStatus({
    this.statusId,
    this.statusName,
  });

  ProductsStatus copyWith({
    String? statusId,
    String? statusName,
  }) {
    return ProductsStatus(
      statusId: statusId ?? this.statusId,
      statusName: statusName ?? this.statusName,
    );
  }

  factory ProductsStatus.fromJson(Map<String, dynamic> json) {
    return ProductsStatus(
      statusId: json['statusId'] as String?,
      statusName: json['statusName'] as String?,
    );
  }
}
