import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/data/repositories/household/household_repository.dart';
import 'package:sample_fluttercase/data/services/household_service.dart';
import 'package:sample_fluttercase/domain/entities/household.dart';

import 'household_service_test.mocks.dart';

@GenerateMocks([HouseholdRepository, HouseholdService, Household])
void main() {
  late MockHouseholdService service;
  setUp(() {
    service = MockHouseholdService();
  });

  final testHousehold = HouseholdModel(
    serviceNumber: 'dsads23132',
    previousReading: 0,
  );
  final list = [testHousehold];

  test('Set Households', () async {
    var houseHolds = List<HouseholdModel>.empty(growable: true);
    when(service.setHouseholds(list)).thenAnswer((realInvocation) {
      houseHolds = list;
    });
    when(service.getHouseholds()).thenAnswer((realInvocation) {
      return houseHolds;
    });

    service.setHouseholds(list);

    final result = service.getHouseholds();

    expect(result, list);
    verify(service.setHouseholds(list));
    verify(service.getHouseholds());
    verifyNoMoreInteractions(service);
  });

  test('Update Household Consumption', () async {
    const serviceNumber = 'dsads23132';
    const newConsumption = 143;

    when(service.getHouseholds()).thenAnswer((realInvocation) {
      return list;
    });
    when(service.updateConsumption(serviceNumber, newConsumption))
        .thenAnswer((realInvocation) async {
      final isContainsHouseHold = service
          .getHouseholds()
          .any((element) => element.serviceNumber == serviceNumber);
      if (isContainsHouseHold) {
        final houseHold = service
            .getHouseholds()
            .firstWhere((element) => element.serviceNumber == serviceNumber);
        houseHold.previousReading = newConsumption;
      }
    });

    service.updateConsumption(serviceNumber, newConsumption);

    final result = service.getHouseholds();

    final modelInList =
        result.firstWhere((element) => element.serviceNumber == serviceNumber);
    expect(modelInList.previousReading, newConsumption);
    verify(service.getHouseholds());
    verify(service.updateConsumption(serviceNumber, newConsumption));
    verifyNoMoreInteractions(service);
  });
}
