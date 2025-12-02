import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Helper for handling permissions
class PermissionHandler {
  /// Check and request camera permission
  static Future<bool> requestCameraPermission(BuildContext context) async {
    try {
      // Try to access camera through image picker
      // This will automatically request permission on Android
      final picker = ImagePicker();
      final result = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      
      // If we got here, permission was granted
      return result != null;
    } catch (e) {
      debugPrint('Camera permission error: $e');
      if (context.mounted) {
        _showPermissionDeniedDialog(context);
      }
      return false;
    }
  }

  /// Show permission denied dialog
  static void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Permission Required'),
        content: const Text(
          'This app needs camera access to capture receipt photos. '
          'Please grant camera permission in your device settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show storage permission info (for older Android versions)
  static void showStoragePermissionInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Storage Permission'),
        content: const Text(
          'This app needs storage access to save receipt images. '
          'Please grant storage permission when prompted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
