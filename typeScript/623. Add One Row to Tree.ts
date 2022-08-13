import { TreeNode } from "./types/TreeNode";

function addOneRow(
  root: TreeNode | null,
  val: number,
  depth: number
): TreeNode | null {
  if (root === null || depth < 1) {
    return null;
  }

  if (depth === 1) {
    const newRoot = new TreeNode(val);
    newRoot.left = root;
    return newRoot;
  }

  const nodes: Array<TreeNode> = [];
  findDepthNodes(nodes, root, 2, depth);
  for (const node of nodes) {
    addNode(node, val);
  }
  return root;
}

function findDepthNodes(
  nodes: Array<TreeNode>,
  root: TreeNode,
  depth: number,
  targetDepth: number
) {
  if (depth === targetDepth) {
    nodes.push(root);
    return;
  }
  if (depth < targetDepth) {
    root.left && findDepthNodes(nodes, root.left, depth + 1, targetDepth);
    root.right && findDepthNodes(nodes, root.right, depth + 1, targetDepth);
  }
  return;
}

function addNode(node: TreeNode, val: number) {
  const rNode: TreeNode = new TreeNode(val);
  const lNode: TreeNode = new TreeNode(val);
  if (node.left) {
    lNode.left = node.left;
  }
  node.left = lNode;

  if (node.right) {
    rNode.right = node.right;
  }
  node.right = rNode;
}
