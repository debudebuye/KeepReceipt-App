import 'package:equatable/equatable.dart';

/// Receipt entity - core business object
class Receipt extends Equatable {
  final String id;
  final String storeName;
  final double amount;
  final DateTime date;
  final String category;
  final String? notes;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Receipt({
    required this.id,
    required this.storeName,
    required this.amount,
    required this.date,
    required this.category,
    this.notes,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        storeName,
        amount,
        date,
        category,
        notes,
        imagePath,
        createdAt,
        updatedAt,
      ];
}
