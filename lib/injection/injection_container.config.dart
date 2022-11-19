// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/platform/network_info.dart' as _i13;
import '../core/utils/services/mock_reader_service.dart' as _i12;
import '../core/utils/services/validator_service.dart' as _i14;
import '../data/repositories/electric_meter/data_sources/electric_meter_hive_repository.dart'
    as _i6;
import '../data/repositories/electric_meter/data_sources/electric_meter_mock_repository.dart'
    as _i8;
import '../data/repositories/electric_meter/electric_meter_repository.dart'
    as _i15;
import '../data/repositories/household/data_sources/household_http_repository.dart'
    as _i11;
import '../data/repositories/household/data_sources/household_mock_repository.dart'
    as _i10;
import '../data/repositories/household/household_repository.dart' as _i16;
import '../data/services/electricity_service.dart' as _i3;
import '../data/services/household_service.dart' as _i4;
import '../domain/repositories/electric_meter/data_sources/ilocal_repository.dart'
    as _i5;
import '../domain/repositories/electric_meter/data_sources/iremote_repository.dart'
    as _i7;
import '../domain/repositories/household/data_sources/ilocal_repository.dart'
    as _i17;
import '../domain/repositories/household/data_sources/iremote_repository.dart'
    as _i9;

const String _mock = 'mock';
const String _real = 'real';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ElectricityService>(() => _i3.ElectricityService());
  gh.lazySingleton<_i4.HouseholdService>(() => _i4.HouseholdService());
  gh.lazySingleton<_i5.IElectricMeterLocalRepository>(
      () => _i6.ElectricMeterHiveRepository());
  gh.lazySingleton<_i7.IElectricMeterRemoteRepository>(
    () => _i8.ElectricMeterMockRepository(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i9.IHouseholdRemoteRepository>(
    () => _i10.HouseholdMockRepository(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i9.IHouseholdRemoteRepository>(
    () => _i11.HouseholdHttpRepository(),
    registerFor: {_real},
  );
  gh.lazySingleton<_i12.MockReaderService>(() => _i12.MockReaderService());
  gh.lazySingleton<_i13.NetworkInfo>(() => _i13.NetworkInfoImpl());
  gh.lazySingleton<_i14.ValidatorService>(() => _i14.ValidatorService());
  gh.lazySingleton<_i15.ElectricMeterRepository>(
      () => _i15.ElectricMeterRepository(
            remoteDataSource: get<_i7.IElectricMeterRemoteRepository>(),
            localDataSource: get<_i5.IElectricMeterLocalRepository>(),
            networkInfo: get<_i13.NetworkInfo>(),
          ));
  gh.lazySingleton<_i16.HouseholdRepository>(() => _i16.HouseholdRepository(
        remoteDataSource: get<_i9.IHouseholdRemoteRepository>(),
        localDataSource: get<_i17.IHouseholdLocalRepository>(),
        networkInfo: get<_i13.NetworkInfo>(),
      ));
  return get;
}
