import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../receipt/domain/entities/receipt.dart';

/// Future: Cloud sync repository
/// This will sync receipts with cloud storage
abstract class SyncRepository {
  /// Upload receipt to cloud
  Future<Either<Failure, void>> uploadReceipt(Receipt receipt);
  
  /// Download receipts from cloud
  Future<Either<Failure, List<Receipt>>> downloadReceipts();
  
  /// Sync local and cloud data
  Future<Either<Failure, void>> syncAll();
  
  /// Check sync status
  Future<Either<Failure, SyncStatus>> getSyncStatus();
}

class SyncStatus {
  final DateTime? lastSyncTime;
  final int pendingUploads;
  final bool isConnected;
  
  SyncStatus({
    this.lastSyncTime,
    required this.pendingUploads,
    required this.isConnected,
  });
}
