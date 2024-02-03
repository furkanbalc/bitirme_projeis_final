import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/material.dart';

class AuthAppbar extends StatelessWidget with NavigatorManager implements PreferredSizeWidget {
  const AuthAppbar({super.key, this.appBarTitle});
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(appBarTitle ?? ''),
      leading: CustomIconButton(
        onPressed: () => navigatePop(context),
        icon: AppIcons.kBackIcon,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}
