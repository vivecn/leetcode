class Solution {
  String solveEquation(String equation) {
    final left = Expression(0, 0);
    final right = Expression(0, 0);
    final m = equation.indexOf('=');

    iterateEquation(start: 0, end: m, exp: left, equation: equation);
    iterateEquation(
        start: m + 1, end: equation.length, exp: right, equation: equation);

    final x = left.x - right.x;
    final val = right.val - left.val;
    if (x == 0 && val != 0) {
      return 'No solution';
    }
    if (val == 0 && x == 0) {
      return 'Infinite solutions';
    }
    return 'x=${val ~/ x}';
  }

  void iterateEquation(
      {required int start,
      required int end,
      required Expression exp,
      required String equation}) {
    var sum = 0;
    var sign = 1;

    for (var i = start; i < end; i++) {
      if (equation[i] == '+') {
        exp.val += sign * sum;
        sign = 1;
        sum = 0;
      } else if (equation[i] == '-') {
        exp.val += sign * sum;
        sign = -1;
        sum = 0;
      } else if (equation[i] == 'x') {
        if (sum <= 0) {
          sum++;
        }

        exp.x += sum * sign;
        sum = 0;
      } else {
        final v = int.parse(equation[i]);
        sum *= 10;
        sum += v;
        if (sum == 0 && i < end - 1 && equation[i + 1] == 'x') {
          sum = -1;
        }
      }
    }
    if (sum != 0) {
      exp.val += sum * sign;
    }
  }
}

class Expression {
  int x;
  int val;

  Expression(this.x, this.val);
}
