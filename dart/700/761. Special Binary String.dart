class Solution {
  String makeLargestSpecial(String s) {
    if (s.length <= 2) {
      return s;
    }

    var cnt = 0;
    var left = 0;
    List<String> res = [];
    for (var i = 0; i < s.length; i++) {
      if (s[i] == '1') {
        cnt++;
      } else if (s[i] == '0') {
        cnt--;
        if (cnt == 0) {
          res.add("1${makeLargestSpecial(s.substring(left + 1, i))}0");
          left = i + 1;
        }
      }
    }

    res.sort(((a, b) => b.compareTo(a)));
    return res.join("");
  }
}
