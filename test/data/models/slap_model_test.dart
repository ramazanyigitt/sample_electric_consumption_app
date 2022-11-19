import 'package:flutter_test/flutter_test.dart';
import 'package:sample_fluttercase/data/models/slab_model.dart';
import 'package:sample_fluttercase/domain/entities/slab.dart';

void main() {
  final tBlogPostModel = SlabModel(
    pricePerUnit: 5,
    minConsumption: 1,
    maxConsumption: 100,
  );
  test('Subclass of Slab entity', () async {
    expect(tBlogPostModel, isA<Slab>());
  });
}
