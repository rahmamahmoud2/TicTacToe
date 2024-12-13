import 'package:flutter/material.dart';

class Playing extends StatefulWidget {
  const Playing({super.key});

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  Color primarycolor = const Color.fromARGB(255, 119, 215, 59);
  Color secondrycolor = const Color.fromARGB(255, 45, 44, 44);
  List<String> grid = List.filled(9, '', growable: false);
  String currentPlayer = 'X';
  String gameStatus = 'player x turn';

  void onTapped(int index) {
    if (grid[index] != '') return;

    setState(() {
      grid[index] = currentPlayer;
      if (winner()) {
        gameStatus = 'Player $currentPlayer Wins!';
      } else if (!grid.contains('')) {
        gameStatus = 'Draw!';
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        gameStatus = 'Player $currentPlayer turn';
      }
    });
  }

  bool winner() {
    List<List<int>> winPattern = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var pattern in winPattern) {
      if (grid[pattern[0]] == currentPlayer &&
          grid[pattern[1]] == currentPlayer &&
          grid[pattern[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    setState(() {
      grid = List.filled(
        9,
        '',
      );
      currentPlayer = 'X';
      gameStatus = 'player x turn';
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/download12.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                gameStatus,
                style: TextStyle(fontSize: 35, color: primarycolor),
              ),
            ),
            Container(
              width: width * 0.75,
              height: height * 0.45,
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                children: List.generate(9, (index) {
                  return GestureDetector(
                    onTap: () {
                      onTapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: primarycolor,
                                blurRadius: 3,
                                offset: Offset(5, 9))
                          ],
                          color: secondrycolor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          grid[index],
                          style: TextStyle(
                              color: primarycolor,
                              decorationColor: primarycolor,
                              fontSize: 50,
                              fontFamily: 'fonto',
                              shadows: [
                                Shadow(
                                    color: primarycolor,
                                    blurRadius: 3,
                                    offset: Offset(2, 3))
                              ]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: secondrycolor,
                    fixedSize: Size(width * 0.4, height * 0.07),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  resetGame();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Play Again',
                      style: TextStyle(color: primarycolor),
                    ),
                    Icon(
                      Icons.restart_alt_sharp,
                      color: primarycolor,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
