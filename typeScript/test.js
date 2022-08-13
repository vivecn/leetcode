function makeLargestSpecial(s) {
  if (s.length <= 2) {
    return s;
  }
  var res = [];
  var cnt = 0;
  var left = 0;
  for (var i = 0; i < s.length; i++) {
    if (s[i] === "1") {
      cnt++;
    } else if (s[i] === "0") {
      cnt--;
      if (cnt === 0) {
        res.push("1".concat(makeLargestSpecial(s.slice(left + 1, i)), "0"));
        left = i + 1;
      }
    }
  }
  res.sort(function (a, b) {
    return b > a ? 1 : -1;
  });
  return res.join("");
}

const test = "11011000";

console.log(makeLargestSpecial(test));
