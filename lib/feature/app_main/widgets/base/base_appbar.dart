part of '../../view/base.dart';

class _BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BaseAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.kAppName, style: context.textStyles.appNameColor),
      backgroundColor: AppColors.whiteColor,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}
