part of '../household_detail_view.dart';

class _SaveButton extends ViewModelWidget<HouseholdDetailViewModel> {
  const _SaveButton({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      margin: context.paddingNormal,
      child: InkWell(
        onTap: () {
          viewModel.onSave();
        },
        child: Ink(
          padding: context.paddingLowVertical,
          decoration: BoxDecoration(
            color: AppTheme().primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Save',
              style: AppTheme().smallParagraphRegularText,
            ),
          ),
        ),
      ),
    );
  }
}
