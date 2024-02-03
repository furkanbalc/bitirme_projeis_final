enum ProductStatus {
  likeNew('Yeni Gibi'),
  usable('Kullanılabilir'),
  requiresRepair('Tamir Gerektirir'),
  ;

  final String value;
  const ProductStatus(this.value);
}
