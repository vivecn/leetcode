import '../types/TreeNode.dart';

class Solution {
  int deepestLeavesSum(TreeNode? root) {
    final List<TreeNode> queue = [];
    List<TreeNode> tempQueue = [];
    int sum = 0;

    if (root == null) {
      return sum;
    }

    queue.add(root);

    while (queue.length > 0) {
      final node = queue.removeAt(0);
      sum += node.val;
      if (node.left != null) tempQueue.add(node.left!);
      if (node.right != null) tempQueue.add(node.right!);

      if (queue.length == 0) {
        if (tempQueue.length > 0) {
          queue.addAll(tempQueue);
          sum = 0;
          tempQueue = [];
        } else if (tempQueue.length == 0) {
          return sum;
        }
      }
    }

    return sum;
  }
}
