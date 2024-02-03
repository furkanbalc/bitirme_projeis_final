import 'package:bende_fazla/feature/app_main/widgets/add/add_location_widget.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.document});
  final QueryDocumentSnapshot<Object?> document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İlan Detayları')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(document['productImageUrls']), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: context.getWidth(),
                decoration: BoxDecoration(
                  borderRadius: context.borders.circularBorderRadiusHigh,
                  color: AppColors.greyLight,
                ),
                child: Padding(
                  padding: context.paddings.allUltra,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('İlan Sahibi: ', style: context.textStyles.titleLarge),
                          Text(document['productOwner'], style: context.textStyles.titleLarge),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('İlan Tİpi: ', style: context.textStyles.titleLarge),
                          Text(document['productType'], style: context.textStyles.titleLarge),
                        ],
                      ),
                      Label(title: 'Ürün kategorisi: ', desc: document['productCategory']),
                      const Divider(),
                      Label(title: 'Ürün başlığı: ', desc: document['productTitle']),
                      Label(title: 'Ürün açıklaması: ', desc: document['productDesc']),
                      const Divider(),
                      Label(title: 'Ürün durumu: ', desc: document['productStatus']),
                      const Divider(),
                      const AddLocationWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: context.textStyles.titleMedium,
        children: <TextSpan>[
          TextSpan(
            text: desc,
            style: const TextStyle(
              color: AppColors.blackLighter,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
