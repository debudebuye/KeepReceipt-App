import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/receipt.dart';
import '../repositories/receipt_repository.dart';

class SearchReceipts implements UseCase<List<Receipt>, SearchReceiptsParams> {
  final ReceiptRepository repository;

  SearchReceipts(this.repository);

  @override
  Future<Either<Failure, List<Receipt>>> call(SearchReceiptsParams params) async {
    return await repository.searchReceipts(params.query);
  }
}

class SearchReceiptsParams {
  final String query;
  SearchReceiptsParams(this.query);
}
