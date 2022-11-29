export function minOperations(s: string): number {
  const char = ["0", "1"];
  let res = 0;
  
  s.split("").forEach((v, i) => {
    if (v !== char[i % 2]) {
      res++;
    }
  });

  return Math.min(res, s.length - res);
}
