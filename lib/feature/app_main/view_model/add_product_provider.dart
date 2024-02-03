import 'dart:typed_data';

import 'package:bende_fazla/feature/app_main/model/add_tab_model.dart';
import 'package:bende_fazla/feature/app_main/model/categories.dart';
import 'package:bende_fazla/feature/app_main/model/location.dart';
import 'package:bende_fazla/feature/app_main/model/product_model.dart';
import 'package:bende_fazla/feature/app_main/model/status.dart';
import 'package:bende_fazla/feature/app_main/repository/firestore_repository.dart';
import 'package:bende_fazla/feature/app_main/repository/product_repository.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/tabs/add_abandoned.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/tabs/add_demande.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/tabs/add_donate.dart';
import 'package:bende_fazla/feature/auth/repository/user_info_repository.dart';
import 'package:bende_fazla/feature/auth/view/image_picker.dart';
import 'package:bende_fazla/product/constants/app_strings.dart';
import 'package:bende_fazla/product/service/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

class AddProductProvider extends ChangeNotifier {
  final FirestoreRepository _firestoreRepository = FirestoreRepository(firestore: FirebaseFirestore.instance);
  final StorageService storageService = StorageService(firebaseStorage: FirebaseStorage.instance);
  final ProductRepository productRepository = ProductRepository(firestore: FirebaseFirestore.instance);
  final List<AddTabModel> items = AddTabItems().items;
  List<ProductCategories> categories = [];
  List<ProductsStatus> statuss = [];
  List<Product> products = [];
  Widget formWidget = const AddDonate();
  String productType = AppStrings.kAddDonate;
  int productTypeIndex = 1;
  bool control = false;
  List<Uint8List> imageGallery = [];
  String productCategory = '';
  String productTitle = '';
  String productDesc = '';
  String productStatus = '';
  String productOwner = '';
  String productId = '';
  ProductLocation? productLocation = ProductLocation();

  void reset() {
    imageGallery = [];
    productCategory = '';
    productTitle = '';
    productDesc = '';
    productStatus = '';
    productOwner = '';
    control = false;
    notifyListeners();
  }

  Future<void> saveProduct(BuildContext context, mounted) async {
    final user =
        await UserInfoRepository(firestore: FirebaseFirestore.instance, firebaseAuth: FirebaseAuth.instance).getCurrentUserInfo();
    final position = await Geolocator.getCurrentPosition();
    productLocation = ProductLocation(lat: position.latitude, long: position.longitude);
    dynamic productImage = imageGallery[0];
    String productId = const Uuid().v4();
    notifyListeners();
    String productImageUrl = productImage is String ? productImage : '';
    if (productImage is! String) {
      productImageUrl = await storageService.storeFileToFirebase(
        'products/${productId.toString()}',
        productImage,
      );
    }

    // ignore: use_build_context_synchronously
    await productRepository.addProduct(
      context,
      Product(
        productId: productId,
        productImageUrls: productImageUrl,
        productStatus: productStatus,
        productLocation: productLocation,
        productType: productType,
        productOwner: user!.username,
        productCategory: productCategory,
        productTitle: productTitle,
        productDesc: productDesc,
      ),
      mounted,
    );
    reset();
  }

  void changeProductType({required int index}) {
    productTypeIndex = index;
    _getLevelItems();
    notifyListeners();
  }

  void setProductStatus(String status) {
    productStatus = status;
    addProductControl();
    notifyListeners();
  }

  void setCategoryName(String category) {
    productCategory = category;
    addProductControl();
    notifyListeners();
  }

  void setProductTitle(String value) {
    productTitle = value;
    addProductControl();
    notifyListeners();
  }

  void setProductDesc(String value) {
    productDesc = value;
    addProductControl();
    notifyListeners();
  }

  void _getLevelItems() {
    if (productTypeIndex == 1) {
      productType = AppStrings.kAddDonate;
      formWidget = const AddDonate();
    } else if (productTypeIndex == 2) {
      productType = AppStrings.kAddDemande;
      formWidget = const AddDemande();
    } else {
      productType = AppStrings.kAddAbandoned;
      formWidget = const AddAbandoned();
    }
    reset();
    notifyListeners();
  }

  Future<void> getCategories() async {
    categories = await _firestoreRepository.getCategories();
    notifyListeners();
  }

  Future<void> getStatus() async {
    statuss = await _firestoreRepository.getStatus();
    notifyListeners();
  }

  Future<void> getDatas() async {
    products = await productRepository.getProductList();
    notifyListeners();
  }

  Future<void> pickImageFromGallery({required BuildContext context}) async {
    final image = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImagePickerView(),
      ),
    );
    if (image == null) return;
    imageGallery.add(image);
    addProductControl();
    notifyListeners();
  }

  Future<void> pickImageRemove({required BuildContext context, required int index}) async {
    imageGallery.removeAt(index);
    addProductControl();
    notifyListeners();
  }

  void addProductControl() {
    if (productTypeIndex == 1 || productTypeIndex == 3) {
      if (productTitle.isNotEmpty &&
          productDesc.isNotEmpty &&
          productCategory.isNotEmpty &&
          productStatus.isNotEmpty &&
          imageGallery.isNotEmpty) {
        control = true;
        notifyListeners();
      } else {
        control = false;
        notifyListeners();
      }
    } else {
      if (productTitle.isNotEmpty && productDesc.isNotEmpty && productCategory.isNotEmpty) {
        control = true;
        notifyListeners();
      } else {
        control = false;
        notifyListeners();
      }
    }
  }
}
