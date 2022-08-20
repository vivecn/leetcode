import '../types/TreeNode.dart';

class Solution {
  TreeNode? constructMaximumBinaryTree(List<int> nums) {
    if (nums.length == 0) {
      return null;
    }
    var maxVal = -1;
    nums.forEach((e) {
      if (e >= maxVal) maxVal = e;
    });
    final index = nums.indexOf(maxVal);
    final root = TreeNode(maxVal);
    root.left = constructMaximumBinaryTree(nums.sublist(0, index));
    root.right = constructMaximumBinaryTree(nums.sublist(index + 1));
    return root;
  }
}
