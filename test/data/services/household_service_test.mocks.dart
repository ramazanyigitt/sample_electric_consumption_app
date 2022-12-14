// Mocks generated by Mockito 5.3.2 from annotations
// in sample_fluttercase/test/data/services/household_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sample_fluttercase/core/errors/failure.dart' as _i8;
import 'package:sample_fluttercase/core/platform/network_info.dart' as _i4;
import 'package:sample_fluttercase/data/models/household_model.dart' as _i9;
import 'package:sample_fluttercase/data/repositories/household/household_repository.dart'
    as _i6;
import 'package:sample_fluttercase/data/services/household_service.dart'
    as _i10;
import 'package:sample_fluttercase/domain/entities/household.dart' as _i11;
import 'package:sample_fluttercase/domain/repositories/household/data_sources/ilocal_repository.dart'
    as _i3;
import 'package:sample_fluttercase/domain/repositories/household/data_sources/iremote_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIHouseholdRemoteRepository_0 extends _i1.SmartFake
    implements _i2.IHouseholdRemoteRepository {
  _FakeIHouseholdRemoteRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIHouseholdLocalRepository_1 extends _i1.SmartFake
    implements _i3.IHouseholdLocalRepository {
  _FakeIHouseholdLocalRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNetworkInfo_2 extends _i1.SmartFake implements _i4.NetworkInfo {
  _FakeNetworkInfo_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HouseholdRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockHouseholdRepository extends _i1.Mock
    implements _i6.HouseholdRepository {
  MockHouseholdRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IHouseholdRemoteRepository get remoteDataSource => (super.noSuchMethod(
        Invocation.getter(#remoteDataSource),
        returnValue: _FakeIHouseholdRemoteRepository_0(
          this,
          Invocation.getter(#remoteDataSource),
        ),
      ) as _i2.IHouseholdRemoteRepository);
  @override
  _i3.IHouseholdLocalRepository get localDataSource => (super.noSuchMethod(
        Invocation.getter(#localDataSource),
        returnValue: _FakeIHouseholdLocalRepository_1(
          this,
          Invocation.getter(#localDataSource),
        ),
      ) as _i3.IHouseholdLocalRepository);
  @override
  _i4.NetworkInfo get networkInfo => (super.noSuchMethod(
        Invocation.getter(#networkInfo),
        returnValue: _FakeNetworkInfo_2(
          this,
          Invocation.getter(#networkInfo),
        ),
      ) as _i4.NetworkInfo);
  @override
  _i7.Future<
      _i5
          .Either<_i8.Failure, List<_i9.HouseholdModel>>> getHouseholds() =>
      (super.noSuchMethod(
        Invocation.method(
          #getHouseholds,
          [],
        ),
        returnValue:
            _i7.Future<_i5.Either<_i8.Failure, List<_i9.HouseholdModel>>>.value(
                _FakeEither_3<_i8.Failure, List<_i9.HouseholdModel>>(
          this,
          Invocation.method(
            #getHouseholds,
            [],
          ),
        )),
      ) as _i7.Future<_i5.Either<_i8.Failure, List<_i9.HouseholdModel>>>);
}

/// A class which mocks [HouseholdService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHouseholdService extends _i1.Mock implements _i10.HouseholdService {
  MockHouseholdService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i9.HouseholdModel> getHouseholds() => (super.noSuchMethod(
        Invocation.method(
          #getHouseholds,
          [],
        ),
        returnValue: <_i9.HouseholdModel>[],
      ) as List<_i9.HouseholdModel>);
  @override
  void setHouseholds(List<_i9.HouseholdModel>? newHouseholds) =>
      super.noSuchMethod(
        Invocation.method(
          #setHouseholds,
          [newHouseholds],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void updateConsumption(
    String? serviceNumber,
    _i9.ConsumptionDataModel? newConsumption, {
    bool? save = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #updateConsumption,
          [
            serviceNumber,
            newConsumption,
          ],
          {#save: save},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Household].
///
/// See the documentation for Mockito's code generation for more information.
class MockHousehold extends _i1.Mock implements _i11.Household {
  MockHousehold() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set serviceNumber(String? _serviceNumber) => super.noSuchMethod(
        Invocation.setter(
          #serviceNumber,
          _serviceNumber,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set readings(List<_i9.ConsumptionDataModel>? _readings) => super.noSuchMethod(
        Invocation.setter(
          #readings,
          _readings,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}
