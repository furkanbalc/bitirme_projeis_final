import 'package:bende_fazla/feature/app_main/view/product/product_detail.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/app_gifs.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/images/custom_image_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late Stream<QuerySnapshot> products;

  @override
  void initState() {
    super.initState();
    products = FirebaseFirestore.instance.collection(FirebaseCollections.products.name).orderBy('productTitle').snapshots();
  }

  final CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.tune_outlined),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  backgroundColor: AppColors.purpleLight,
                ),
                onPressed: () {},
                label: const Text('Filtrele'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 0 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(0);
                },
                child: const Text('Hepsi'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 1 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(1);
                },
                child: const Text('Mobilya'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 2 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(2);
                },
                child: const Text('Giyim'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 3 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(3);
                },
                child: const Text('Teknoloji'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 4 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(4);
                },
                child: const Text('Spor'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 5 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(5);
                },
                child: const Text('Çocuk'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 6 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(6);
                },
                child: const Text('Pets'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 7 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(7);
                },
                child: const Text('Sağlık'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 8 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(8);
                },
                child: const Text('Eğitim'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.providers.watchProduct.index == 9 ? AppColors.purplePrimary : AppColors.greyPrimary),
                onPressed: () {
                  context.providers.readProduct.setIndex(9);
                },
                child: const Text('Aletler'),
              ),
            ],
          ),
        ),
        Expanded(
          child: body(),
        ),
      ],
    );
  }

  Widget body() {
    switch (context.providers.watchProduct.index) {
      case 0:
        return StreamBuilder<QuerySnapshot>(
          stream: productsCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: documents.length,
                itemBuilder: (BuildContext context, int index) {
                  final document = documents[index];
                  if (document['productIsActive']) {
                    return Padding(
                      padding: context.paddings.onlyBottomNormal,
                      child: _ProductCard(document),
                    );
                  }
                  return null;
                },
              ),
            );
          },
        );
      case 1:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Mobilya').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 2:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Giyim').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 3:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Teknoloji').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 4:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Spor').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 5:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Çocuk').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 6:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Pets').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 7:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Sağlık').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 8:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Eğitim').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );
      case 9:
        return FutureBuilder<QuerySnapshot>(
          future: productsCollection.where('productCategory', isEqualTo: 'Aletler').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading ...'));
            }
            final documents = snapshot.data!.docs;
            return Padding(
              padding: context.paddings.onlyTopMedium,
              child: documents.isEmpty
                  ? CustomImageWidget(imageName: AppGifs.empty.toGif)
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        if (document['productIsActive']) {
                          return Padding(
                            padding: context.paddings.onlyBottomNormal,
                            child: _ProductCard(document),
                          );
                        }
                        return null;
                      },
                    ),
            );
          },
        );

      default:
        return const Center();
    }
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard(this.document);
  final QueryDocumentSnapshot<Object?> document;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailView(document: document)));
      },
      child: Card(
        color: Colors.white54,
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ProductCardImage(document: document),
              ),
              const SizedBox(width: 25),
              Expanded(
                flex: 2,
                child: ProductCardBody(document: document),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardBody extends StatelessWidget {
  const ProductCardBody({
    super.key,
    required this.document,
  });
  final QueryDocumentSnapshot<Object?> document;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(document['productTitle'], style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.blackPrimary)),
        Text(document['productCategory'], style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.greyPrimary)),
        Text(
          document['productDesc'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.greyPrimary),
        ),
        Text(document['productStatus'],
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: color(document['productStatus']))),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: context.borders.circularBorderRadiusHigh,
                border: Border.all(),
              ),
              child: const Icon(
                AppIcons.kUserIcon,
                size: 15,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              document['productOwner'],
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.greyPrimary,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Color color(String status) {
    switch (status) {
      case 'Yeni Gibi':
        return AppColors.greenColor;
      case 'Tamir Gerektirir':
        return AppColors.orangeColor;
      case 'Kullanılabilir':
        return AppColors.yellowColor;

      default:
        return AppColors.greenColor;
    }
  }
}

class ProductCardImage extends StatelessWidget {
  const ProductCardImage({super.key, required this.document});
  final QueryDocumentSnapshot<Object?> document;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.borders.circularBorderRadiusMedium,
        image: DecorationImage(image: NetworkImage(document['productImageUrls']), fit: BoxFit.cover),
      ),
    );
  }
}
