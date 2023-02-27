import 'package:flutter/material.dart';

import 'history.dart';

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
              child:
              Text("PI application")),
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
  String goal = "";
  String username = "user";
  final _textController = TextEditingController();
  var history = HistoryState();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),

          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child:
               Center(
                child:
                  Text(
                  "Welcome, $username\nYour current goal: $goal",
                  style: const TextStyle(
                    fontSize: 23.0,
                  ),
                ),
          ),),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape:  RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                showDialog(context: context,
                    builder: (context)=> AlertDialog(
                      title: Text("Log duration"),
                      content: Text("---"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => {Navigator.pop(context, 'OK'), history.addData(100)},
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                );
              },
              child:
              Text("Click to log exercise".toUpperCase(), style: const TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
              onPressed: () {
                showDialog(context: context,
                  builder: (context)=> AlertDialog(
                    title: const Text("Enter the goal"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('Weekly goal'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context, 'OK');},
                        child: const Text('Daily goal'),
                      ),
                    ],
                  ),
                );
                // reRenderThePage() {
              },
              child: Text("Set/change the goal".toUpperCase()),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Testing(),));
              },
              child: Text("History".toUpperCase()),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
              onPressed: () {
                showDialog(context: context,
                  builder: (context)=> AlertDialog(
                    title: const Text("Personalised recommendations:"),
                    content: Text("---"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Recommendations".toUpperCase()),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ))),
              onPressed: () {

              },
              child: Text("Weekly report".toUpperCase()),
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 300, height: 50),
            child:
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context)=> AlertDialog(
                      title: const Text("Enter the goal"),
                      content: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: "Enter new username",
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
                            setState(() {username = _textController.text;});
                            Navigator.pop(context, 'OK');},
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  );
                  // reRenderThePage() {
                },
                child: const Text('Change username'),
              ),
          ),
        ],
      ),
    );
  }
}
