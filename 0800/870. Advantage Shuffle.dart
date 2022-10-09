class Solution {
  List<int> advantageCount(List<int> nums1, List<int> nums2) {
    int n = nums1.length;
    List<int> idx1 = List.filled(n, 0);
    List<int> idx2 = List.filled(n, 0);
    List<int> ans = List.filled(n, 0);

    for (var i = 0; i < n; i++) {
      idx1[i] = i;
      idx2[i] = i;
    }

    idx1.sort(((i, j) => nums1[i] - nums1[j]));
    idx2.sort(((i, j) => nums2[i] - nums2[j]));

    int left = 0, right = n - 1;
    for (var i = 0; i < n; i++) {
      if (nums1[idx1[i]] > nums2[idx2[left]]) {
        ans[idx2[left]] = nums1[idx1[i]];
        left++;
      } else {
        ans[idx2[right]] = nums1[idx1[i]];
        right--;
      }
    }
    return ans;
  }
}
