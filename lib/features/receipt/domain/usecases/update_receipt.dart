import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/receipt.dart';
import '../repositories/receipt_repository.dart';

class UpdateReceipt implements UseCase<Receipt, UpdateReceiptParams> {
  final ReceiptRepository repository;

  UpdateReceipt(this.repository);

  @override
  Future<Either<Failure, Receipt>> call(UpdateReceiptParams params) async {
    return await repository.updateReceipt(params.receipt);
  }
}

class UpdateReceiptParams {
  final Receipt receipt;
  UpdateReceiptParams(this.receipt);
}
