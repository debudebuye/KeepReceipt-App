import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Legacy file helper - Use ImageHelper for new code
class FileHelper {
  static const _uuid = Uuid();
  
  static Future<String> saveReceiptImage(String sourcePath) async {
    final appDir = await getApplicationDocumentsDirectory();
    final receiptDir = Directory('${appDir.path}/receipts');
    
    if (!await receiptDir.exists()) {
      await receiptDir.create(recursive: true);
    }
    
    final fileName = '${_uuid.v4()}.jpg';
    final targetPath = '${receiptDir.path}/$fileName';
    
    final sourceFile = File(sourcePath);
    await sourceFile.copy(targetPath);
    
    return targetPath;
  }
  
  static Future<void> deleteReceiptImage(String imagePath) async {
    final file = File(imagePath);
    if (await file.exists()) {
      await file.delete();
    }
  }
  
  static Future<bool> imageExists(String imagePath) async {
    final file = File(imagePath);
    return await file.exists();
  }
}
