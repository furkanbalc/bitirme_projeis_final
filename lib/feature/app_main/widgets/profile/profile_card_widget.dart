part of '../../view/profile/profile.dart';

class _ProfileCardWidget extends StatelessWidget {
  const _ProfileCardWidget({
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColors.greyLighter,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 15),
              Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.blackPrimary)),
            ],
          ),
        ),
      ),
    );
  }
}
