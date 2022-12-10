/// Пакет для хо
/// 
import "dart:io";
/// Класс для управления таблицей игры в крестики-нолики
class XO {
  /// размер таблицы
  final int _size;          
  /// таблица с  возможныи значениями:
  late List<List> _table; 
  /// пусто
  static const empty = '-';
  /// крестик 
  static const x = 'x';
  /// нолик
  static const o = 'o';
  /// Инициализация таблицы
  XO(int scale) : _size = scale {
    _table =
        List.generate(_size, (i) => List.filled(_size, empty, growable: false));
  }
  /// Вывод таблицы в консоль
  @override
  String toString() {
    var out = StringBuffer();

    for (var i = 0; i < _size; i++) {
      for (var j = 0; j < _size; j++) {
        out.write(' ${_table[i][j]}');
      }
      out.write('\n');
    }

    return out.toString();
  }
  /// Поставить х или о в заданную позицию
  bool setLetter(int row, int col, String letter) {
    if (_table[row][col] != empty) {
      return false;
    }

    _table[row][col] = letter;
    return true;
  }
  /// Таблица заполнена полностью?
  bool tableIsFull() {
    for (var i = 0; i < _size; i++) {
      for (var j = 0; j < _size; j++) {
        if (_table[i][j] == empty) {
          return false;
        }
      }
    }

    return true;
  }
  /// Проверить ряды
  bool checkRows(String letter) {
    for (var row = 0; row < _size; row++) {
      var count = 0;
      for (var col = 0; col < _size; col++) {
        if (_table[row][col] == letter) {
          count++;
        }
      }

      if (count == _size) {
        return true;
      }
    }

    return false;
  }
  /// Проверить колонки
  bool checkColumns(String letter) {
    for (var col = 0; col < _size; col++) {
      var count = 0;
      for (var row = 0; row < _size; row++) {
        if (_table[row][col] == letter) {
          count++;
        }
      }

      if (count == _size) {
        return true;
      }
    }

    return false;
  }
  /// Проверить диагональ
  bool checkDiagonal(String letter) {
    var count = 0;
    for (var i = 0; i < _size; i++) {
      if (_table[i][i] == letter) {
        count++;
      }
    }

    if (count == _size) {
      return true;
    }

    return false;
  }
  /// Проверить вторую диагональ
  bool check2Diagonal(String letter) {
    var count = 0;
    for (var i = 0; i < _size; i++) {
      if (_table[_size - i - 1][i] == letter) {
        count++;
      }
    }

    if (count == _size) {
      return true;
    }

    return false;
  }
  /// Проверить на выигрыш
  bool checkWin(String letter) {
    if ((checkRows(letter) == true) ||
        (checkColumns(letter) == true) ||
        (checkDiagonal(letter) == true) ||
        (check2Diagonal(letter) == true)) {
      return true;
    }

    return false;
  }
}
/// Класс-помошник
class Helper {
  /// Ввод через консоль целого из заданного диапазона
  int input(int min, int max) {
    int n;
    while (true) {
      String? s = stdin.readLineSync();
      if (s != null) {
        n = int.tryParse(s) ?? -1;
        if (n == -1) {
          stdout.write('$s не может быть преобразовано. Введите число :');
          continue;
        }

        if ((n <= max) && (n >= min)) {
          break;
        } else {
          stdout.write('$s - вне допустимого диапазона. Введите число :');
          continue;
        }
      }
    }

    return n;
  }
}
