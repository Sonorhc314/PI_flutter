import 'package:flutter/material.dart';
import 'package:flutter_first/user_data.dart';

class History extends StatelessWidget {
  History({super.key, required this.userData});

  // User data to be displayed in the table
  final UserData userData;

  // Text colours for history table
  final greenText = TextStyle(fontSize: 18, color:Colors.green[300]);
  final redText = TextStyle(fontSize: 18, color:Colors.red[300]);
  final titleText = const TextStyle(fontSize:32, color: Colors.white);
  final normalText = const TextStyle(fontSize:18, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("History")
          ),
        ),
        body: ListView(
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:200, child: Text("Date", textAlign: TextAlign.center, style:titleText)),
                        const SizedBox(height:10),
                        for (DataEntry entry in userData.entries.reversed)
                          SizedBox(width:300, child: Text(
                              "${entry.date.day}/${entry.date.month}/${entry.date.year}",
                              textAlign: TextAlign.center,
                              style:normalText
                            )
                          ),
                      ]
                    )
                  ),
                  VerticalDivider(thickness: 1, color: Theme.of(context).secondaryHeaderColor,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:200, child: Text("Steps", textAlign: TextAlign.center, style:titleText)),
                        const SizedBox(height:10),
                        for (DataEntry entry in userData.entries.reversed)
                          SizedBox(width:200, child: Text(
                              entry.steps.toString(),
                              textAlign: TextAlign.center,
                              style: normalText
                            )
                          ),
                      ],
                    )
                  ),
                  VerticalDivider(thickness: 1, color: Theme.of(context).secondaryHeaderColor,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:200, child: Text("Difference", textAlign: TextAlign.center, style: titleText)),
                        const SizedBox(height:10),
                        for (DataEntry entry in userData.entries.reversed)
                          SizedBox(
                            width:200,
                            child: Text(
                              (entry.difference > 0 ? '+' : '') + entry.difference.toString(),
                              textAlign: TextAlign.center,
                              style: entry.difference >= 0 ? greenText : redText
                            )
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}