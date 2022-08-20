class Solution {
  int busyStudent(List<int> startTime, List<int> endTime, int queryTime) {
    return Traverse(startTime, endTime, queryTime);
  }

  int Traverse(List<int> startTime, List<int> endTime, int queryTime) {
    final count = Map<int, int>();
    for (var i = 0; i < startTime.length; i++) {
      for (var j = startTime[i]; j <= endTime[i]; j++) {
        if (!count.containsKey(j))
          count[j] = 1;
        else
          count[j] = count[j]! + 1;
      }
    }

    return count[queryTime] ?? 0;
  }
}
