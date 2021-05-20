import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MySecondApp extends StatefulWidget {
  @override
  _MySecondAppState createState() => _MySecondAppState();
}

class _MySecondAppState extends State<MySecondApp> {
  String output = "";
  double var1 = 0;
  // double var2 = 0;
  String operator = '';
  bool holdOperator = false;
  bool var1set = false;
  final List<String> charactersList = [
    '\u00F7',
    'x',
    'b',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '=',
    '0',
    '.'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
              body: Column(
            children: [
              Container(
                color: Colors.grey.shade800,
                height: 200,
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: Expanded(
                  child: Text(
                    "$output",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.only(bottom: 32),
                  crossAxisCount: 4,
                  itemCount: charactersList.length,
                  itemBuilder: buttonBuilder,
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(
                      getAxisCellCount(charactersList[index])[0],
                      getAxisCellCount(charactersList[index])[1]),
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget buttonBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        _onButtonClicked(charactersList[index]);
      },
      child: new Container(
          color: getTileColor(charactersList[index]),
          child: new Center(
            child: charactersList[index] != "b"
                ? new Text(
                    '${charactersList[index]}',
                    style: TextStyle(fontSize: 24),
                  )
                : Icon(Icons.backspace_outlined),
          )),
    );
  }

  void _onButtonClicked(String char) {
    print("This is the number clicked: " + char);
    setState(() {
      if (holdOperator) output = '';
      switch (char) {
        case 'b':
          output = output.substring(0, output.length - 1);
          break;
        case '+':
          // output = output + char;
          operator = '+';
          holdOperator = true;
          if (!var1set) {
            var1 = double.parse(output);
            var1set = true;
          } else {
            var1 = _onCalculateResult(double.parse(output));
            output = var1.toString();
          }
          break;
        case '=':
          holdOperator = false;
          // output = output + char;
          output = _onCalculateResult(double.parse(output)).toString();
          var1set = false;
          break;
        case '0':
          output = output + char;
          break;
        default:
          output = output + char;
          break;
      }
    });
  }

  List<int> getAxisCellCount(String char) {
    List<int> cellCount = [1, 1]; // mainAxis, crossAxis
    switch (char) {
      case 'b':
        cellCount = [2, 1];
        break;
      case '=':
        cellCount = [1, 2];
        break;
      case '0':
        cellCount = [2, 1];
        break;
    }
    return cellCount;
  }

  Color getTileColor(String char) {
    Color tileColor = Colors.grey.shade200;
    switch (char) {
      case 'b':
      case 'x':
      case '\u00F7':
      case '-':
      case '+':
        tileColor = Colors.grey.shade400;
        break;
      case '=':
        tileColor = Colors.amber.shade700;
        break;
      default:
        tileColor = Colors.grey.shade200;
    }
    return tileColor;
  }

  double _onCalculateResult(double var2) {
    double result = 0.0;
    switch (operator) {
      case 'x':
        result = var1 * var2;
        break;
      case '\u00F7':
        result = var1 / var2;
        break;
      case '-':
        result = var1 - var2;
        break;
      case '+':
        result = var1 + var2;
        break;
    }
    return result;
  }
}
