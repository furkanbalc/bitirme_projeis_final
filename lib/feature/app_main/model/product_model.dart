import 'package:bende_fazla/feature/app_main/model/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? productId;
  String? productCategory;
  String? productType;
  String? productStatus;
  String? productAddType;
  String? productOwner;
  String? productTitle;
  String? productDesc;
  String? productImageUrls;
  ProductLocation? productLocation;
  bool? productIsActive;

  Product({
    this.productId,
    this.productCategory,
    this.productType,
    this.productStatus,
    this.productAddType,
    this.productOwner,
    this.productTitle,
    this.productDesc,
    this.productImageUrls,
    this.productLocation,
    this.productIsActive = false,
  });

  Product copyWith({
    String? productId,
    String? productCategory,
    String? productType,
    String? productStatus,
    String? productAddType,
    String? productOwner,
    String? productTitle,
    String? productDesc,
    String? productImageUrls,
    ProductLocation? productLocation,
    bool? productIsActive,
  }) {
    return Product(
      productId: productId ?? this.productId,
      productCategory: productCategory ?? this.productCategory,
      productType: productType ?? this.productType,
      productStatus: productStatus ?? this.productStatus,
      productOwner: productOwner ?? this.productOwner,
      productAddType: productAddType ?? this.productAddType,
      productTitle: productTitle ?? this.productTitle,
      productDesc: productDesc ?? this.productDesc,
      productImageUrls: productImageUrls ?? this.productImageUrls,
      productLocation: productLocation ?? this.productLocation,
      productIsActive: productIsActive ?? this.productIsActive,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'productId': productId,
      'productCategory': productCategory,
      'productType': productType,
      'productStatus': productStatus,
      'productOwner': productOwner,
      'productAddType': productAddType,
      'productTitle': productTitle,
      'productDesc': productDesc,
      'productImageUrls': productImageUrls,
      'productLocation': productLocation?.toJson(),
      'productIsActive': productIsActive,
    };
  }

  factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Product(
      productId: data?['productId'] as String?,
      productCategory: data?['productCategory'] as String?,
      productType: data?['productType'] as String?,
      productStatus: data?['productStatus'] as String?,
      productOwner: data?['productOwner'] as String?,
      productAddType: data?['productAddType'] as String?,
      productTitle: data?['productTitle'] as String?,
      productDesc: data?['productDesc'] as String?,
      productImageUrls: data?['productImageUrls'],
      productLocation:
          data?['productLocation'] == null ? null : ProductLocation.fromJson(data?['location'] as Map<String, dynamic>),
      productIsActive: data?['productIsActive'] ?? false,
    );
  }
}
