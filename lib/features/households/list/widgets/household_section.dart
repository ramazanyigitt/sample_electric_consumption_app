part of '../home_view.dart';

class _HouseholdSection extends ViewModelWidget<HomeViewModel> {
  const _HouseholdSection({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    if (viewModel.householdService.getHouseholds().isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            'Could not find any households.',
            style: AppTheme().smallParagraphMediumText,
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          //return Container();
          return HouseholdCard(
            householdModel: viewModel.householdService.getHouseholds()[index],
            padding: index != 0
                ? context.paddingLowVertical
                : context.paddingLowBottom,
            onClick: (tokenModel) {
              /*Get.to(
                () => TokenDetailView(
                  tokenModel: tokenModel,
                  updateToken: (TokenModel _tokenModel) {
                    viewModel.trendTokens[index] = _tokenModel;
                    viewModel.notifyListeners();
                  },
                ),
              );*/
            },
          );
        },
        childCount: viewModel.householdService.getHouseholds().length,
      ),
    );
  }
}
