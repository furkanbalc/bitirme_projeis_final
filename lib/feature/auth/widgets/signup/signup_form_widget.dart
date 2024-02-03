part of '../../view/signup.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> with SignupFormMixin {
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
      autovalidateMode: context.providers.readSignup.isAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            onChanged: context.providers.readSignup.setEmail,
            validator: context.providers.readSignup.emailValidate,
            hintText: AppStrings.kFormEmail,
            labelText: AppStrings.kFormEmail,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(AppIcons.kDirectIcon),
            textInputAction: TextInputAction.next,
          ),
          context.sizedBoxHeightLow,
          CustomTextField(
            onChanged: context.providers.readSignup.setPassword,
            validator: context.providers.readSignup.passwordValidate,
            hintText: AppStrings.kFormPass,
            labelText: AppStrings.kFormPass,
            autofillHints: const [AutofillHints.password],
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(AppIcons.kPasswordIcon),
            obscureText: context.providers.watchSignup.isVisible,
            suffixIcon: context.providers.watchSignup.isVisible ? AppIcons.kVisibilty : AppIcons.kVisibiltyOff,
            suffixOnPressed: () => context.providers.readSignup.changeVisibility(),
          ),
          context.sizedBoxHeightLow,
          CustomTextField(
            onChanged: context.providers.readSignup.setPasswordConfirm,
            validator: context.providers.readSignup.passwordConfirmValidate,
            hintText: AppStrings.kFormVerifyPass,
            labelText: AppStrings.kFormVerifyPass,
            autofillHints: const [AutofillHints.password],
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(AppIcons.kPasswordIcon),
            obscureText: context.providers.watchSignup.isVisibleConfirm,
            suffixIcon: context.providers.watchSignup.isVisibleConfirm ? AppIcons.kVisibilty : AppIcons.kVisibiltyOff,
            suffixOnPressed: () => context.providers.readSignup.changeVisibilityConfirm(),
          ),
          context.sizedBoxHeightMedium,
          CustomElevatedButton(
            onPressed: () => signupFormCheck(context, _key, context.providers.readSignup),
            text: AppStrings.kSignup,
          ),
        ],
      ),
    );
  }
}
