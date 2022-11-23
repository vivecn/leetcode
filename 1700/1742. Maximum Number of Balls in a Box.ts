export class Solution {
  static countBalls(lowLimit: number, highLimit: number): number {
    const count: Record<number, number> = {};
    let res = 0;
    for (let i = lowLimit; i <= highLimit; i++) {
      const d = this.digitSum(i);
      count[d] = (count[d] ?? 0) + 1;
      if (res <  count[d] ) {
        res = count[d]  ;
      }
    }

    return res
  }

  static digitSum(num: number): number {
    let sum = 0;
    while (num > 0) {
      sum += num % 10;
      num = Math.floor(num / 10);
    }

    return sum;
  }
}
