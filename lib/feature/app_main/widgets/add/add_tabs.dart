import 'package:bende_fazla/feature/app_main/view_model/add_product_provider.dart';
import 'package:bende_fazla/feature/app_main/widgets/add/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTabs extends StatelessWidget {
  const AddTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<AddProductProvider>().items;
    final watch = context.watch<AddProductProvider>();
    return SizedBox(
      height: 50,
      child: Row(
        children: List.generate(items.length, (index) {
          return Expanded(
            child: AddTabButton(
              onPressed: () {
                watch.changeProductType(index: items[index].index);
              },
              model: items[index],
            ),
          );
        }),
      ),
    );
  }
}
