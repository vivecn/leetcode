import 'dart:math';

class Solution {
  int maxChunksToSorted(List<int> arr) {
    var found = 0;
    var nowFind = 0;
    var maxFound = 0;
    final res = <List<int>>[];
    var chunk = <int>[];

    for (var i = 0; i < arr.length; i++) {
      chunk.add(arr[i]);
      found += 1 << arr[i];
      maxFound = max(maxFound, arr[i]);
      if (pow(2, maxFound + 1) - 1 == found) {
        res.add([...chunk]);
        chunk = [];
        nowFind = maxFound + 1;
      }
    }

    return res.length;
  }
}
