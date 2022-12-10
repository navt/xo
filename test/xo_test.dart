import 'package:xo/xo.dart' as xo;
import 'package:test/test.dart';

// $ dart test test/xo_test.dart
void main() {
  final size = 3;
  xo.XO ex = xo.XO(size);

  test('setLetter', () {
    expect(ex.setLetter(0, 0, xo.XO.x), equals(true));
    expect(ex.setLetter(0, 0, xo.XO.x), equals(false));
  });

  test('tableIsFull - 1', () {
    expect(ex.tableIsFull(), false);
  });

  test('checkColumns+check2Diagonal', (){
    ex.setLetter(1, 0, xo.XO.x);
    ex.setLetter(2, 0, xo.XO.x);
    expect(ex.checkColumns(xo.XO.x), true);
    ex.setLetter(1, 1, xo.XO.x);
    ex.setLetter(0, 2, xo.XO.x);
    expect(ex.check2Diagonal(xo.XO.x), true);
  });

  test('tableIsFull - 2', () {
    expect(ex.setLetter(0, 1, xo.XO.o), equals(true));
    expect(ex.setLetter(2, 1, xo.XO.o), equals(true));
    expect(ex.setLetter(1, 2, xo.XO.o), equals(true));
    expect(ex.setLetter(2, 2, xo.XO.o), equals(true));
    /*
    _table = [
      [xo.XO.x, xo.XO.o, xo.XO.x],
      [xo.XO.x, xo.XO.x, xo.XO.o],
      [xo.XO.x, xo.XO.o, xo.XO.o]
    ];
    */
    expect(ex.tableIsFull(), true);
  });
}
