class Solution {
  bool isFlipedString(String s1, String s2) {
    if (s1.length != s2.length) return false;

    String s = s2 + s2;
    if (s.contains(s1)) {
      return true;
    }

    return false;
  }
}
