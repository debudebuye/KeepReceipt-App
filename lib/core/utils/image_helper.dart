import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Helper class for image operations including compression
class ImageHelper {
  static const _uuid = Uuid();
  static const int maxWidth = 1920;
  static const int maxHeight = 1920;
  static const int quality = 85;

  /// Compress and save receipt image to local storage
  static Future<String> compressAndSaveImage(String sourcePath) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final receiptDir = Directory('${appDir.path}/receipts');
      
      if (!await receiptDir.exists()) {
        await receiptDir.create(recursive: true);
      }
      
      final fileName = '${_uuid.v4()}.jpg';
      final targetPath = '${receiptDir.path}/$fileName';

      // Read the source image
      final sourceFile = File(sourcePath);
      final bytes = await sourceFile.readAsBytes();
      
      // Decode image
      img.Image? image = img.decodeImage(bytes);
      if (image == null) {
        // If decoding fails, just copy the original
        await sourceFile.copy(targetPath);
        return targetPath;
      }

      // Resize if image is too large
      if (image.width > maxWidth || image.height > maxHeight) {
        image = img.copyResize(
          image,
          width: image.width > image.height ? maxWidth : null,
          height: image.height > image.width ? maxHeight : null,
        );
      }

      // Encode as JPEG with quality compression
      final compressedBytes = img.encodeJpg(image, quality: quality);
      
      // Save compressed image
      final targetFile = File(targetPath);
      await targetFile.writeAsBytes(compressedBytes);
      
      // Log compression results
      final originalSize = bytes.length;
      final compressedSize = compressedBytes.length;
      final savedPercent = ((originalSize - compressedSize) / originalSize * 100).toStringAsFixed(1);
      debugPrint('Image compressed: ${_formatBytes(originalSize)} → ${_formatBytes(compressedSize)} (saved $savedPercent%)');
      
      return targetPath;
    } catch (e) {
      debugPrint('Error compressing image: $e');
      // Fallback: copy original if compression fails
      final appDir = await getApplicationDocumentsDirectory();
      final receiptDir = Directory('${appDir.path}/receipts');
      if (!await receiptDir.exists()) {
        await receiptDir.create(recursive: true);
      }
      final fileName = '${_uuid.v4()}.jpg';
      final targetPath = '${receiptDir.path}/$fileName';
      await File(sourcePath).copy(targetPath);
      return targetPath;
    }
  }

  /// Delete image from local storage
  static Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      debugPrint('Error deleting image: $e');
    }
  }

  /// Check if image file exists
  static Future<bool> imageExists(String imagePath) async {
    try {
      final file = File(imagePath);
      return await file.exists();
    } catch (e) {
      return false;
    }
  }

  /// Format bytes to human-readable string
  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
