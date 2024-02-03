import 'package:bende_fazla/feature/app_main/widgets/home/home_slider_widget.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part '../widgets/home/home_auto_page_slider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.paddings.zero,
      children: [
        const _HomeAutoPageSlider(),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('En çok ilan bulunanlar'),
            CustomTextButton(
              color: AppColors.purplePrimary,
              onPressed: () {
                context.providers.readBase.onDestinationSelected(1);
              },
              text: 'Tüm ilanları gör',
            ),
          ],
        ),
        SizedBox(
          height: context.getHeight(),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: const [
              Category(icon: FontAwesomeIcons.couch, category: 'Mobilya', index: 1),
              Category(icon: FontAwesomeIcons.laptop, category: 'Teknoloji', index: 3),
              Category(icon: FontAwesomeIcons.baseball, category: 'Spor', index: 4),
              Category(icon: FontAwesomeIcons.shirt, category: 'Giyim', index: 2),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.icon,
    required this.category,
    required this.index,
  });
  final IconData icon;
  final String category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(factor: .4),
      height: context.getWidth(factor: .4),
      child: GestureDetector(
        onTap: () async {
          context.providers.readBase.onDestinationSelected(1);
          context.providers.readProduct.setIndex(index);
        },
        child: Card(
            color: AppColors.purplePrimary,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(icon, color: AppColors.whiteColor, size: 36),
                context.sizedBoxHeightMedium,
                Text(category),
              ],
            ))),
      ),
    );
  }
}
