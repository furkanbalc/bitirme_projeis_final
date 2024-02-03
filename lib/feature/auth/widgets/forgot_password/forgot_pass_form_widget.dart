part of '../../view/forgot_password.dart';

class ForgotPassFormWidget extends StatefulWidget {
  const ForgotPassFormWidget({super.key});

  @override
  State<ForgotPassFormWidget> createState() => _ForgotPassFormWidgetState();
}

class _ForgotPassFormWidgetState extends State<ForgotPassFormWidget> with ForgotPassFormMixin {
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
    return Column(
      children: [
        Form(
          key: _key,
          autovalidateMode: context.providers.readForgotPass.isAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
          child: CustomTextField(
            onChanged: context.providers.readForgotPass.setEmail,
            validator: context.providers.readForgotPass.emailValidate,
            hintText: AppStrings.kFormEmail,
            labelText: AppStrings.kFormEmail,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(AppIcons.kDirectIcon),
            textInputAction: TextInputAction.done,
          ),
        ),
        context.sizedBoxHeightNormal,

        /// Submit Button
        CustomElevatedButton(
          onPressed: () => forgotPassFormCheck(context, _key, context.providers.readForgotPass),
          buttonWidth: context.getWidth(factor: .9),
          text: AppStrings.kNext,
        ),
      ],
    );
  }
}
