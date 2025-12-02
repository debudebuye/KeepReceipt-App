import 'package:dartz/dartz.dart';
import '../error/failures.dart';

/// Base class for all use cases
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {
  const NoParams();
}
