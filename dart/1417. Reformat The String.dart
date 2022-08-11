class Solution {
  String reformat(String s) {
    /// 1. find the number of lowcase letters [m] and digits [n]
    /// 2. if abs(m-n)>1, return an empty string
    /// 3. else permutate
    final digits = <String>[];
    final letters = <String>[];

    for (var i = 0; i < s.length; i++) {
      if (num.tryParse(s[i]) != null) {
        digits.add(s[i]);
      } else {
        letters.add(s[i]);
      }
    }

    if ((digits.length - letters.length).abs() > 1) {
      return '';
    }

    if (digits.length > letters.length) {
      return permutate(digits, letters);
    } else {
      return permutate(letters, digits);
    }
  }

  String permutate(List<String> s1, List<String> s2) {
    final res = <String>[];
    for (var i = 0; i < s1.length; i++) {
      res.add(s1[i]);
      if (i == s2.length) break;
      res.add(s2[i]);
    }

    return res.join("");
  }
}
