import "./1700/1784. Check if Binary String Has at Most One Segment of Ones.dart";

void main(List<String> args) {
  for (var test in tests) {
    print(solution.checkOnesSegment(test));
  }
}

final solution = new Solution();

const tests = ["1001", '1110', '100011111'];
