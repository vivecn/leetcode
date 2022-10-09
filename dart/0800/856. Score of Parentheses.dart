import 'dart:math';

class Solution {
  int scoreOfParentheses(String s) {
    var stack = [0];
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        stack.add(0);
      } else {
        var v = stack.removeLast();
        var top = stack.removeLast() + max<int>(v * 2, 1);
        stack.add(top);
      }
    }

    return stack.removeLast();
  }
}
