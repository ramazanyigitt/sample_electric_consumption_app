part of '../household_detail_view.dart';

class _TopSection extends ViewModelWidget<HouseholdDetailViewModel> {
  const _TopSection({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.off(
                () => const HomeView(),
              );
            },
            child: Padding(
              padding:
                  context.paddingNormalHorizontal + context.paddingLowVertical,
              child: Icon(
                Icons.arrow_back_ios,
                size: context.normalValue,
              ),
            ),
          ),
          Text(
            'Household ${viewModel.householdModel.serviceNumber}',
            style: AppTheme().paragraphMediumText,
          ),
          Padding(
            padding:
                context.paddingNormalHorizontal + context.paddingLowVertical,
          ),
        ],
      ),
    );
  }
}
