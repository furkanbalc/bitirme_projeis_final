part of '../view/welcome.dart';

class _WelcomeTextAndButtons extends StatelessWidget {
  const _WelcomeTextAndButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.getAppBarHeight()),
      child: Container(
        decoration: AppBoxDecoration.welcomeDecorations,
        padding: context.paddings.horizontalHigh,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// Welcome Description Widget
            _WelcomeTextWidget(),

            /// Welcome Signup & Login Buttons
            _WelcomeButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
