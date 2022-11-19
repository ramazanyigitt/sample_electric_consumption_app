part of 'home_view.dart';

class HomeViewModel extends ReactiveViewModel {
  HouseholdService householdService = locator<HouseholdService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [householdService];

  late bool isInited;
  Future<void> init() async {
    isInited = false;
    await Future.wait([
      getHouseholds(),
    ]);
    isInited = true;
    notifyListeners();
  }

  Future<void> getHouseholds() async {
    log('Getting households ');
    final response =
        await locator<HouseholdRepository>().localDataSource.getHouseholds();
    if (response is Right) {
      final houseHolds = response.asRight();
      householdService.setHouseholds(houseHolds);
      log('Response right: ${response.asRight()}');
    } else {
      log('Response right: ${response.asLeft()}');
    }
  }
}
