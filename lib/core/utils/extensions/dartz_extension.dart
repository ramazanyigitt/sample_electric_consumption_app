import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';

typedef DataModel<T> = Either<Failure, T>;
typedef TestRight<T> = Right<Failure, T>;
typedef TestLeft<T> = Left<Failure, T>;

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value; //
  L asLeft() => (this as Left).value;
}
