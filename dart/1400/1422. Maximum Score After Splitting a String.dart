import 'dart:math';

class Solution {
  int maxScore(String s) {
    var n = 0;
    var m = s[0] == '0' ? 1 : 0;

    for (var i = 1; i < s.length; i++) {
      if (s[i] == '1') {
        n++;
      }
    }

    var res = m + n;
    for (var i = 1; i < s.length - 1; i++) {
      if (s[i] == '1') {
        n--;
      }
      if (s[i] == '0') {
        m++;
      }
      res = max(m + n, res);
    }

    return res;
  }
}
