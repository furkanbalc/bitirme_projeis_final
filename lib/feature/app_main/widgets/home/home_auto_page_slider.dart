part of '../../view/home.dart';

class _HomeAutoPageSlider extends StatelessWidget {
  const _HomeAutoPageSlider();

  @override
  Widget build(BuildContext context) {
    final sliderItems = context.providers.readHome.items;
    return CarouselSlider.builder(
      itemCount: sliderItems.length,
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: context.paddings.onlyTopMedium,
          child: Container(
            padding: context.paddings.zero,
            decoration: BoxDecoration(
              color: index % 2 == 1 ? AppColors.redColor.withOpacity(0.4) : AppColors.greenColor,
              borderRadius: context.borders.circularBorderRadiusNormal,
              border: Border.all(color: AppColors.greenColor, width: 2),
            ),
            child: HomeSliderWidget(text: sliderItems[index]),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2 / 1,
        viewportFraction: 1,
      ),
    );
  }
}
