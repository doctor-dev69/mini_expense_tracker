import 'package:flutter/material.dart';

enum Category { food, transport, bills, entertainment, shopping, other }

extension CategoryExtension on Category {
  String get displayName {
    switch (this) {
      case Category.food:
        return 'Food';
      case Category.transport:
        return 'Transport';
      case Category.bills:
        return 'Bills';
      case Category.entertainment:
        return 'Entertainment';
      case Category.shopping:
        return 'Shopping';
      case Category.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case Category.food:
        return Icons.fastfood_rounded;
      case Category.transport:
        return Icons.directions_bus_rounded;
      case Category.bills:
        return Icons.receipt_long_rounded;
      case Category.entertainment:
        return Icons.movie_rounded;
      case Category.shopping:
        return Icons.shopping_bag_rounded;
      case Category.other:
        return Icons.category_rounded;
    }
  }

  Color get color {
    switch (this) {
      case Category.food:
        return Colors.orange;
      case Category.transport:
        return Colors.blue;
      case Category.bills:
        return Colors.redAccent;
      case Category.entertainment:
        return Colors.purple;
      case Category.shopping:
        return Colors.teal;
      case Category.other:
        return Colors.grey;
    }
  }
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  // Add these methods inside the Expense class in lib/models/expense.dart

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: (map['amount'] as num).toDouble(),
      category: Category.values[map['category']],
      date: DateTime.parse(map['date']),
    );
  }
}
