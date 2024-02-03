part of '../../view/login.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> with LoginFormMixin {
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
      key: _key,
      autovalidateMode: context.providers.readLogin.isAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onChanged: context.providers.readLogin.setEmail,
            validator: context.providers.readLogin.emailValidate,
            hintText: AppStrings.kFormEmail,
            labelText: AppStrings.kFormEmail,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(AppIcons.kDirectIcon),
            textInputAction: TextInputAction.next,
          ),
          context.sizedBoxHeightLow,
          CustomTextField(
            onChanged: context.providers.readLogin.setPassword,
            validator: context.providers.readLogin.passwordValidate,
            hintText: AppStrings.kFormPass,
            labelText: AppStrings.kFormPass,
            autofillHints: const [AutofillHints.password],
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(AppIcons.kPasswordIcon),
            obscureText: context.providers.watchLogin.isVisible,
            suffixIcon: context.providers.watchLogin.isVisible ? AppIcons.kVisibilty : AppIcons.kVisibiltyOff,
            suffixOnPressed: () => context.providers.readLogin.changeVisibility(),
          ),
          const _LoginForgotPassButton(),
          CustomElevatedButton(
            onPressed: () => loginFormCheck(context, _key, context.providers.readLogin),
            text: AppStrings.kLogin,
          ),
        ],
      ),
    );
  }
}
