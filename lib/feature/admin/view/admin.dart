import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/product/constants/app_icons.dart';
import 'package:bende_fazla/product/enums/firebase_collections.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/custom_text_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late Stream<QuerySnapshot> _products;

  @override
  void initState() {
    super.initState();
    _products = FirebaseFirestore.instance.collection(FirebaseCollections.products.name).orderBy('productTitle').snapshots();
  }

  void updateProductIsActive() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Paneli'),
        leading: IconButton(
          onPressed: () {
            AuthRepository(firebaseAuth: FirebaseAuth.instance).signOut(context: context, mounted: mounted);
          },
          icon: const Icon(AppIcons.kBackIcon),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _products,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Loading ...'));
          }
          final documents = snapshot.data!.docs;
          return ProductList(documents: documents);
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.documents});

  final List<QueryDocumentSnapshot<Object?>> documents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        final document = documents[index];
        if (!document['productIsActive']) {
          return Card(
            child: Padding(
              padding: context.paddings.allMedium,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('İlan id: ${document['productId']}'),
                        Text('İlan id: ${document['productType']}'),
                        Text('İlan başlık: ${document['productTitle']}'),
                        Text('İlan açıklama: ${document['productDesc']}'),
                        Text('İlan kategori: ${document['productCategory']}'),
                        Text('Ürün durumu: ${document['productStatus']}'),
                      ],
                    ),
                  ),
                  CustomTextButton(
                    onPressed: () async {
                      try {
                        await FirebaseFirestore.instance.collection('products').doc(document['productId']).update({
                          'productIsActive': true,
                        });
                      } catch (_) {}
                    },
                    text: 'Yayınla',
                  ),
                ],
              ),
            ),
          );
        }
        return null;
      },
    );
  }
}
