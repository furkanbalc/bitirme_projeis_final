import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AddDemande extends StatelessWidget {
  const AddDemande({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ProductTypes(),
        context.sizedBoxHeightLow,

        /// Product Status DropDown
        const AddFormWidget(),
        context.sizedBoxHeightLow,

        /// Location Widget
        const AddLocationWidget(),
      ],
    );
  }
}
