import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../data/repositories/household/data_sources/household_hive_repository.dart';
import '../domain/repositories/household/data_sources/ilocal_repository.dart';
import 'injection_container.config.dart';

final locator = GetIt.instance;
late final DataType environmentTag;

enum DataType {
  real,
  mock,
}

@InjectableInit(
  generateForDir: [
    'lib',
  ], // <-- Generate for these directories içinde parametere var başka pluginlerden işe yaramaz.
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {
  const String data = String.fromEnvironment("DATA_TYPE");
  environmentTag =
      DataType.values.firstWhere((element) => element.name == data);
  await Hive.initFlutter();

  await _initSource<IHouseholdLocalRepository>(
    source: HouseholdHiveRepository(),
  );

  $initGetIt(
    locator,
    environment: data,
  );
}

Future<void> _initSource<T extends Object>({required source}) async {
  await source.init();
  locator.registerLazySingleton<T>(
    () => source,
  );
}
