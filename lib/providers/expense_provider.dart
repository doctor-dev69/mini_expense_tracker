import 'dart:convert';
import 'package:flutter/foundation.dart' hide Category;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> _expenses = [];
  bool _isLoading = true;

  List<Expense> get expenses => [..._expenses];
  bool get isLoading => _isLoading;

  static const String _storageKey = 'saved_expenses';

  ExpenseProvider() {
    _loadExpensesFromPrefs();
  }

  // Load from SharedPreferences
  Future<void> _loadExpensesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_storageKey);

    if (jsonString != null && jsonString.isNotEmpty) {
      final List<dynamic> decoded = jsonDecode(jsonString);
      _expenses = decoded.map((item) => Expense.fromMap(item)).toList();
    } else {
      // Default dummy data for initial run
      _expenses = [
        Expense(
          id: const Uuid().v4(),
          title: 'Grocery Shopping',
          amount: 45.50,
          category: Category.food,
          date: DateTime.now().subtract(const Duration(days: 1)),
        ),
        Expense(
          id: const Uuid().v4(),
          title: 'Bus Pass',
          amount: 15.00,
          category: Category.transport,
          date: DateTime.now(),
        ),
      ];
      _saveExpensesToPrefs();
    }

    _isLoading = false;
    notifyListeners();
  }

  // Save to SharedPreferences
  Future<void> _saveExpensesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_expenses.map((e) => e.toMap()).toList());
    await prefs.setString(_storageKey, encoded);
  }

  double get totalExpenses {
    return _expenses.fold(0.0, (sum, item) => sum + item.amount);
  }

  void addExpense({
    required String title,
    required double amount,
    required Category category,
    required DateTime date,
  }) {
    final newExpense = Expense(
      id: const Uuid().v4(),
      title: title,
      amount: amount,
      category: category,
      date: date,
    );
    _expenses.insert(0, newExpense);
    _saveExpensesToPrefs();
    notifyListeners();
  }

  void updateExpense({
    required String id,
    required String title,
    required double amount,
    required Category category,
    required DateTime date,
  }) {
    final index = _expenses.indexWhere((e) => e.id == id);
    if (index != -1) {
      _expenses[index] = Expense(
        id: id,
        title: title,
        amount: amount,
        category: category,
        date: date,
      );
      _saveExpensesToPrefs();
      notifyListeners();
    }
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    _saveExpensesToPrefs();
    notifyListeners();
  }
}
