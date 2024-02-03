part of '../../view/profile/profile.dart';

class ProfileStatisticCardWidget extends StatelessWidget {
  const ProfileStatisticCardWidget({
    super.key,
    required this.model,
  });

  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.purpleLighter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(child: ProfileStatisticDetailWidget(value: model?.donated ?? 0, text: AppStrings.kDonated)),
            Expanded(child: ProfileStatisticDetailWidget(value: model?.received ?? 0, text: AppStrings.kReceived)),
            Expanded(child: ProfileStatisticDetailWidget(value: model?.totalProduct ?? 0, text: AppStrings.kActive)),
          ],
        ),
      ),
    );
  }
}
