import 'package:flutter/material.dart';

void main()
{
  runApp(tictactoe());
}
class tictactoe extends StatefulWidget {
  const tictactoe({Key? key}) : super(key: key);

  @override
  _tictactoeState createState() => _tictactoeState();
}

class _tictactoeState extends State<tictactoe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                child: Container()),
            Expanded(
                flex: 3,
                child: Container()),
            Expanded(
                child: Container()),
          ],
        ),
      ),
    );
  }
}
