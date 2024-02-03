import 'package:bende_fazla/core/mixin/user_info_check.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/custom_elevated_button.dart';
import 'package:bende_fazla/product/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class UserInfoFormWidget extends StatefulWidget {
  const UserInfoFormWidget({super.key});

  @override
  State<UserInfoFormWidget> createState() => _UserInfoFormWidgetState();
}

class _UserInfoFormWidgetState extends State<UserInfoFormWidget> with UserInfoFormMixin {
  late final GlobalKey<FormState> _key;

  @override
  void initState() {
    _key = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _key.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode:
          context.providers.readUserInfo.isAutoValidate ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
      key: _key,
      child: Column(
        children: [
          /// UserName TextField
          CustomTextField(
            onChanged: context.providers.readUserInfo.setUsername,
            validator: context.providers.readUserInfo.userNameValidator,
            hintText: AppStrings.kFormName,
            labelText: AppStrings.kFormName,
            autofillHints: const [AutofillHints.name],
            keyboardType: TextInputType.name,
            maxLenght: 30,
            prefixIcon: const Icon(AppIcons.kUserIcon),
            textInputAction: TextInputAction.next,
          ),
          // Consumer<MapRepository>(
          //   builder: (context, value, child) {
          //     return CustomTextField(
          //       onTap: () async {
          //         final position = await Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) =>
          //                 FullScreenMap(location: LatLng(value.currentPosition.latitude, value.currentPosition.longitude)),
          //           ),
          //         );
          //       },
          //       hintText: AppStrings.kSelectLocation,
          //       labelText: AppStrings.kLocation,
          //       prefixIcon: const Icon(AppIcons.kLocationIcon),
          //       readOnly: true,
          //     );
          //   },
          // ),
          context.sizedBoxHeightMedium,
          CustomElevatedButton(
            onPressed: () => userInfoFormCheck(context, _key),
            buttonWidth: context.getWidth(factor: .9),
            text: AppStrings.kNext,
          ),
        ],
      ),
    );
  }
}
