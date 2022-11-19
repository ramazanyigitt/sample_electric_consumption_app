part of '../home_view.dart';

class _CurrentMeterInput extends ViewModelWidget<HomeViewModel> {
  const _CurrentMeterInput({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return Center(
      child: FieldBuilderAuto(
        controller: viewModel.meterValidator.textController,
        validator: (text) {
          final haveError = viewModel.meterValidator.validate(text);
          if (haveError == null) {
            final currentReading = int.parse(text!);
            if (currentReading < viewModel.getMinimumReading()) {
              return 'Please input higher reading.';
            }
            return null;
          } else {
            return haveError;
          }
        },
        text: 'Current meter',
        hint: ' Meter reading',
        autovalidateMode: true,
      ),
    );
  }
}
