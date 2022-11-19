import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_fluttercase/domain/entities/household.dart';

import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';

import '../../../../domain/repositories/household/data_sources/ilocal_repository.dart';
import '../../../models/household_model.dart';

class HouseholdHiveRepository implements IHouseholdLocalRepository {
  final _householdBoxName = 'households';

  @override
  Future<DataModel<List<HouseholdModel>>> getHouseholds() async {
    var box = Hive.box<HouseholdModel>(_householdBoxName);
    return Right(box.values.toList());
  }

  @override
  Future<void> saveHouseholds(List<HouseholdModel> houseHolds) async {
    for (var householdModel in houseHolds) {
      addHousehold(householdModel);
    }
  }

  Future<void> init() async {
    Hive.registerAdapter(HouseholdModelAdapter());
    Hive.registerAdapter(ConsumptionDataModelAdapter());
    await Hive.openBox<HouseholdModel>(_householdBoxName);
  }

  Future<void> addHousehold(HouseholdModel householdModel) async {
    var box = Hive.box<HouseholdModel>(_householdBoxName);

    final inBoxValue = box.values.any(
        (element) => element.serviceNumber == householdModel.serviceNumber);
    if (inBoxValue) {
      log('Already registered please update instead add.');
      return;
    }

    await box.add(householdModel);
  }

  Future<void> updateHousehold(HouseholdModel householdModel) async {
    var box = Hive.box<HouseholdModel>(_householdBoxName);

    final inBoxValue = box.values.firstWhere(
        (element) => element.serviceNumber == householdModel.serviceNumber);
    inBoxValue.updateFromJson(householdModel.toJson());
    await inBoxValue.save();
    householdModel = inBoxValue;
  }

  /*Future<void> deleteHousehold() async {
    var box = Hive.box<HouseholdModel>(_householdBoxName);

    await box.values.first.save();
  }*/

}
