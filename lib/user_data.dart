// A singular entry in the user data table
class DataEntry {
  final DateTime date;
  final int steps;
  final int difference;

  DataEntry(this.date, this.steps, this.difference);
}

// Class to store all of a user's data
class UserData {
  // Add 2 weeks of data for testing
  UserData() {
    DateTime startDate = DateTime(2023, 2, 25);
    for (int i = 0; i < 14; i++) {
      entries.add(DataEntry(startDate.add(Duration(days: i)), 100, 0));
    }
  }

  // All data entries for this user
  List<DataEntry> entries = [];

  // Adds a new entry for the current date
  void addEntry(int steps) {
    entries.add(DataEntry(
      DateTime.now(), steps, 
      entries.isEmpty ? 0 : steps - entries.last.steps
    ));
  }

  // Gets the total amount of steps on days that satisfy a given condition
  int getTotal(bool Function(DateTime, DateTime) dateCondition, DateTime comparisonDate) {
    int total = 0;
    for (DataEntry entry in entries) {
      if (dateCondition(entry.date, comparisonDate)) {
        total += entry.steps;
      }
    }
    return total;
  } 

  // Checks if two DateTimes are the same day
  bool isSameDay(DateTime date1, DateTime date2) =>
    date1.day == date2.day && isSameMonth(date1, date2);

  // Checks if two DateTimes are the same month
  bool isSameMonth(DateTime date1, DateTime date2) => 
    date1.month == date2.month && isSameYear(date1, date2);
  
  // Checks if two DateTimes are the same year
  bool isSameYear(DateTime date1, DateTime date2) => date1.year == date2.year;
  
  // Checks if two DateTimes are the same week
  bool isSameWeek(DateTime date1, DateTime date2) {
    DateTime weekStart = DateTime(date1.year, date1.month, date1.day - date1.weekday + 1);
    DateTime weekEnd = DateTime(date1.year, date1.month, date1.day + 7 - date1.weekday + 1);
    bool sameWeek = date2.compareTo(weekStart) >= 0 && date2.compareTo(weekEnd) < 0;
    return sameWeek;
  }

  // Functions to get totals for the above conditions
  int getDailyTotal() => getTotal(isSameDay, DateTime.now());
  int getWeeklyTotal() => getTotal(isSameWeek, DateTime.now());
  int getMonthlyTotal() => getTotal(isSameMonth, DateTime.now());
  int getYearlyTotal() => getTotal(isSameYear, DateTime.now());
}