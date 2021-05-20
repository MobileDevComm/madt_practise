import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 200,
                color: Colors.grey.shade200,
              ),
              Container(
                height: 1,
                color: Colors.grey.shade400,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          child: Icon(
                            Icons.backspace_outlined,
                            size: 32,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            DialButton(
                              number: "1",
                              alphabet: "oo",
                            ),
                            DialButton(
                              number: "2",
                              alphabet: "ABC",
                            ),
                            DialButton(
                              number: "3",
                              alphabet: "DEF",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            DialButton(
                              number: "4",
                              alphabet: "GHI",
                            ),
                            DialButton(
                              number: "5",
                              alphabet: "JKL",
                            ),
                            DialButton(
                              number: "6",
                              alphabet: "MNO",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            DialButton(
                              number: "7",
                              alphabet: "PQRS",
                            ),
                            DialButton(
                              number: "8",
                              alphabet: "STUW",
                            ),
                            DialButton(
                              number: "9",
                              alphabet: "XYZ",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Align(
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(
                                Icons.call,
                                size: 32,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(32)),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialButton extends StatelessWidget {
  final String number;
  final String alphabet;

  DialButton({this.number = "1", this.alphabet = "oo"});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(number),
            Text(alphabet),
          ],
        ),
      ),
    );
  }
}
