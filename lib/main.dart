import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app.dart';
import 'core/di/injection_container.dart';
import 'features/receipt/data/models/receipt_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ReceiptModelAdapter());
  
  // Initialize dependency injection
  await initializeDependencies();
  
  runApp(
    const ProviderScope(
      child: KeepReceiptApp(),
    ),
  );
}
