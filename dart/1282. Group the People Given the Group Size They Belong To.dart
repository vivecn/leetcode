class Solution {
  List<List<int>> groupThePeople(List<int> groupSizes) {
    final listMap = Map<int, List<int>>();
    final res = <List<int>>[];
    for (var i = 0; i < groupSizes.length; i++) {
      var size = groupSizes[i];
      if (listMap.containsKey(size)) {
        listMap[size]!.add(i);
      } else {
        listMap[size] = [i];
      }

      if (listMap[size]!.length == size) {
        res.add([...listMap[size]!]);
        listMap[size] = [];
      }
    }
    return res;
  }
}
