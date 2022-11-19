import 'package:flutter_test/flutter_test.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/domain/entities/household.dart';

void main() {
  final tBlogPostModel = HouseholdModel(
    serviceNumber: '13basd3221',
  );
  test('Subclass of Household entity', () async {
    expect(tBlogPostModel, isA<Household>());
  });
}
