import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/receipt.dart';
import '../../domain/usecases/add_receipt.dart';
import '../../domain/usecases/delete_receipt.dart';
import '../../domain/usecases/get_all_receipts.dart';
import '../../domain/usecases/get_receipt_by_id.dart';
import '../../domain/usecases/search_receipts.dart';

final receiptListProvider = StateNotifierProvider<ReceiptListNotifier, AsyncValue<List<Receipt>>>((ref) {
  return ReceiptListNotifier();
});

class ReceiptListNotifier extends StateNotifier<AsyncValue<List<Receipt>>> {
  String? _lastError;
  
  ReceiptListNotifier() : super(const AsyncValue.loading()) {
    loadReceipts();
  }

  String? get lastError => _lastError;

  Future<bool> loadReceipts() async {
    state = const AsyncValue.loading();
    final result = await sl<GetAllReceipts>().call(const NoParams());
    return result.fold(
      (failure) {
        _lastError = _getErrorMessage(failure);
        state = AsyncValue.error(_lastError!, StackTrace.current);
        return false;
      },
      (receipts) {
        _lastError = null;
        state = AsyncValue.data(receipts);
        return true;
      },
    );
  }

  Future<bool> addReceipt(Receipt receipt) async {
    final result = await sl<AddReceipt>().call(AddReceiptParams(receipt));
    return result.fold(
      (failure) {
        _lastError = _getErrorMessage(failure);
        state = AsyncValue.error(_lastError!, StackTrace.current);
        return false;
      },
      (_) {
        _lastError = null;
        loadReceipts();
        return true;
      },
    );
  }

  Future<bool> deleteReceipt(String id) async {
    final result = await sl<DeleteReceipt>().call(DeleteReceiptParams(id));
    return result.fold(
      (failure) {
        _lastError = _getErrorMessage(failure);
        state = AsyncValue.error(_lastError!, StackTrace.current);
        return false;
      },
      (_) {
        _lastError = null;
        loadReceipts();
        return true;
      },
    );
  }

  Future<bool> searchReceipts(String query) async {
    if (query.isEmpty) {
      return loadReceipts();
    }
    state = const AsyncValue.loading();
    final result = await sl<SearchReceipts>().call(SearchReceiptsParams(query));
    return result.fold(
      (failure) {
        _lastError = _getErrorMessage(failure);
        state = AsyncValue.error(_lastError!, StackTrace.current);
        return false;
      },
      (receipts) {
        _lastError = null;
        state = AsyncValue.data(receipts);
        return true;
      },
    );
  }

  String _getErrorMessage(Failure failure) {
    if (failure is DatabaseFailure) {
      return 'Database error: ${failure.message}';
    } else if (failure is FileSystemFailure) {
      return 'File error: ${failure.message}';
    } else if (failure is ValidationFailure) {
      return failure.message;
    } else {
      return 'Error: ${failure.message}';
    }
  }
}

final receiptDetailProvider = FutureProvider.family<Receipt, String>((ref, id) async {
  final result = await sl<GetReceiptById>().call(GetReceiptByIdParams(id));
  return result.fold(
    (failure) => throw Exception(failure.message),
    (receipt) => receipt,
  );
});
