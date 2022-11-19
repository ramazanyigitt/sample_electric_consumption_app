part of '../home_view.dart';

class _TopSection extends ViewModelWidget<HomeViewModel> {
  const _TopSection({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      color: Colors.transparent,
      child: Text(
        'Energy Cost Calculator',
        style: AppTheme().paragraphMediumText,
      ),
    );
  }
}
