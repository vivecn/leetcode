import "0700/768. Max Chunks To Make Sorted II.dart";

void main(List<String> args) {
  for (var test in tests) {
    print(solution.monotonicStack(test));
  }
}

final solution = new Solution();

const tests = [
  [5, 4, 3, 2, 1],
  [2, 1, 3, 4, 4],
  [3, 1, 2],
  [1, 0, 1, 3, 2]
];
