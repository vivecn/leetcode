/**
 * @link https://leetcode.cn/problems/champagne-tower/
 * @param poured the number of pourd champagne
 * @param query_row the i-th row (0-indexed)
 * @param query_glass the j-th glass (0-indexed)
 */
export class Solution {
  static champagneTower(
    poured: number,
    query_row: number,
    query_glass: number
  ): number {
    let row = [poured];
    for (let i = 1; i <= query_row; i++) {
      const nextRow = new Array(i + 1).fill(0);
      for (let j = 0; j < i; j++) {
        const volume = row[j];
        if (volume > 1) {
          nextRow[j] += (volume - 1) / 2;
          nextRow[j + 1] += (volume - 1) / 2;
        }
      }
      row = [...nextRow];
    }

    return row[query_glass] > 1 ? 1 : row[query_glass];
  }
}
