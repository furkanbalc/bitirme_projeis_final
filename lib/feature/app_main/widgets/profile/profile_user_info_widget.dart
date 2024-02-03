part of '../../view/profile/profile.dart';

class _ProfileUserInfoWidget extends StatelessWidget {
  const _ProfileUserInfoWidget({required this.model});
  final UserModel? model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        model?.profileImageUrl == null
            ? const ProfilPhotoShimmer()
            : ShowPhotoWidget(
                icon: AppIcons.kUserIcon,
                size: context.getWidth(factor: .4),
                image: DecorationImage(
                  image: NetworkImage(model!.profileImageUrl!),
                ),
              ),
        context.sizedBoxHeightLow,
        Text(model?.username ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.blackPrimary)),
        Text(model?.email ?? '', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
