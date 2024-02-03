import 'package:bende_fazla/feature/auth/widgets/index.dart';
import 'package:bende_fazla/feature/auth/widgets/user_info.dart/user_info_form_widget.dart';
import 'package:bende_fazla/feature/auth/widgets/user_info.dart/user_info_title.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/add_photo/add_and_change_photo_widget.dart';
import 'package:bende_fazla/product/widgets/add_photo/show_photo_widget.dart';
import 'package:flutter/material.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(appBarTitle: AppStrings.kUserInfo),
      body: Padding(
        padding: context.paddings.horizontalHigh,
        child: Column(
          children: [
            /// Title Widget
            const UserInfoTitle(),
            context.sizedBoxHeightMedium,

            /// Add User Profile Photo
            const AddAndChangePhotoWidget(
              child: ShowPhotoWidget(),
            ),
            context.sizedBoxHeightMedium,
            const UserInfoFormWidget(),
          ],
        ),
      ),
    );
  }
}
