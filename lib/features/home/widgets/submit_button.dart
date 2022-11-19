part of '../home_view.dart';

class _SubmitButton extends ViewModelWidget<HomeViewModel> {
  const _SubmitButton({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      margin: context.paddingNormal,
      child: InkWell(
        onTap: () {
          viewModel.onSubmit();
        },
        child: Ink(
          padding: context.paddingLowVertical,
          decoration: BoxDecoration(
            color: AppTheme().primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Submit',
              style: AppTheme().smallParagraphRegularText,
            ),
          ),
        ),
      ),
    );
  }
}
