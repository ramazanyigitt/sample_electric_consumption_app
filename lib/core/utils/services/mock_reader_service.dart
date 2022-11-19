import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockReaderService {
  Future<T> callMock<T>(String mockUrl, dynamic parseModel) async {
    final data = await rootBundle.loadString(mockUrl);
    final json = jsonDecode(data);
    final campaigns = parseModel().fromJson(json);
    return campaigns;
  }

  Future<List<T>> callMockList<T>(String mockUrl, dynamic parseModel) async {
    final data = await rootBundle.loadString(mockUrl);
    final json = jsonDecode(data);
    final campaigns = (json as List)
        .map<T>((campaign) => parseModel().fromJson(campaign))
        .toList();
    return campaigns;
  }
}
