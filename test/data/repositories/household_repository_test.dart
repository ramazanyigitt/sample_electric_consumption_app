import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/data/repositories/household/household_repository.dart';
import 'package:sample_fluttercase/data/services/household_service.dart';
import 'package:sample_fluttercase/domain/entities/household.dart';

import 'household_repository_test.mocks.dart';

@GenerateMocks([HouseholdRepository, HouseholdService])
void main() {
  late MockHouseholdRepository mockHouseholdRepository;
  setUp(() {
    mockHouseholdRepository = MockHouseholdRepository();
  });

  final testHousehold = HouseholdModel(
    serviceNumber: 'dsads23132',
  );

  final list = [testHousehold];
  test('Get Households hardcoded mock', () async {
    when(mockHouseholdRepository.getHouseholds())
        .thenAnswer((realInvocation) async {
      return TestRight<List<HouseholdModel>>(list);
    });

    final result = await mockHouseholdRepository.getHouseholds();

    expect(result, TestRight<List<Household>>(list));
    verify(mockHouseholdRepository.getHouseholds());
    verifyNoMoreInteractions(mockHouseholdRepository);
  });

  test('Get Households with internet connection', () async {
    when(mockHouseholdRepository.networkInfo.isConnected)
        .thenAnswer((realInvocation) async => false);

    when(mockHouseholdRepository.getHouseholds())
        .thenAnswer((realInvocation) async {
      if (await mockHouseholdRepository.networkInfo.isConnected) {
        final responseHouseholds =
            await mockHouseholdRepository.remoteDataSource.getHouseholds();
        if (responseHouseholds is Right) {
          mockHouseholdRepository.localDataSource
              .saveHouseholds(responseHouseholds.asRight());
        }
        return responseHouseholds;
      } else {
        return mockHouseholdRepository.localDataSource.getHouseholds();
      }
    });

    final result = await mockHouseholdRepository.getHouseholds();

    expect(result, TestRight<List<Household>>(list));
    verify(mockHouseholdRepository.getHouseholds());
    verifyNoMoreInteractions(mockHouseholdRepository);
  });
}
