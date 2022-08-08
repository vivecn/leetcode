function makeLargestSpecial(s: string): string {
  if (s.length <= 2) {
    return s;
  }

  const res: Array<string> = [];
  let cnt = 0;
  let left = 0;

  for (let i = 0; i < s.length; i++) {
    if (s[i] === "1") {
      cnt++;
    } else if (s[i] === "0") {
      cnt--;
      if (cnt === 0) {
        res.push(`1${makeLargestSpecial(s.slice(left + 1, i))}0`);
        left = i + 1;
      }
    }
  }

  res.sort((a, b) => (b > a ? 1 : -1));
  return res.join("");
}
