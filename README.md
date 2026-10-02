# 📱 Mini Expense Tracker — Flutter Internship Day 1 Task

A clean, modern Flutter mobile application built for recording and managing personal expenses. Built as part of the Day 1 Practical Task for the Flutter Internship.

---

## ✨ Features

- **Dashboard**: High-level overview displaying the calculated total expenses and a list of recent transactions.
- **Add & Edit Expense**: Intuitive forms equipped with validation, date picker, and category selection.
- **Expense List**: Complete view of all recorded expenses.
- **Category Support**: Pre-defined expense categories (*Food, Transport, Bills, Entertainment, Shopping, Other*) with custom colors and icons.
- **Search & Filter**: Real-time keyword search and category filtering chips.
- **Delete Expense**: Ability to quickly remove unwanted records.
- **Local Persistence**: Integrated `shared_preferences` to persist expense records across app launches.

---

## 🛠️ Architecture & Structure

This project follows a clean **Provider-based Architecture** separating concerns into distinct layers:

```text
lib/
├── models/
│   └── expense.dart             # Data models, Enums & JSON serialization
├── providers/
│   └── expense_provider.dart    # State management & local storage handling
├── screens/
│   ├── dashboard_screen.dart        # Overview & metrics
│   ├── add_edit_expense_screen.dart # Form input & validation
│   └── expense_list_screen.dart     # List view with search & filters
├── widgets/
│   └── expense_tile.dart        # Reusable UI component for list items
└── main.dart                    # App root & Navigation Shell

⚙️ Dependencies & Versions
    Flutter SDK: >=3.0.0
    Dart SDK: >=3.0.0

Packages Used:
    provider: Simple, robust state management.
    shared_preferences: Key-value local persistence.
    intl: Currency and date formatting.
    uuid: Unique ID generation for expense records.

💡 What I Learned
    Managing application state efficiently using ChangeNotifier and Provider.
    Designing clean, user-friendly forms with GlobalKey<FormState> and custom validation rules.
    Serializing custom Dart objects (toMap / fromMap) to persist data as JSON strings in SharedPreferences.
    Structuring Flutter navigation with Material 3 NavigationBar and dynamic modal screens.

⚡ Problems Faced & Solutions
1: State Persistence Loss:

    Problem: In-memory data reset every time the app reloaded.
    Solution: Converted Expense objects into JSON maps and persisted them asynchronously using SharedPreferences.

2: Form Reusability:

    Problem: Duplicating UI code for adding and editing expenses.
    Solution: Merged both features into a single AddEditExpenseScreen widget by passing an optional expenseToEdit parameter.

🔮 Future Improvements
    Add chart visualizations (e.g., Pie charts using fl_chart) to analyze monthly category breakdown.
    Connect to backend / database services like Supabase or Firebase for cloud sync.
    Add dark mode theme support.
    Export transactions to CSV or PDF reports.