import 'package:flutter/material.dart';
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
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  var history = HistoryState();
  int dailyGoal = 0;
  int weeklyGoal = 0;
  String username = "User";

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
              "Welcome, $username\n\nYour current goals:\n",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Center(
            child: Text(
              "Weekly goal: $weeklyGoal\n"
                  "Daily goal: $dailyGoal",
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextBoxDialogButton(
            buttonText: "Log Steps", 
            dialogTitle: "Log Steps", 
            textBoxHint: "Enter steps...",
            dialogActions: [
              DialogAction("Submit", (TextEditingController t) {
                int? steps = int.tryParse(t.text);
                if (steps != null) history.addData(steps);
              }),
              DialogAction("Cancel", null)
            ],
          ),
          TextBoxDialogButton(
            buttonText: "Change/Set Goals", 
            dialogTitle: "Change/Set Goals", 
            textBoxHint: "Enter new goal...",
            dialogActions: [
              DialogAction("Daily Goal", (TextEditingController t) {
                setState(() {
                  dailyGoal = int.tryParse(t.text) ?? dailyGoal;
                });
              }),
              DialogAction("Weekly Goal", (TextEditingController t) {
                setState(() {
                  weeklyGoal = int.tryParse(t.text) ?? weeklyGoal;
                });
              }),
              DialogAction("Cancel", null)
            ],
          ),
          Button(
            buttonText: "History",
            onPressed: (BuildContext context) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Testing(),));
            },
          ),
          DialogButton(
            buttonText: "Recommendations",
            dialogTitle: "Recommendations",
          ),
          DialogButton(
            buttonText: "Weekly Report",
            dialogTitle: "Weekly Report",
          ),
        ],
      ),
    );
  }
}