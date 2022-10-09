import { TreeNode } from "../types/TreeNode";

export default function pruneTree(root: TreeNode | null): TreeNode | null {
  if (root === null) {
    return null;
  }

  // 剪枝
  root.left = pruneTree(root.left);
  root.right = pruneTree(root.right);

  // 如果是叶子节点且值为0, 将其剪掉
  if (root.left === null && root.right === null && root.val === 0) {
    return null;
  }

  return root;
}
