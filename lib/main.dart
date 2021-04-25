import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
      theme:
          ThemeData(textTheme: TextTheme(bodyText2: TextStyle(fontSize: 25))),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double costpergram = 5;
  double costperhr = 35;
  double weight = 0;
  double time = 0;
  double totalcost = 0;
  double calculate() {
    totalcost = costpergram * weight + costperhr * time;
    return totalcost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          "3D Printing Cost Calculator",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: ListView(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            color: Colors.blueGrey[100],
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Material: ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'PLA ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.blueGrey[100],
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Cost Per Gram: ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText2,
                          initialValue: costpergram.toString(),
                          onChanged: (value) {
                            costpergram = double.parse(value);
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Cost Per Hour: '),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText2,
                          initialValue: costperhr.toString(),
                          onChanged: (value) {
                            costperhr = double.parse(value);
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Card(
            color: Colors.blueGrey[100],
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Weight in Grams: '),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText2,
                          onChanged: (value) {
                            weight = double.parse(value);
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Time in Hours: '),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodyText2,
                          onChanged: (value) {
                            time = double.parse(value);
                            setState(() {});
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Card(
            color: Colors.blueGrey[100],
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Total Cost '),
                      ),
                      Expanded(
                        child: Text(calculate().toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
