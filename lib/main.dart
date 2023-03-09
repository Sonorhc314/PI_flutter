import 'package:flutter/material.dart';

import 'package:flutter_first/user_data.dart';
import 'package:flutter_first/history.dart';

import 'package:flutter_first/button.dart';
import 'package:flutter_first/dialog_button.dart';
import 'package:flutter_first/text_box_button.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("PI Application"),
          ),
        ),
        body: const Center(
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Default state values
  int dailyGoal = 4000;
  int weeklyGoal = 30000;
  String username = "User";

  // Creates new user data table (later this can be fetched from database)
  final UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const SizedBox(height: 8),
          Center(
            child: Text(
              "Welcome, $username\n\nYour current progress:\n",
              style: const TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              "Daily progress: ${userData.getDailyTotal()}/$dailyGoal\n"
              "Weekly progress: ${userData.getWeeklyTotal()}/$weeklyGoal",
              style: const TextStyle(
                fontSize: 17.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          TextBoxDialogButton(
            buttonText: "Log Steps",
            textBoxHint: "Enter steps...",
            dialogActions: [
              DialogAction("Submit", (TextEditingController t) {
                int? steps = int.tryParse(t.text);
                if (steps != null && steps >= 0) {
                  setState(() => userData.addEntry(steps));
                }
              }),
              DialogAction("Cancel", null)
            ],
          ),
          TextBoxDialogButton(
            buttonText: "Change/Set Goals",
            textBoxHint: "Enter new goal...",
            dialogActions: [
              DialogAction("Daily Goal", (TextEditingController t) {
                int? newDailyGoal = int.tryParse(t.text);
                if (newDailyGoal != null && newDailyGoal >= 0) {
                  setState(() => dailyGoal = newDailyGoal);
                }
              }),
              DialogAction("Weekly Goal", (TextEditingController t) {
                int? newWeeklyGoal = int.tryParse(t.text);
                if (newWeeklyGoal != null && newWeeklyGoal >= 0) {
                  setState(() => weeklyGoal = newWeeklyGoal);
                }
              }),
              DialogAction("Cancel", null)
            ],
          ),
          Button(
            buttonText: "History",
            onPressed: (BuildContext context) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => History(userData: userData),
                  ));
            },
          ),
          DialogButton(
            buttonText: "Recommendations",
          ),
          DialogButton(
            buttonText: "Weekly Report",
          ),
        ],
      ),
    );
  }
}
