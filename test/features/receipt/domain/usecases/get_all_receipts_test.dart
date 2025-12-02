import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep_receipt/core/error/failures.dart';
import 'package:keep_receipt/core/usecases/usecase.dart';
import 'package:keep_receipt/features/receipt/domain/entities/receipt.dart';
import 'package:keep_receipt/features/receipt/domain/repositories/receipt_repository.dart';
import 'package:keep_receipt/features/receipt/domain/usecases/get_all_receipts.dart';
import 'package:mocktail/mocktail.dart';

class MockReceiptRepository extends Mock implements ReceiptRepository {}

void main() {
  late GetAllReceipts useCase;
  late MockReceiptRepository mockRepository;

  setUp(() {
    mockRepository = MockReceiptRepository();
    useCase = GetAllReceipts(mockRepository);
  });

  final tReceipts = [
    Receipt(
      id: '1',
      storeName: 'Store 1',
      amount: 50.0,
      date: DateTime(2024, 1, 1),
      category: 'Food & Dining',
      imagePath: '/path/1.jpg',
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
    ),
    Receipt(
      id: '2',
      storeName: 'Store 2',
      amount: 75.0,
      date: DateTime(2024, 1, 2),
      category: 'Shopping',
      imagePath: '/path/2.jpg',
      createdAt: DateTime(2024, 1, 2),
      updatedAt: DateTime(2024, 1, 2),
    ),
  ];

  test('should get all receipts from repository', () async {
    // arrange
    when(() => mockRepository.getAllReceipts())
        .thenAnswer((_) async => Right(tReceipts));

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, Right(tReceipts));
    verify(() => mockRepository.getAllReceipts()).called(1);
  });

  test('should return empty list when no receipts exist', () async {
    // arrange
    when(() => mockRepository.getAllReceipts())
        .thenAnswer((_) async => const Right(<Receipt>[]));

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, const Right(<Receipt>[]));
  });

  test('should return DatabaseFailure when repository fails', () async {
    // arrange
    const tFailure = DatabaseFailure('Failed to get receipts');
    when(() => mockRepository.getAllReceipts())
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, const Left(tFailure));
  });
}
