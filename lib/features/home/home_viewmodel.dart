part of 'home_view.dart';

class HomeViewModel extends ReactiveViewModel {
  HouseholdService householdService = locator<HouseholdService>();
  ElectricityService electricityService = locator<ElectricityService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [householdService];

  final AutoValidatorModel householdValidator = AutoValidatorModel(
    validator: (text) => locator<ValidatorService>().alphaNumericLimit(
      text,
      maxLength: 10,
      minLength: 10,
    ),
  );

  final AutoValidatorModel meterValidator = AutoValidatorModel(
    validator: locator<ValidatorService>().onlyNumber,
  );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late bool isInited;
  Future<void> init() async {
    isInited = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      formKey.currentState!.save();
    });
    await Future.wait([
      getHouseholds(),
      getSlabs(),
    ]);
    isInited = true;
    notifyListeners();
  }

  Future<void> getHouseholds() async {
    final response =
        await locator<HouseholdRepository>().localDataSource.getHouseholds();
    if (response is Right) {
      final houseHolds = response.asRight();
      householdService.setHouseholds(houseHolds);
      log('Init Response right: ${response.asRight()}');
    } else {
      log('Init Response left: ${response.asLeft()}');
    }
  }

  Future<void> getSlabs() async {
    final response = await locator<ElectricMeterRepository>().getSlabs();
    if (response is Right) {
      final slabs = response.asRight();
      electricityService.setSlabs(slabs);
      log('Init slabs Response right: ${response.asRight()}');
    } else {
      log('Init slabs Response left: ${response.asLeft()}');
    }
  }

  int getMinimumReading() {
    final isExists = householdService.getHouseholds().any((element) =>
        element.serviceNumber == householdValidator.textController.text);
    if (isExists) {
      final houseHoldInputted = householdService.getHouseholds().firstWhere(
          (element) =>
              element.serviceNumber == householdValidator.textController.text);
      return houseHoldInputted.readings!.last.reading! + 1;
    }
    return 1;
  }

  void onSubmit() {
    if (formKey.currentState?.validate() == true) {
      final serviceNumber = householdValidator.textController.text;
      final readingData = int.parse(meterValidator.textController.text);

      goToHouseHold(serviceNumber, readingData);
    } else {
      log('Fields not valid');
    }
  }

  Future<void> goToHouseHold(String serviceNumber, int readingData) async {
    final response =
        await locator<HouseholdRepository>().localDataSource.getHouseholds();

    if (response is Right) {
      late HouseholdModel householdModel;
      final houseHolds = response.asRight();

      final isAlreadyExists =
          houseHolds.any((element) => element.serviceNumber == serviceNumber);

      if (isAlreadyExists) {
        householdModel = HouseholdModel().fromJson(houseHolds
            .firstWhere((element) => element.serviceNumber == serviceNumber)
            .toJson());
        householdModel.readings!.add(
          ConsumptionDataModel(
            reading: readingData,
            cost: locator<ElectricityService>().calculateConsumptions(
                householdModel.readings?.last.reading ?? 0, readingData),
            date: DateTime.now(),
          ),
        );
      } else {
        householdModel = HouseholdModel(
          serviceNumber: serviceNumber,
          readings: [
            ConsumptionDataModel(
              reading: readingData,
              cost: locator<ElectricityService>()
                  .calculateConsumptions(0, readingData),
              date: DateTime.now(),
            ),
          ],
        );
      }

      Get.off(
        () => HouseholdDetailView(
          householdModel: householdModel,
          isAlreadyExists: isAlreadyExists,
        ),
      );
    } else {
      log('Local database system failure.');
    }
  }
}
