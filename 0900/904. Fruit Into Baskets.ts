export class Solution {
  /** the number of your bucket */
  private static BUCKET = 2;

  static totalFruit(fruits: number[]): number {
    let left = 0;
    let right = 0;
    const map = new Map<number, number>();
    let res = 0;

    fruits;

    while (right < fruits.length) {
      map.set(fruits[right], (map.get(fruits[right]) ?? 0) + 1);
      right++;
      while (map.size > this.BUCKET) {
        // when can't pick the firut to yout bucket
        map.set(fruits[left], map.get(fruits[left])! - 1);
        if (map.get(fruits[left]) === 0) {
          map.delete(fruits[left]);
        }
        left++;
      }

      res = Math.max(res, right - left);
    }

    return res;
  }
}
