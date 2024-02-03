import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_form_category.dart';

class AddFormWidget extends StatelessWidget {
  const AddFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<AddProductProvider>();
    return Form(
      child: Column(
        children: [
          /// Title Field
          CustomTextField(
            labelText: AppStrings.kAddFormTitleLabel,
            hintText: AppStrings.kAddFormTitleHint,
            onChanged: watch.setProductTitle,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
          ),
          context.sizedBoxHeightLow,

          /// Desc Field
          CustomTextField(
            labelText: AppStrings.kAddFormDescLabel,
            hintText: AppStrings.kAddFormDescHint,
            onChanged: watch.setProductDesc,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            minLines: 3,
            maxLines: 3,
          ),
          context.sizedBoxHeightLow,

          /// Category Button
          const AddFormCategory(),
        ],
      ),
    );
  }
}
