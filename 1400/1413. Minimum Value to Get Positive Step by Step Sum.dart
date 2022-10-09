class Solution {
  int minStartValue(List<int> nums) {
    var preNums = <int>[];
    var sum = 0;
    for (var i = 0; i < nums.length; i++) {
      sum += nums[i];
      preNums.add(sum);
    }

    final min =
        preNums.reduce((value, element) => value < element ? value : element);
    return min > 0 ? 1 : -min + 1;
  }
}
