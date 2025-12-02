import 'package:hive/hive.dart';
import '../models/receipt_model.dart';

abstract class ReceiptLocalDataSource {
  Future<void> addReceipt(ReceiptModel receipt);
  Future<List<ReceiptModel>> getAllReceipts();
  Future<ReceiptModel?> getReceiptById(String id);
  Future<void> updateReceipt(ReceiptModel receipt);
  Future<void> deleteReceipt(String id);
  Future<List<ReceiptModel>> searchReceipts(String query);
}

class ReceiptLocalDataSourceImpl implements ReceiptLocalDataSource {
  final Box receiptBox;

  ReceiptLocalDataSourceImpl(this.receiptBox);

  @override
  Future<void> addReceipt(ReceiptModel receipt) async {
    await receiptBox.put(receipt.id, receipt);
  }

  @override
  Future<List<ReceiptModel>> getAllReceipts() async {
    final receipts = receiptBox.values.cast<ReceiptModel>().toList();
    receipts.sort((a, b) => b.date.compareTo(a.date));
    return receipts;
  }

  @override
  Future<ReceiptModel?> getReceiptById(String id) async {
    return receiptBox.get(id) as ReceiptModel?;
  }

  @override
  Future<void> updateReceipt(ReceiptModel receipt) async {
    await receiptBox.put(receipt.id, receipt);
  }

  @override
  Future<void> deleteReceipt(String id) async {
    await receiptBox.delete(id);
  }

  @override
  Future<List<ReceiptModel>> searchReceipts(String query) async {
    final allReceipts = await getAllReceipts();
    final lowerQuery = query.toLowerCase();
    
    return allReceipts.where((receipt) {
      return receipt.storeName.toLowerCase().contains(lowerQuery) ||
          receipt.category.toLowerCase().contains(lowerQuery) ||
          (receipt.notes?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }
}
