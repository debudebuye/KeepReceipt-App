import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import '../../features/receipt/data/datasources/receipt_local_datasource.dart';
import '../../features/receipt/data/repositories/receipt_repository_impl.dart';
import '../../features/receipt/domain/repositories/receipt_repository.dart';
import '../../features/receipt/domain/usecases/add_receipt.dart';
import '../../features/receipt/domain/usecases/delete_receipt.dart';
import '../../features/receipt/domain/usecases/get_all_receipts.dart';
import '../../features/receipt/domain/usecases/get_receipt_by_id.dart';
import '../../features/receipt/domain/usecases/update_receipt.dart';
import '../../features/receipt/domain/usecases/search_receipts.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data sources
  final receiptBox = await Hive.openBox('receipts');
  sl.registerLazySingleton<ReceiptLocalDataSource>(
    () => ReceiptLocalDataSourceImpl(receiptBox),
  );
  
  // Repositories
  sl.registerLazySingleton<ReceiptRepository>(
    () => ReceiptRepositoryImpl(sl()),
  );
  
  // Use cases
  sl.registerLazySingleton(() => AddReceipt(sl()));
  sl.registerLazySingleton(() => DeleteReceipt(sl()));
  sl.registerLazySingleton(() => GetAllReceipts(sl()));
  sl.registerLazySingleton(() => GetReceiptById(sl()));
  sl.registerLazySingleton(() => UpdateReceipt(sl()));
  sl.registerLazySingleton(() => SearchReceipts(sl()));
}
