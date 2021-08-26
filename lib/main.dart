//Tic Tac Toe App
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List<String> input = List.filled(9, '');
  bool turn = false;
  String winner = '';
  int xscore = 0;
  int oscore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Player X', style:
                              TextStyle(color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),),
                            ),
                            Text(xscore.toString(), style:
                            TextStyle(color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Player O', style:
                              TextStyle(color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),),
                            ),
                            Text(oscore.toString(), style:
                            TextStyle(color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),),
                          ],),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3
                        ), itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (turn && input[index] == '') {
                            setState(() {
                              input[index] = 'X';
                            });
                            turn = !turn;
                          }
                          else if (!turn && input[index] == '') {
                            setState(() {
                              input[index] = 'O';
                            });
                            turn = !turn;
                          }
                          checkWinner();
                          Score();

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)
                          ),
                          child: Center(
                            child: Text(input[index], style:
                            TextStyle(color: Colors.white, fontSize: 35),),
                          ),

                        ),
                      );
                    }),
                  )),
              Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              PlayAgain();
                            },
                            child: Container(
                              height: 55,width: 250,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text('Play Again',
                                style:GoogleFonts.allan(fontSize: 30,color: Colors.white),)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: ()
                            {
                              EndGame();
                            },
                            child: Container(
                              height: 55,width: 250,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(child: Text('End Game',
                                style:GoogleFonts.allan(fontSize: 30,color: Colors.white),)),
                            ),
                          ),
                        ],
                      ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  checkWinner() {
    if (input[0] == input[1] && input[0] == input[2] && input[0]!='') {
      setState(() {
        winner = input[0];
        PlayAgain();
      });
    }
    else if (input[0] == input[3] && input[0] == input[6]&& input[0]!='') {
      setState(() {
        winner = input[0];
        PlayAgain();
      });
    }
    else if (input[0] == input[4] && input[0] == input[8]&& input[0]!='') {
      setState(() {
        winner = input[0];
        PlayAgain();
      });
    }
    else if (input[1] == input[4] && input[1] == input[7]&& input[1]!='') {
      setState(() {
        winner = input[1];
        PlayAgain();
      });
    }
    else if (input[2] == input[5] && input[2] == input[8]&& input[2]!='') {
      setState(() {
        winner = input[2];
        PlayAgain();
      });
    }
    else if (input[2] == input[4] && input[2] == input[6]&& input[2]!='') {
      setState(() {
        winner = input[2];
        PlayAgain();
      });
    }
    else if (input[3] == input[4] && input[3] == input[5]&& input[3]!='') {
      setState(() {
        winner = input[3];
        PlayAgain();
      });
    }
    else if (input[6] == input[7] && input[6] == input[8]&& input[6]!='') {
      setState(() {
        winner = input[6];
        PlayAgain();
      });
    }
  }
  Score(){
    if(winner=='X')
      {
        xscore++;
        winner='l';
      }
    else if(winner=='O')
      {
        oscore++;
        winner='l';
      }
  }
  PlayAgain()
  {
    for(int i=0;i<input.length;i++)
      {
        setState(() {
          input[i]='';
        });
      }
  }
  EndGame(){
    for(int j=0;j<input.length;j++)
      {
        setState(() {
          input[j]='';
          xscore=0;
          oscore=0;
        });
      }
  }
}


