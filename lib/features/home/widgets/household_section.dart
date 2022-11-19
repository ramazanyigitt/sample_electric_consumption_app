part of '../home_view.dart';

class _HouseHoldInput extends ViewModelWidget<HomeViewModel> {
  const _HouseHoldInput({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return Center(
      child: FieldBuilderAuto(
        controller: viewModel.householdValidator.textController,
        validator: viewModel.householdValidator.validate,
        text: 'Service number',
        hint: ' Service number',
        autovalidateMode: true,
      ),
    );
  }
}
