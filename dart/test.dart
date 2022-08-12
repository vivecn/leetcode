import "1282. Group the People Given the Group Size They Belong To.dart";

void main(List<String> args) {
  for (var test in tests) {
    print(solution.groupThePeople(test));
  }
}

final solution = new Solution();

const tests = [
  [3, 3, 3, 3, 3, 1, 3],
  [2, 1, 3, 3, 3, 2]
];
