export class Solution {
  private static INIT_COLOR = 0;
  private static COLOR1 = 1;
  private static COLOR2 = 2;
  private static BASE_COLOR = 3;

  static possibleBipartition(n: number, dislikes: number[][]): boolean {
    const graph: number[][] = Array<number>(n + 1)
      .fill(0)
      .map(() => []);
    const colors: number[] = Array(n + 1).fill(this.INIT_COLOR);

    const dfs = (index: number, color: number) => {
      colors[index] = color;

      for (const p of graph[index]) {
        if (colors[p] !== 0 && colors[p] === color) {
          return false;
        }

        if (colors[p] === 0 && !dfs(p, this.BASE_COLOR ^ color)) {
          return false;
        }
      }

      return true;
    };

    for (const [a, b] of dislikes) {
      graph[a].push(b);
      graph[b].push(a);
    }

    for (let i = 1; i <= n; i++) {
      if (colors[i] === this.INIT_COLOR && !dfs(i, this.COLOR1)) {
        return false;
      }
    }

    return true;
  }
}
