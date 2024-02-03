import 'package:bende_fazla/feature/app_main/model/product_model.dart';
import 'package:bende_fazla/feature/app_main/view/base.dart';
import 'package:bende_fazla/product/enums/firebase_collections.dart';
import 'package:bende_fazla/product/helpers/custom_alert_dialog.dart';
import 'package:bende_fazla/product/helpers/show_loading_dialog.dart';
import 'package:bende_fazla/product/service/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProductRepository {
  final FirebaseFirestore firestore;
  ProductRepository({required this.firestore});
  final StorageService storageService = StorageService(firebaseStorage: FirebaseStorage.instance);
  CollectionReference product = FirebaseFirestore.instance.collection(FirebaseCollections.products.name);

  Future<void> addProduct(BuildContext context, Product product, mounted) async {
    showLoadingDialog(context: context, message: 'Kaydediliyor ...');
    await firestore.collection(FirebaseCollections.products.name).doc(product.productId).set(product.toFirestore());
    if (!mounted) return;
    Navigator.pop(context);
    customAlertDialog(
        context: context, message: 'Talebinizi aldık ilan incelendikten sonra yayına alınacaktır.', route: const BaseView());
  }

  Future<List<Product>> getProductList() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection(FirebaseCollections.products.name).get();

    return querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
  }
}
