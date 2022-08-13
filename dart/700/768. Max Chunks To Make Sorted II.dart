import 'dart:math';

class Solution {
  int maxChunksToSorted(List<int> arr) {
    final sortArr = [...arr]..sort(((a, b) => a - b));
    var prefixSumMap = Map<int, int>();
    var nowFound = sortArr[0];
    var found = 0;
    var maxFound = 0;
    final res = <List<int>>[];
    var chunk = <int>[];

    for (var i = 0; i < sortArr.length; i++) {
      found += sortArr[i];
      prefixSumMap[i] = found;
    }
    found = 0;

    for (var i = 0; i < arr.length; i++) {
      found += arr[i];
      maxFound = max(maxFound, arr[i]);
      chunk.add(arr[i]);
      if (found == prefixSumMap[i]) {
        nowFound = maxFound + 1;
        res.add([...chunk]);
        chunk = [];
      }
    }

    return res.length;
  }
}
