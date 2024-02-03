import 'package:bende_fazla/feature/on_boarding/model/on_boarding_model.dart';
import 'package:bende_fazla/product/enums/index.dart';

class OnBoardingItems {
  late final List<OnBoardingModel> onBoarditems;

  OnBoardingItems() {
    onBoarditems = [
      OnBoardingModel(
        img: AppLotties.think.toLottie,
        title: OnbardingTexts.title1.value,
        subTitle: OnbardingTexts.subTitle1.value,
      ),
      OnBoardingModel(
        img: AppLotties.takePicture.toLottie,
        title: OnbardingTexts.title2.value,
        subTitle: OnbardingTexts.subTitle2.value,
      ),
      OnBoardingModel(
        img: AppLotties.food.toLottie,
        title: OnbardingTexts.title3.value,
        subTitle: OnbardingTexts.subTitle3.value,
      ),
      OnBoardingModel(
        img: AppLotties.donateBox.toLottie,
        title: OnbardingTexts.title4.value,
        subTitle: OnbardingTexts.subTitle4.value,
      ),
      OnBoardingModel(
        img: AppLotties.waste.toLottie,
        title: OnbardingTexts.title5.value,
        subTitle: OnbardingTexts.subTitle5.value,
      ),
    ];
  }
}

enum OnbardingTexts {
  title1('Bende Fazla'),
  subTitle1('Etrafınızda sahip olduğunuz şeylere dikkatlice bakın. Eğer ihtiyacınız yoksa bir düşünün.'),

  title2('Resmini Çek'),
  subTitle2('Sende fazla olan şeylerin resmini çekerek uygulamaya ekle. Kullanmadığın eşyaların yeni bir hayat bulsun.'),

  title3('İlana Ekle'),
  subTitle3('Fazla yiyeceklerin son kullanma tarihi geçmeden ilana ekle. Paylaş, yardım et ve dünyayı daha iyi bir yer yap!'),

  title4('Bağış Yap'),
  subTitle4(
      'Kendinize şunu sorun: Eğer benim için yararlı değilse... başkası için yararlı olabilir mi? İhtiyacı olanlara ulaştır, çevreye katkıda bulun!'),

  title5('İsrafı Önle'),
  subTitle5(
      'Fazlasıyla sahip olduğun her şeyi burada bağışla, insanlara yardım et ve dünyayı daha iyi bir yer yapmaya yardımcı ol!'),
  ;

  final String value;
  const OnbardingTexts(this.value);
}
