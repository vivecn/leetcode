import "1417. Reformat The String.dart";

void main(List<String> args) {
  for (var test in tests) {
    print(solution.reformat(test));
  }
}

final solution = new Solution();

const tests = ["a0b1c2", "leetcode", "1229857369", "a0b1c2"];
