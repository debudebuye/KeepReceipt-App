import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

/// Future: OCR extraction repository
/// This will extract text from receipt images
abstract class OcrRepository {
  /// Extract receipt data from image
  Future<Either<Failure, OcrResult>> extractFromImage(String imagePath);
}

class OcrResult {
  final String? storeName;
  final double? amount;
  final DateTime? date;
  
  OcrResult({this.storeName, this.amount, this.date});
}
