import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/file_helper.dart';
import '../../domain/entities/receipt.dart';
import '../../domain/repositories/receipt_repository.dart';
import '../datasources/receipt_local_datasource.dart';
import '../models/receipt_model.dart';

class ReceiptRepositoryImpl implements ReceiptRepository {
  final ReceiptLocalDataSource localDataSource;

  ReceiptRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Receipt>> addReceipt(Receipt receipt) async {
    try {
      final model = ReceiptModel.fromEntity(receipt);
      await localDataSource.addReceipt(model);
      return Right(receipt);
    } catch (e) {
      return Left(DatabaseFailure('Failed to add receipt: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Receipt>>> getAllReceipts() async {
    try {
      final models = await localDataSource.getAllReceipts();
      return Right(models);
    } catch (e) {
      return Left(DatabaseFailure('Failed to get receipts: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Receipt>> getReceiptById(String id) async {
    try {
      final model = await localDataSource.getReceiptById(id);
      if (model == null) {
        return const Left(DatabaseFailure('Receipt not found'));
      }
      return Right(model);
    } catch (e) {
      return Left(DatabaseFailure('Failed to get receipt: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Receipt>> updateReceipt(Receipt receipt) async {
    try {
      final model = ReceiptModel.fromEntity(receipt);
      await localDataSource.updateReceipt(model);
      return Right(receipt);
    } catch (e) {
      return Left(DatabaseFailure('Failed to update receipt: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReceipt(String id) async {
    try {
      final model = await localDataSource.getReceiptById(id);
      if (model != null) {
        await FileHelper.deleteReceiptImage(model.imagePath);
      }
      await localDataSource.deleteReceipt(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Failed to delete receipt: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Receipt>>> searchReceipts(String query) async {
    try {
      final models = await localDataSource.searchReceipts(query);
      return Right(models);
    } catch (e) {
      return Left(DatabaseFailure('Failed to search receipts: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Receipt>>> filterByCategory(String category) async {
    try {
      final allModels = await localDataSource.getAllReceipts();
      final filtered = allModels.where((m) => m.category == category).toList();
      return Right(filtered);
    } catch (e) {
      return Left(DatabaseFailure('Failed to filter receipts: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Receipt>>> filterByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final allModels = await localDataSource.getAllReceipts();
      final filtered = allModels
          .where((m) => m.date.isAfter(startDate) && m.date.isBefore(endDate))
          .toList();
      return Right(filtered);
    } catch (e) {
      return Left(DatabaseFailure('Failed to filter receipts: ${e.toString()}'));
    }
  }
}
