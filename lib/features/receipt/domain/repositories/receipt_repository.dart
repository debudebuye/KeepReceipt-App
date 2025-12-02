import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/receipt.dart';

abstract class ReceiptRepository {
  Future<Either<Failure, Receipt>> addReceipt(Receipt receipt);
  Future<Either<Failure, List<Receipt>>> getAllReceipts();
  Future<Either<Failure, Receipt>> getReceiptById(String id);
  Future<Either<Failure, Receipt>> updateReceipt(Receipt receipt);
  Future<Either<Failure, void>> deleteReceipt(String id);
  Future<Either<Failure, List<Receipt>>> searchReceipts(String query);
  Future<Either<Failure, List<Receipt>>> filterByCategory(String category);
  Future<Either<Failure, List<Receipt>>> filterByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
