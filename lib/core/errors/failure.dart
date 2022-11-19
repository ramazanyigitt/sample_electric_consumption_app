import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => properties;
}

// General failures
class NetworkFailure extends Failure {
  NetworkFailure() : super([]);
}

class ServerFailure extends Failure {
  final String? errorMessage;
  ServerFailure({this.errorMessage}) : super([errorMessage]);
}

class CacheFailure extends Failure {
  final String? errorMessage;
  CacheFailure({this.errorMessage}) : super([errorMessage]);
}

class DeletedFileFailure extends Failure {}
