import 'package:hive/hive.dart';
import '../../domain/entities/receipt.dart';

part 'receipt_model.g.dart';

@HiveType(typeId: 0)
class ReceiptModel extends Receipt {
  @HiveField(0)
  @override
  String get id => super.id;
  
  @HiveField(1)
  @override
  String get storeName => super.storeName;
  
  @HiveField(2)
  @override
  double get amount => super.amount;
  
  @HiveField(3)
  @override
  DateTime get date => super.date;
  
  @HiveField(4)
  @override
  String get category => super.category;
  
  @HiveField(5)
  @override
  String? get notes => super.notes;
  
  @HiveField(6)
  @override
  String get imagePath => super.imagePath;
  
  @HiveField(7)
  @override
  DateTime get createdAt => super.createdAt;
  
  @HiveField(8)
  @override
  DateTime get updatedAt => super.updatedAt;

  const ReceiptModel({
    required super.id,
    required super.storeName,
    required super.amount,
    required super.date,
    required super.category,
    super.notes,
    required super.imagePath,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ReceiptModel.fromEntity(Receipt receipt) {
    return ReceiptModel(
      id: receipt.id,
      storeName: receipt.storeName,
      amount: receipt.amount,
      date: receipt.date,
      category: receipt.category,
      notes: receipt.notes,
      imagePath: receipt.imagePath,
      createdAt: receipt.createdAt,
      updatedAt: receipt.updatedAt,
    );
  }

  Receipt toEntity() => this;
}
