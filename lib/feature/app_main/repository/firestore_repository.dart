import 'package:bende_fazla/feature/app_main/model/categories.dart';
import 'package:bende_fazla/feature/app_main/model/status.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  FirestoreRepository({required this.firestore});
  final FirebaseFirestore firestore;

  Future<List<ProductCategories>> getCategories() async {
    // Firestore'dan products koleksiyonunu çek
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore.collection(FirebaseCollections.categories.name).get();

    // QuerySnapshot'tan List<ProductModel> oluştur
    List<ProductCategories> categories = querySnapshot.docs.map((doc) => ProductCategories.fromJson(doc.data())).toList();

    return categories;
  }

  Future<List<ProductsStatus>> getStatus() async {
    // Firestore'dan products koleksiyonunu çek
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore.collection(FirebaseCollections.status.name).get();

    // QuerySnapshot'tan List<ProductModel> oluştur
    List<ProductsStatus> status = querySnapshot.docs.map((doc) => ProductsStatus.fromJson(doc.data())).toList();

    return status;
  }
}
