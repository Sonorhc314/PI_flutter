import 'package:flutter/material.dart';

class HistoryState extends ChangeNotifier {//stores current history data
  static var history = <List<int>>[]; //Array storing history in format [dd,mm,yyyy,steps,stepsChangeFromPreviousDay]
  var prev = 0;
  
  bool addData(int val) {
    int diff;
    if (history.isNotEmpty) {
      diff = val - prev;
    } else {
      diff = 0;
    }
    history.add([
      DateTime.now().day,
      DateTime.now().month,
      DateTime.now().year,
      val,
      diff,
    ]);
    prev = val;
    //notifyListeners(); //Originally planned to use some other method(but it didnt work)
    return true;
  }
}
class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = HistoryState.history;
    
    var greenText = TextStyle(fontSize: 18, color:Colors.green[300]);
    var redText = TextStyle(fontSize: 18, color:Colors.red[300]);
    var titleText = const TextStyle(fontSize:32, color: Colors.white);
    var normalText = const TextStyle(fontSize:18, color: Colors.white);
    /*var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );
    var style2 = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.primary,
    );
    var redText = theme.textTheme.displaySmall!.copyWith(
      color: Colors.red[300],
    );
    var greenText = theme.textTheme.displaySmall!.copyWith(
      color: Colors.green[300],
    );*/
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child:
              Text("History")),
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
                        //Container(margin: EdgeInsetsDirectional.only(start:1,end:1),height: 100,color:Colors.blue,),
                        for (var thing in appState.reversed)
                          SizedBox(width:300, child: Text(
                              "${thing[0]}/${thing[1]}/${thing[2]}",
                              textAlign: TextAlign.center,
                              style:normalText
                            )
                          ),//Date
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
                        //Divider(),
                        for (var thing in appState.reversed)
                          SizedBox(width:200, child: Text(
                              thing[3].toString(),
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
                        SizedBox(width:200, child: Text("Difference", textAlign: TextAlign.center, style:titleText)),
                        const SizedBox(height:10),
                        //Divider(),
                        for (var thing in appState.reversed)
                          SizedBox(width:200,child:Text(
                              (thing[4] > 0 ? '+':'')+thing[4].toString(),
                              textAlign: TextAlign.center,
                              style: thing[4] >= 0 ? greenText:redText
                            )
                          )
                      ],
                    ),
                  )

                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width:200, child: Text("Date", style:style)),
                      SizedBox(width:200, child: Text("Steps", style:style)),
                      SizedBox(width:200, child: Text("Difference", style:style)),
                    ]
                  ),
                  Divider(),
                  for (var thing in appState.history.reversed) IntrinsicHeight(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width:200, child: Text("${thing[0]}/${thing[1]}/${thing[2]}",style:style2)),
                          VerticalDivider(),
                          SizedBox(width:200, child: Text(thing[3].toString(),style:style2)),
                          VerticalDivider(),
                          SizedBox(width:200,child:Text((thing[4] > 0 ? '+':'')+thing[4].toString(),style: thing[4] >= 0 ? greenText:redText)
                        ),]),
                  ),
                */],
              ),
            ),
          ],
        ),
      ),
    );
  }
}