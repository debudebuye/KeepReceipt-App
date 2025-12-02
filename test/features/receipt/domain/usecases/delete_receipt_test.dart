import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep_receipt/core/error/failures.dart';
import 'package:keep_receipt/features/receipt/domain/repositories/receipt_repository.dart';
import 'package:keep_receipt/features/receipt/domain/usecases/delete_receipt.dart';
import 'package:mocktail/mocktail.dart';

class MockReceiptRepository extends Mock implements ReceiptRepository {}

void main() {
  late DeleteReceipt useCase;
  late MockReceiptRepository mockRepository;

  setUp(() {
    mockRepository = MockReceiptRepository();
    useCase = DeleteReceipt(mockRepository);
  });

  const tReceiptId = '123';

  test('should delete receipt successfully', () async {
    // arrange
    when(() => mockRepository.deleteReceipt(any()))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await useCase(DeleteReceiptParams(tReceiptId));

    // assert
    expect(result, const Right(null));
    verify(() => mockRepository.deleteReceipt(tReceiptId)).called(1);
  });

  test('should return DatabaseFailure when deletion fails', () async {
    // arrange
    const tFailure = DatabaseFailure('Failed to delete receipt');
    when(() => mockRepository.deleteReceipt(any()))
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await useCase(DeleteReceiptParams(tReceiptId));

    // assert
    expect(result, const Left(tFailure));
    verify(() => mockRepository.deleteReceipt(tReceiptId)).called(1);
  });
}
