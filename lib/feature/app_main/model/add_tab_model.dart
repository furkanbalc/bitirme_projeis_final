import 'package:bende_fazla/product/constants/index.dart';

class AddTabModel {
  final int index;
  final String text;

  AddTabModel({required this.text, required this.index});
}

class AddTabItems {
  late final List<AddTabModel> items;

  AddTabItems() {
    items = [
      AddTabModel(index: 1, text: AppStrings.kAddDonate),
      AddTabModel(index: 2, text: AppStrings.kAddDemande),
      AddTabModel(index: 3, text: AppStrings.kAddAbandoned),
    ];
  }
}
