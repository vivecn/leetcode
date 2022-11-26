export function reachableNodes(
  edges: number[][],
  maxMoves: number,
  /** the number of nodes */
  n: number
): number {
  let res = 0;
  const dist: number[] = Array(n).fill(Infinity);
  const graph: number[][] = Array(n)
    .fill(0)
    .map(() => Array(n).fill(Infinity));

  const initGraph = () => {
    for (const [n, v, cnt] of edges) {
      graph[n][v] = graph[v][n] = cnt + 1;
    }
  };

  const dijkstra = () => {
    dist[0] = 0;
    let visted: boolean[] = Array(n).fill(false);
    for (let i = 0; i < n; i++) {
      let t = -1;
      for (let j = 0; j < n; j++) {
        if (!visted[j] && (t === -1 || dist[j] < dist[t])) {
          t = j;
        }
      }

      visted[t] = true;

      for (let j = 0; j < n; j++) {
        dist[j] = Math.min(dist[j], graph[t][j] + dist[t]);
      }
    }
  };

  const calculate = () => {
    res += dist.filter((val) => val <= maxMoves).length;

    edges.forEach(([u, v, cnt]) => {
      res += Math.min(
        Math.max(maxMoves - dist[u], 0) + Math.max(maxMoves - dist[v], 0),
        cnt
      );
    });
  };

  initGraph();
  dijkstra();
  calculate();

  return res;
}
