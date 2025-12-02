// Integration test for receipt flow
// NOTE: This test requires platform plugins (path_provider, hive) and must be run
// as an integration test on a device/emulator with full platform support.
// 
// To run: flutter test integration_test/
// 
// This test is kept as a reference for expected behavior. For actual testing,
// manually test the flow in the app on a device:
// 1. Add a receipt via camera or gallery
// 2. Verify it appears in the list
// 3. Delete the receipt
// 4. Verify it's removed from the list

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep_receipt/features/receipt/domain/entities/receipt.dart';
import 'package:keep_receipt/features/receipt/presentation/providers/receipt_provider.dart';

void main() {
  test('Receipt flow reference - demonstrates expected behavior', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final now = DateTime.now();
    
    // Create a test receipt
    final testReceipt = Receipt(
      id: 'test-receipt-integration-1',
      storeName: 'Test Store',
      amount: 99.99,
      date: now,
      imagePath: '/test/path/image.jpg',
      category: 'Groceries',
      notes: 'Integration test receipt',
      createdAt: now,
      updatedAt: now,
    );

    // Add receipt
    final addSuccess = await container
        .read(receiptListProvider.notifier)
        .addReceipt(testReceipt);
    
    expect(addSuccess, isTrue, reason: 'Receipt should be added successfully');

    // Wait for state to update
    await Future.delayed(const Duration(milliseconds: 100));

    // Verify receipt was added
    final receiptsState = container.read(receiptListProvider);
    receiptsState.when(
      data: (receipts) {
        expect(receipts.length, greaterThan(0));
        expect(
          receipts.any((r) => r.id == testReceipt.id),
          isTrue,
          reason: 'Receipt should be in the list',
        );
      },
      loading: () => fail('Should not be loading'),
      error: (error, stack) => fail('Should not have error: $error'),
    );

    // Delete receipt
    final deleteSuccess = await container
        .read(receiptListProvider.notifier)
        .deleteReceipt(testReceipt.id);
    
    expect(deleteSuccess, isTrue, reason: 'Receipt should be deleted successfully');

    // Wait for state to update
    await Future.delayed(const Duration(milliseconds: 100));

    // Verify receipt was deleted
    final receiptsAfterDelete = container.read(receiptListProvider);
    receiptsAfterDelete.when(
      data: (receipts) {
        expect(
          receipts.any((r) => r.id == testReceipt.id),
          isFalse,
          reason: 'Receipt should be removed from the list',
        );
      },
      loading: () => fail('Should not be loading'),
      error: (error, stack) => fail('Should not have error: $error'),
    );
  });
}
