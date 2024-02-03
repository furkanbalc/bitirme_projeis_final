import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/core/widgets/profil_photo_shimmer.dart';
import 'package:bende_fazla/feature/app_main/view_model/profile_provider.dart';
import 'package:bende_fazla/feature/auth/model/user_model.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/add_photo/show_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/profile/profile_statistic_detail_widget.dart';
part '../../widgets/profile/profile_card_widget.dart';
part '../../widgets/profile/profile_statistic_card_widget.dart';
part '../../widgets/profile/profile_user_info_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, value, child) {
        value.getCurrentUserInfo();
        return Padding(
          padding: context.paddings.verticalHigh,
          child: _viewBody(value.user, context, value),
        );
      },
    );
  }

  Column _viewBody(UserModel? model, BuildContext context, ProfileProvider value) {
    return Column(
      children: [
        _ProfileUserInfoWidget(model: model),
        context.sizedBoxHeightMedium,
        Expanded(
          child: ListView(
            children: [
              ProfileStatisticCardWidget(model: model),
              _ProfileCardWidget(
                icon: AppIcons.kUserIcon,
                text: AppStrings.kAccountDetail,
                onTap: () => Navigator.pushNamed(context, Routes.profileDetail),
              ),
              _ProfileCardWidget(
                icon: Icons.settings,
                text: AppStrings.kSettings,
                onTap: () {},
              ),
              _ProfileCardWidget(
                icon: Icons.logout_outlined,
                text: AppStrings.kLogout,
                onTap: () async => await value.signOut(context: context, mounted: mounted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
