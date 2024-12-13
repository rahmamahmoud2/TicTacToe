
  // void onTap(int index) {
  //   if (gameshape[index] != '') {
  //     return;
  //   }
  //   setState(() {
  //     gameshape[index] = currentPlayer;
  //     if (currentPlayer == 'X') {
  //       currentPlayer = 'O';
  //       gameStatus = 'player O turn';
  //     } else {
  //       currentPlayer = 'X';
  //       gameStatus = 'player X turn';
  //     }
  //   });
  // }

  // bool winner() {
  //   List<List<int>> winPattern = [
  //     [0, 1, 2],
  //     [3, 4, 5],
  //     [6, 7, 8],
  //     [0, 3, 6],
  //     [1, 4, 7],
  //     [2, 5, 8],
  //     [0, 4, 8],
  //     [2, 4, 6],
  //   ];
  //     for (var pattern in winPattern) {
  //     if (gameshape[pattern[0]] == currentPlayer &&
  //         gameshape[pattern[1]] == currentPlayer &&
  //         gameshape[pattern[2]] == currentPlayer) {
  //       return true; 
  //     }
  //   }
  //   return false;
  // }
  //   void resetGame() {
  //     setState(() {
  //       gameshape = List.filled(9, '', );
  //       currentPlayer = 'X';
  //       gameStatus = 'player x turn';
  //     });
  //   }
  