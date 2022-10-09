class Solution {
  bool canTransform(String start, String end) {
    if (start.length != end.length) return false;
    int i = 0, j = 0, n = start.length;

    toNext() {
      while (i < n && start[i] == 'X') i++;
      while (j < n && end[j] == 'X') j++;
    }

    while (i < n && j < n) {
      toNext();
      if (i == n || j == n) break;

      if (start[i] != end[j])
        return false;
      else if (start[i] == 'R' && i > j)
        return false;
      else if (start[i] == 'L' && i < j) return false;

      i++;
      j++;
    }

    toNext();

    return i == n && j == n;
  }
}
