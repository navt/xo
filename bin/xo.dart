import 'package:xo/xo.dart';
import 'dart:math';
import "dart:io";

// Последовательность работы приложения
void main(List<String> arguments) {
  int size = 3;

  XO tbl = XO(size);
  Helper helper = Helper();

  while (true) {
    // Ход человека 
    int row;
    int col;
    do {
      stdout.write('Введите номер строки :');
      row = helper.input(1, size);
      stdout.write('Введите номер столбца :');
      col = helper.input(1, size);
    } while (tbl.setLetter(row - 1, col - 1, XO.x) == false);

    print(tbl);

    // Человек выиграл?
    if (tbl.checkWin(XO.x) == true) {
      print('Вы выиграли!');
      break;
    }
    // Таблица заполнена полностью?
    if (tbl.tableIsFull() == true) {
      print('Таблица заполнена полностью.');
      break;
    }

    // Ход компьютера
    do {
      var random = Random();
      row = random.nextInt(size);
      col = random.nextInt(size);
    } while (tbl.setLetter(row, col, XO.o) == false);

    print(tbl);

    // Компьютер выиграл?
    if (tbl.checkWin(XO.o) == true) {
      print('Компьютер выиграл!');
      break;
    }
    // Таблица заполнена полностью?
    if (tbl.tableIsFull() == true) {
      print('Таблица заполнена полностью.');
      break;
    }
  }
}
