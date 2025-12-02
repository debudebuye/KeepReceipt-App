import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/receipt.dart';
import '../repositories/receipt_repository.dart';

class GetReceiptById implements UseCase<Receipt, GetReceiptByIdParams> {
  final ReceiptRepository repository;

  GetReceiptById(this.repository);

  @override
  Future<Either<Failure, Receipt>> call(GetReceiptByIdParams params) async {
    return await repository.getReceiptById(params.id);
  }
}

class GetReceiptByIdParams {
  final String id;
  GetReceiptByIdParams(this.id);
}
