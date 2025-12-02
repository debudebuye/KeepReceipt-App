import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/receipt.dart';
import '../repositories/receipt_repository.dart';

class AddReceipt implements UseCase<Receipt, AddReceiptParams> {
  final ReceiptRepository repository;

  AddReceipt(this.repository);

  @override
  Future<Either<Failure, Receipt>> call(AddReceiptParams params) async {
    return await repository.addReceipt(params.receipt);
  }
}

class AddReceiptParams {
  final Receipt receipt;
  AddReceiptParams(this.receipt);
}
