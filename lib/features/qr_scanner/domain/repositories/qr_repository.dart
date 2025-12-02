import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

/// Future: QR code scanner repository
/// This will scan payment provider QR codes
abstract class QrRepository {
  /// Scan QR code and extract payment info
  Future<Either<Failure, QrPaymentData>> scanQrCode();
}

class QrPaymentData {
  final String provider;
  final double? amount;
  final String? merchantName;
  final String? transactionId;
  
  QrPaymentData({
    required this.provider,
    this.amount,
    this.merchantName,
    this.transactionId,
  });
}
