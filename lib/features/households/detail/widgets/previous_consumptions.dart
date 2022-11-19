part of '../household_detail_view.dart';

class _PreviousConsumptions extends ViewModelWidget<HouseholdDetailViewModel> {
  const _PreviousConsumptions({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return previousConsumption(
            context, viewModel.householdModel.readings![index]);
      },
      itemCount: ((viewModel.householdModel.readings?.length ?? 0) > 3)
          ? 3
          : viewModel.householdModel.readings?.length ?? 0,
    );
  }

  Widget previousConsumption(
      BuildContext context, ConsumptionData consumptionDataModel) {
    final f = DateFormat('yyyy-MM-dd hh:mm');
    return Container(
      padding: context.paddingNormal,
      margin: context.paddingLow,
      decoration: BoxDecoration(
        boxShadow: [AppTheme().boxShadowSmall],
        border: AppTheme().boxBorderForShadow,
        color: AppTheme().whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Cost',
                style: AppTheme().smallParagraphMediumText,
              ),
              Text(
                '${consumptionDataModel.cost}',
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Reading',
                style: AppTheme().smallParagraphMediumText,
              ),
              Text(
                '${consumptionDataModel.reading}',
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Date',
                style: AppTheme().smallParagraphMediumText,
              ),
              Text(
                '${f.format(consumptionDataModel.date!)}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
