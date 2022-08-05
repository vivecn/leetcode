export function orderlyQueue(s: string, k: number): string {
  let res = "";
  if (k === 1) {
    res = s;
    const sArr = s.split("");
    for (let i = 0; i < s.length; i++) {
      sArr.push(sArr?.shift() ?? "");
      if (compare(res, sArr.join(""))) {
        res = sArr.join("");
      }
    }
  } else {
    res = s
      .split("")
      .sort((a, b) => (a > b ? 1 : -1))
      .join("");
  }

  return res;
}

function compare(s1: string, s2: string): boolean {
  if (s1.length !== s2.length) {
    return false;
  }
  const { length } = s1;
  for (let i = 0; i < length; i++) {
    if (s1[i] > s2[i]) {
      return true;
    } else if (s1[i] < s2[i]) {
      return false;
    }
  }

  return false;
}
const tests = [
  ["cba", 1],
  ["baaca", 3],
];

for (const test of tests) {
  console.log(orderlyQueue(test[0], test[1]));
}
