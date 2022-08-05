const ALPHABET = "abcdefghijklmnopqrstuvwxyz";

function generateTheString(n: number): string {
  let res = "";

  if (n % 2 === 1) {
    for (let i = 0; i < n; i++) {
      res += "a";
    }
  }

  if (n % 2 === 0) {
    let m = n / 2;
    let a: number, b: number;

    if (m % 2 !== 1) {
      a = m + 1;
      b = m - 1;
    } else {
      a = b = m;
    }

    for (let i = 0; i < a; i++) {
      res += "a";
    }

    for (let i = 0; i < b; i++) {
      res += "b";
    }
  }

  return res;
}
