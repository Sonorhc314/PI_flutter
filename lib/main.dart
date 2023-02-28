import 'package:flutter/material.dart';
import 'package:flutter_first/button.dart';
import 'package:flutter_first/history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("PI application"),
          ),
        ),
        body: Center(
          child: MyClass(),
        ),
      ),
    );
  }
}

class MyClass extends StatefulWidget {
  @override
  State<MyClass> createState() => _Home();
}

class _Home extends State<MyClass> {
  var history = HistoryState();
  String goalDay = "0";
  String goalWeek = "0";
  String username = "user";
  final _textController = TextEditingController();

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
              "Weekly goal: $goalWeek\n"
                  "Daily goal: $goalDay",
              style: const TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Button(
            Title: 'Log in number of steps',
            Content: 'Custom content',
            child: const Text('Log in number of steps'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context)=> AlertDialog(
                  title: const Text('Log in number of steps'),
                  content: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        hintText: "Number of steps",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                            },
                            icon: const Icon(Icons.clear))
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        history.addData(int.parse(_textController.text));
                        Navigator.pop(context, 'OK');},
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              );
              // reRenderThePage() {
            },
          ),
          Button(
            Title: 'Your goal',
            Content: 'Custom content',
            child: const Text("Change/set the goal"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context)=> AlertDialog(
                  title: const Text("Enter the goal"),
                  content: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        hintText: "Enter new goal",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                            },
                            icon: const Icon(Icons.clear))
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {goalWeek = _textController.text;});
                        Navigator.pop(context, 'OK');},
                      child: const Text('Weekly goal'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {goalDay = _textController.text;});
                        Navigator.pop(context, 'OK');},
                      child: const Text('Daily goal'),
                    ),
                  ],
                ),
              );
              // reRenderThePage() {
            },
          ),
          Button(
            Title: 'Custom Title',
            Content: 'Custom content',
            child: Text("History"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Testing(),));
            },
          ),
          Button(
            Title: 'Recommendations',
            Content: 'Custom content',
            child: Text("Recommendations"),
          ),
          Button(
            Title: 'Weekly report',
            Content: 'Custom content',
            child: Text("Weekly report"),
          ),
        ],
      ),
    );
  }
}