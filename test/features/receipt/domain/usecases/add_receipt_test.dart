// NOTE: This is a unit test that mocks the repository layer.
// For integration tests that interact with actual platform plugins
// (e.g., sqflite, path_provider), use integration_test/ directory instead,
// as platform plugins are not available in the standard test environment.

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep_receipt/core/error/failures.dart';
import 'package:keep_receipt/features/receipt/domain/entities/receipt.dart';
import 'package:keep_receipt/features/receipt/domain/repositories/receipt_repository.dart';
import 'package:keep_receipt/features/receipt/domain/usecases/add_receipt.dart';
import 'package:mocktail/mocktail.dart';

class MockReceiptRepository extends Mock implements ReceiptRepository {}

class FakeReceipt extends Fake implements Receipt {}

void main() {
  late AddReceipt useCase;
  late MockReceiptRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(FakeReceipt());
  });

  setUp(() {
    mockRepository = MockReceiptRepository();
    useCase = AddReceipt(mockRepository);
  });

  final tReceipt = Receipt(
    id: '1',
    storeName: 'Test Store',
    amount: 99.99,
    date: DateTime(2024, 1, 1),
    category: 'Food & Dining',
    notes: 'Test notes',
    imagePath: '/path/to/image.jpg',
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 1, 1),
  );

  test('should add receipt successfully', () async {
    // arrange
    when(() => mockRepository.addReceipt(any()))
        .thenAnswer((_) async => Right(tReceipt));

    // act
    final result = await useCase(AddReceiptParams(tReceipt));

    // assert
    expect(result, Right(tReceipt));
    verify(() => mockRepository.addReceipt(tReceipt)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return DatabaseFailure when repository fails', () async {
    // arrange
    const tFailure = DatabaseFailure('Failed to add receipt');
    when(() => mockRepository.addReceipt(any()))
        .thenAnswer((_) async => const Left(tFailure));

    // act
    final result = await useCase(AddReceiptParams(tReceipt));

    // assert
    expect(result, const Left(tFailure));
    verify(() => mockRepository.addReceipt(tReceipt)).called(1);
  });
}
