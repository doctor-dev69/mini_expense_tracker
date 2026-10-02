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

Screenshots:
<img width="367" height="797" alt="Image" src="https://github.com/user-attachments/assets/9462ea2b-3624-4487-8f71-e64ea125a71c" />
<img width="366" height="795" alt="Image" src="https://github.com/user-attachments/assets/7731cf8d-acb9-4a31-b504-c9ec77c98e8b" />
<img width="367" height="795" alt="Image" src="https://github.com/user-attachments/assets/3975a1d6-cd50-4bc7-a04e-19a5e5e1a805" />
<img width="362" height="797" alt="Image" src="https://github.com/user-attachments/assets/81051c97-2377-46be-b258-8a4530782c0b" />