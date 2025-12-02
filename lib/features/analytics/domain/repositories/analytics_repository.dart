import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

/// Future: Analytics repository
/// This will provide spending insights and statistics
abstract class AnalyticsRepository {
  /// Get total spending for a date range
  Future<Either<Failure, double>> getTotalSpending(DateTime start, DateTime end);
  
  /// Get spending by category
  Future<Either<Failure, Map<String, double>>> getSpendingByCategory(
    DateTime start,
    DateTime end,
  );
  
  /// Get monthly spending trend
  Future<Either<Failure, List<MonthlySpending>>> getMonthlyTrend(int months);
  
  /// Get top merchants
  Future<Either<Failure, List<MerchantSpending>>> getTopMerchants(int limit);
}

class MonthlySpending {
  final DateTime month;
  final double amount;
  
  MonthlySpending({required this.month, required this.amount});
}

class MerchantSpending {
  final String merchantName;
  final double totalAmount;
  final int receiptCount;
  
  MerchantSpending({
    required this.merchantName,
    required this.totalAmount,
    required this.receiptCount,
  });
}
